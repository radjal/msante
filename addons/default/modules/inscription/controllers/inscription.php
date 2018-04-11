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
            $data['etape2'] = $etape2; 
                        $norngps = $this->input->post('rngps');
                        $birth_date = $this->input->post('birth_date'); 
            if($casNo == "cas1_1")
            {
                        $norngps = $this->input->post('rngps');
                        $birth_date = $this->input->post('birth_date'); 

                        if(!empty($norngps) ) // && !empty($birth_date)) 
                        {
                            // cross site request
                                $context = stream_context_create(array("http"=>array(
                                    "method" => "GET",
                                    "header" => "Accept: xml/*, text/*,  json/*, */*\r\n",
                                    "ignore_errors" => false,
                                    "timeout" => 50,
                                )));

                                $url = defined(PYRO_PRODUCTION) ? 'https://rngps.net/verification/cas1/' : 'http://rngps.localhost/verification/cas1/';
//                                $url = 'http://rngps.localhost/verification/cas1/';
                                $url .= '?rngps='.$norngps.'&birth_date='.$birth_date ;
                                $response = file_get_contents($url , false, $context, 0, 1000);
//                                $jsonObject = json_decode (file_get_contents($url , false, $context, 0, 1000));

                                $data['url'] = $url;  
                                $data['response'] = $response;  
                        }
                    
            } elseif($casNo = "cas2_1") {
                        
                        $onameg = $this->input->post('onameg');
                        $obtention = $this->input->post('obtention'); 
                        $email = $this->input->post('email'); 
                            // cross site request
                                $context = stream_context_create(array("http"=>array(
                                    "method" => "GET",
                                    "header" => "Accept: xml/*, text/*,  json/*, */*\r\n",
                                    "ignore_errors" => false,
                                    "timeout" => 50,
                                )));

                                //prod or local
                                $url = defined(PYRO_PRODUCTION) ? 'https://rngps.net/verification/cas2/' : 'http://rngps.localhost/verification/cas2/';
                                $url.='?onameg='.$onameg;
                                $response = file_get_contents($url , false, $context, 0, 1000);
//                                $response = json_decode (file_get_contents($url , false, $context, 0, 1000));

                                $data['url'] = $url;  
                                $data['response'] = $response;  
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
