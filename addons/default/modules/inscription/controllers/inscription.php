<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Inscription extends Public_Controller
{
    /**
     * The constructor
     * @access public
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    
        header('Access-Control-Allow-Origin: *'); 
        
        $this->load->model('inscription_m'); 
         $this->template->append_js('module::inscription.js');
         $this->template->append_css('module::inscription.css'); 
    } 
    
    /**
     * @access	public
     * @return	void
     */
    public function index($casNo=false, $etape2=null)
    {
            $template = !empty($casNo) ? substr($casNo, 0, 4) : 'index'; 
            $data['cas'] = $casNo; 
//            $data['etape2'] = $etape2; 
            $norngps = $this->input->post('rngps');
            $birth_date = $this->input->post('birth_date');  
            ini_set("user_agent",'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13) Gecko/20080311 Firefox/2.0.0.13'); //https://forum.ovh.com/showthread.php/99127-Communication-avec-un-web-service-Forbiden
            if($casNo == "cas1_1")
            {

                        if(!empty($norngps) ) // && !empty($birth_date)) 
                        {
                                $norngps = $this->input->post('rngps');
                                $birth_date = $this->input->post('birth_date'); 
                            // cross site request 
                                $url = $_SERVER['PYRO_ENV']=='production' ?  'https://rngps.net/verification/cas1/' : 'http://rngps.localhost/verification/cas1/'  ; 
                                $url .= '?rngps='.$norngps.'&birth_date='.$birth_date ;  
                                $data['url'] = $url;  
                                $data['response'] = $this->inscription_m->web_service_rngps($url);  
                        } 
            } elseif($casNo = "cas2_1") {
                        
                            $onameg = $this->input->post('onameg');
                            $obtention = $this->input->post('obtention'); 
                            $email = $this->input->post('email'); 
                            // cross site request 
                                $url = $_SERVER['PYRO_ENV']=='production' ?  'https://rngps.net/verification/cas2/' : 'http://rngps.localhost/verification/cas2/'  ; 
                                $url .= '?onameg='.$onameg.'&obtention='.$obtention.'&email='.$email ;  
                                $data['url'] = $url;  
                                $data['response'] = $this->inscription_m->web_service_rngps($url);   
            }
            /**
            // AJAX and XHR
            if($this->input->is_ajax_request() AND $this->template->set_layout(false))
            {}
             */
        
            // Build the page
            $this->template->title('inscription ' . $casNo )
//                ->set('data', $data) 
                ->build($template, $data);
    } 
     
     
}

/* End of file inscription.php */
