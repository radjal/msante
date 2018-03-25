<?php if (!defined('BASEPATH'))    exit('No direct script access allowed');
/**
 * This is a Token module for PyroCMS
 *
 * @author 		Jerel Unruh - PyroCMS Dev Team
 * @website		http://unruhdesigns.com
 * @package 	PyroCMS
 * @subpackage 	token Module
 */
class Token_m extends MY_Model
{
    private $_token_life_time = 3600; //1h seconds
    private $_token_morgue_time = 86000; // 1day
    
    public function __construct()
    {
        parent::__construct();
        $this->_table = 'tokens';
    }
    
    /** set search conditions for tokens listing
     * 
     * @param array $search array of search vars, usually from GET
     */
    public function _set_search($search)
    {
        if (!empty($search['id']))
            $this->db->like('tokens.id', $search['id'], 'after');
        if (!empty($search['token']))
            $this->db->like('tokens.token', $search['token'], 'after');
        if (!empty($search['ip']))
            $this->db->like('tokens.ip', $search['ip'], 'after');
        if (!empty($search['user_agent']))
            $this->db->like('tokens.user_agent', $search['user_agent'], 'after');
        if (!empty($search['counter']))
            $this->db->like('tokens.counter', $search['counter'], 'after');
        if (!empty($search['timestamp']))
            $this->db->like('tokens.timestamp', $search['timestamp'], 'after');
        if (!empty($search['alive']))
            $this->db->like('tokens.alive', $search['alive'], 'after');
        if (!empty($search['alive']))
            $this->db->like('tokens.alive', $search['alive'], 'after');
    }
    
    /**
     * create a new item
     * @param type $input
     * @return type
     */
    public function create($input) // not useful use get_token instead
    {
        $to_insert = array(
            'user_id' => $input['user_id'],
            'token' => $input['token']
        );
        
        log_message('error', 'DEPRECATED create token function');
        return $this->db->insert('tokens', $to_insert);
    }
    
    /** checks in DB if token exists and is alive
     * 
     * @param type $token
     * @param type $restrict_to_ua restrict search by UA and IP default TRUE
     * @return boolean 
     */
    public function check_token($token, $restrict_to_ua = true)
    {
        if ($restrict_to_ua) {
            $sql = "alive = '1' AND token = '$token' AND ip = '" . $this->input->ip_address() . "' AND user_agent = '" . $this->input->user_agent() . "'";
        } else {
            $sql = "alive = '1' AND token = '$token' ";
        }
        $this->db->select('COUNT(token) FROM ' . $this->db->dbprefix('tokens') . '');
        $this->db->where($sql);
        $res = $this->db->get()->row_array();
        $num = $res['COUNT(token)'];
        unset($res);
        if ($num == 0) 
        {
            return false; // false if no tokens 
        }
        $this->increment_token_count($token);  
        return true;
    }
    
    /** increment hit counter on token table
     * 
     * @param int $token
     * @return int new count value
     */
    public function increment_token_count($token)
    {
        //otherwise get token data to update count
        $this->db->select('counter');
        $this->db->where('token', $token);
        $res   = $this->db->get($this->db->dbprefix('tokens'))->row_array();
        $newcount = $res['counter'] + 1;
        //update counter
        $this->db->where('token', $token);
        $this->db->update($this->db->dbprefix('tokens'), array(
            'counter' => $newcount,
            'timestamp' => date("Y-m-d H:i:s")
        ));
        return $newcount;
    }

    /** sets expiry for a token
     * 
     * @param int $token
     * @param data $expires MySQL format
     * @return bool on result
     */
    public function set_token_expiry($token, $expires)
    {
        $data = array(
            'expires' => $expires,
            'timestamp' => date("Y-m-d H:i:s")
        );
        $this->db->where('token', $token);
        return $this->db->update($this->db->dbprefix('tokens'), $data);
    }
    
    /** flood check @todo inspect
     * 
     * @param int $token
     * @param bool $restrict_to_ua
     * @param in $min_time in seconds
     * @return boolean
     */
    public function flood_check($token, $restrict_to_ua = true, $min_time = 5)
    {
        if (empty($token))
            return false;
        
        $timelimit = date("Y-m-d H:i:s", time() - $min_time);
        
        if ($restrict_to_ua) {
            $sql = "alive = '1' AND token = '$token' AND ip = '" . $this->input->ip_address() . "' AND user_agent = '" . $this->input->user_agent() . "'";
        } else {
            $sql = "alive = '1' AND token = '$token' AND ip = '" . $this->input->ip_address() . "'";
        }
        
        $this->db->select('COUNT(token) FROM ' . $this->db->dbprefix('tokens') . '');
        $this->db->where($sql);
        
        $this->db->where('timestamp <=', $timelimit);
        
        $res = $this->db->get()->row_array();
        $num = $res['COUNT(token)'];
        unset($res);
        $this->increment_token_count($token);
        if ($num == 0)
            return false; // false if no results
        // returns result so is ok
        return true;
    }
    
    /** DEPRECATED use check_token()
     * 
     * @param type $token
     * @param type $restrict_to_ua
     * @param type $min_time
     * @return boolean
     */
    /**
    public function tokenFloodCheck($token, $restrict_to_ua = true, $min_time = 5)
    {
        if (empty($token))
            return false;
        if ($restrict_to_ua) {
            $sql = "alive = '1' AND token = '$token' AND ip = '" . $this->input->ip_address() . "' AND user_agent = '" . $this->input->user_agent() . "'";
        } else {
            $sql = "alive = '1' AND token = '$token' AND ip = '" . $this->input->ip_address() . "'";
        }
        
        $this->db->select('COUNT(token) FROM ' . $this->db->dbprefix('tokens') . '');
        $this->db->where($sql);
        
        $timelimit = date("Y-m-d H:i:s", time() - $min_time);
        $this->db->where('timestamp <=', $timelimit);
        
        $res = $this->db->get()->row_array();
        $num = $res['COUNT(token)'];
        unset($res);
        if ($num == 0)
            return false; // false if no results
        // returns result so is ok
        $this->increment_token_count($token);
        $this->delete_cookie_token();
        //cleanup
        $this->kill_token($token);
        $this->cleanup_dead_tokens();
        
        return true;
    }
    */
    
    /** generates token, saves it in DB, returns the token value
     * 
     * @param int $length token number length
     * @param int $expiry  in seconds
     * @param str $module  module name
     * @return string token number on succes or false
     */
    public function get_token($length=6, $expiry = null, $module=null)
    {
        $token = $this->generate_token($length);
        if ($token != false) {
            $uid = empty($this->current_user->id) ? 0 : $this->current_user->id;
            
            $data = array(
                'user_id' => $uid,
                'token' => $token,
                'ip' => $this->input->ip_address(),
                'user_agent' => $this->input->user_agent(),
                'counter' => 0,
                'alive' => 1,
                'module' => $module,
                'timestamp' => date("Y-m-d H:i:s"),
                'created_on' => date("Y-m-d H:i:s")
            );
            if( ! is_null($expiry) ) 
            {
                $data['expires'] =  date("Y-m-d H:i:s", time() + $expiry) ;
            }
            $this->db->insert('tokens', $data);
            log_message('debug', "token inserted $token");
            
        } else {
            log_message('error', "get_token failed $token");
            return 'false';
        }
        $this->cleanup_dead_tokens();
        return $token;
    }
    
    /** retrieves token data from DB
     * 
     * @param int $token
     * @return object token table row 
     */
    public function retrieve_token($token)
    {
        if (empty($token)) return false;
        $this->db->select();
        $this->db->from('tokens');
        $this->db->where('token', $token);
        $res = $this->db->get()->row();
        return $res;
    }
    
    /** fixes token to session with cookie 
     * overidden by POST _token=value 
     * if no token provided creates one with get_token()
     * 
     * @return int token number
     */
    public function current_token()
    {
        $token = isset($_POST['_token']) ? $_POST['_token'] : false;
        if (!$token)
            $token = !empty(get_cookie('_token')) ? get_cookie('_token') : '';
        if (empty($token) || !$this->check_token($token)) {
            $token = $this->get_token();  
            $this->set_cookie_token($token);  
        }
        
        return $token;
    }
    
    /** generates a token of given length
     * recursively checks if existing in DB and creates new token if so (max 100 tries)
     * 
     * 
     * @staticvar int $count internal counter for tries
     * @param str $length number length 
     * @return in number on succes, or false or too many tries
     */
    public function generate_token($length)
    {
        static $count = 0;
        $try = random_string('nozero', $length);
        
        $this->db->select('COUNT(token) FROM ' . $this->db->dbprefix('tokens') . '');
        $this->db->where('token', $try);
        $res = $this->db->get()->row_array();
        $num = $res['COUNT(token)'];
        log_message('debug', "token $try $num");
        
        if ($num >= 1) {
            if ($count > 100) // safety for infinite loop
                {
                log_message('error', "reached a hundred calls to generate_token, exiting!");
                return false;
            }
            $count += 1;
            return $this->generate_token();
        } else {
            return $try;
        }
    }
    
    /** deletes dead tokens, default delay before removal is 1 day
     * NOTE: kills tokens first, does not remove token with expiry date
     * 
     * @param int $morguetime delay for keeping dead tokens
     */
    public function cleanup_dead_tokens($morguetime = null) //1 day
    {
        if(is_null($morguetime)) $morguetime = $this->_token_morgue_time;
        $this->kill_tokens();
        $this->kill_tokens_expired();
        $timelimit = date("Y-m-d H:i:s", time() - $morguetime);
        $this->db->where('timestamp <=', $timelimit);
        $this->db->where('expires', null);  
        $this->db->delete($this->db->dbprefix('tokens'), array('alive' => 0) );
        log_message('debug', "tokens cleaned morguetime:".$timelimit);
    }
    
    /** kill tokens after set time, default 1h
     *   preserves tokens with expiry 
     * 
     * @param int $timeout in seconds
     */
    public function kill_tokens($timeout = null) //1hour
    {
        if(is_null($timeout)) $timeout = $this->_token_life_time;
        $timelimit = date("Y-m-d H:i:s", time() - $timeout);
        $this->db->where('timestamp <=', $timelimit);
        $this->db->where('expires', null); // preserve fields with expiry value
        $this->db->update($this->db->dbprefix('tokens'), array('alive' => 0));
        log_message('debug', "tokens killed lifetime:$timeout seconds");
    }
    
    /** kill expired tokens
     * 
     */
    public function kill_tokens_expired() 
    {
        $now = date('Y-m-d H:i:s');
        $this->db->where('expires <=', $now ); 
        $this->db->update($this->db->dbprefix('tokens'), array('alive' => 0));
        log_message('debug', "expired tokens killed");
    }
    
    /** forcekill specific token, does not take into account expiry or last timestamp
     * 
     * @param int $token
     * @return boolean
     */
    public function kill_token($token)  
    {
        if (empty($token))
            return false;
        $data = array('alive' => 0);
        
        $this->db->where('token', $token);
        $this->db->update($this->db->dbprefix('tokens'), $data);
        
        log_message('debug', "token $token killed");
    }
    
    /**
     * get cookie for token
     * @return	content
     */
    public function get_cookie_token()
    {        
        $this->load->helper('cookie');
        $cookiedata = get_cookie('_token');
        return unserialize($cookiedata);
    }
    
    /**
     * set cookies for token 
     */
    public function set_cookie_token($data = '', $time = 0)
    {
        $expire = $time; //1day
        $value  = is_array($data) ? serialize($data) : $data;
        $this->load->helper('cookie');
        return set_cookie('_token', $value, $expire);
        //            return set_cookie('_token', $value );
    }
    
    public function delete_cookie_token()
    {
        $this->load->helper('cookie');
        return set_cookie('_token', '', '-3600');
    }
}
