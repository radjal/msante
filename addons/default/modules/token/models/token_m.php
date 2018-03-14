<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
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
    
    public function __construct()
    {
        parent::__construct();
        
        //$this->_table = 'tokens';
    }
    
    /** set search conditions for orders listing
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
    
    public function check_token($token, $restrict_to_ua = true)
    {
        //$token = $this->uri->segment(3);                
        if ($restrict_to_ua) {
            $sql = "alive = '1' AND token = '$token' AND ip = '" . $this->input->ip_address() . "' AND user_agent = '" . $this->input->user_agent() . "'";
        } else {
            $sql = "alive = '1' AND token = '$token' ";
        }
        $this->db->select('COUNT(token) FROM ' . $this->db->dbprefix('tokens') . '');
        $this->db->where($sql);
        $res = $this->db->get()->row_array();
        $num = $res['COUNT(token)'];
        $this->increment_token_count($token);
        unset($res);
        if ($num == 0)
            return false; // false if no tokens// 
        //$this->kill_tokens(); //cleanup
        return true;
    }
    
    public function increment_token_count($token)
    {
        //otherwise get token data to update count
        $this->db->select('counter');
        $this->db->where('token', $token);
        $res   = $this->db->get($this->db->dbprefix('tokens'))->row_array();
        $count = $res['counter'];
        //update counter
        $this->db->where('token', $token);
        $this->db->update($this->db->dbprefix('tokens'), array(
            'counter' => $count + 1,
            'timestamp' => date("Y-m-d H:i:s")
        ));
        return $count + 1;
    }
    
    /**
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
    
    public function get_token()
    {
        $token = $this->generate_token();
        if ($token != false) {
            $uid = empty($this->current_user->id) ? 0 : $this->current_user->id;
            
            $data = array(
                'user_id' => $uid,
                'token' => $token,
                'ip' => $this->input->ip_address(),
                'user_agent' => $this->input->user_agent(),
                'counter' => 0,
                'alive' => 1,
                'timestamp' => date("Y-m-d H:i:s"),
                'created_on' => date("Y-m-d H:i:s")
            );
            $this->db->insert('tokens', $data);
            log_message('debug', "token inserted $token");
            
        } else {
            log_message('error', "get_token failed $token");
            return 'false';
        }
        $this->cleanup_dead_tokens();
        return $token;
    }
    
    public function retrieve_token($token)
    {
        if (empty($token))
            return false;
        $this->db->select();
        $this->db->from('tokens');
        $this->db->where('token', $token);
        $res = $this->db->get()->row();
        return $res;
    }
    
    public function current_token()
    {
        $token = isset($_POST['_token']) ? $_POST['_token'] : false;
        if (!$token)
            $token = !empty(get_cookie('_token')) ? get_cookie('_token') : '';
        if (empty($token) || !$this->check_token($token)) {
            $token = $this->get_token(); // use token module
            $this->set_cookie_token($token); // use token module
        }
        
        return $token;
    }
    
    public function generate_token()
    {
        static $count = 0;
        $try = random_string('nozero', 5);
        
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
    
    /** remove dead tokens
     * kills tokens first
     * 
     * @param int $morguetime time for keeping dead tokens
     */
    public function cleanup_dead_tokens($morguetime = 86400) //1 day
    {
        $this->kill_tokens();
        $timelimit = date("Y-m-d H:i:s", time() - $morguetime);
        $data      = array(
            'alive' => 0
        );
        $this->db->where('timestamp <=', $timelimit);
        
        $this->db->delete($this->db->dbprefix('tokens'), array(
            'alive' => 0
        ));
        log_message('debug', "tokens cleaned");
    }
    
    /** kill tokens after set time
     * 
     * @param int $timeout in seconds
     */
    public function kill_tokens($timeout = 3600) //1hour
    {
        $timelimit = date("Y-m-d H:i:s", time() - $timeout);
        $data      = array(
            'alive' => 0
        );
        
        $this->db->where('timestamp <=', $timelimit);
        $this->db->update($this->db->dbprefix('tokens'), $data);
        
        log_message('debug', "tokens killed -$timeout s");
    }
    
    /** kill specific token 
     * 
     * @param int $token
     * @return boolean
     */
    public function kill_token($token) //1hour
    {
        if (empty($token))
            return false;
        $data = array(
            'alive' => 0
        );
        
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
