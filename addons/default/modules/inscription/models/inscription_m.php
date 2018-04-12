<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Inscription_m extends MY_Model {
    
 	public function __construct()
	{		
		parent::__construct();
		
		//$this->_table = 'inscriptions';
	}     
        
        public function web_service_rngps($url) 
        {
            ini_set("user_agent",'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13) Gecko/20080311 Firefox/2.0.0.13 msante'); //https://forum.ovh.com/showthread.php/99127-Communication-avec-un-web-service-Forbiden
            
                $arrContextOptions=array(
                      "ssl"=>array( 
                            "verify_peer"=>false,
                            "verify_peer_name"=>false,
                        ),
                        "http"=>array( //useful?
                            "method" => "GET",
                            "header" => "Accept: xml/*, text/*,  json/*, */*\r\n",
                            "ignore_errors" => false,
                            "timeout" => 50,
                            )
                    );   
                $response = file_get_contents($url, false, stream_context_create($arrContextOptions));  
                return $response;
        }
        
	// get file
	public function getfile($filepath, $output=false)
	{
		$output = strtolower($output);
		$path = ADDONPATH."modules/inscription/$filepath";
		
		if(!empty($path)) $content = file_get_contents($path); 
		
		switch($output) {
			case 'json':
				$content = json_encode($content);
				break;
			case 'oneline':
				$order   = array("\r\n", "\n", "\r");
				$content = str_replace($order, ' ', $content);
				$content = str_replace("'", "\'", $content);
				break;
			default :
				break;
		}
		return $content;
	}
                        

}