<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a doctor module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	doctor Module
 */
class Plugin_Doctor extends Plugin
{        

	/**
	 * JS as JSON string
	 * Usage:
	 * 
	 * {{ doctor:js encode='oneline' }} json or oneline(escaped)
	 *
	 * @return	string
	 */
	function js()
	{
		$this->load->model('doctor_m');
		//$this->lang->load('doctor');
                
                $encode = strtolower($this->attribute('encode'));
		
		return $this->doctor_m->getfile('js/doctor.js', $encode);
	}
        
	/**
	 * CSS as JSON string
	 * Usage:
	 * json or oneline(escaped)
	 * {{ doctor:css encode='oneline' }} 
	 *
	 * @return	string
	 */
	function css()
	{
		$this->load->model('doctor_m');
		//$this->lang->load('doctor');
                
                $encode = strtolower($this->attribute('encode'));
		
		return $this->doctor_m->getfile('css/doctor.css', $encode);
	}
        
        /**
         * HTML script tag for doctor.js 
         * 
         * {{ doctor:doctorlist }} 
         * 
         * @return string
         */
//        function doctorlist()
//	{           
//            $this->load->model('doctor/doctor_m');
//            $html = '';
//            $html .= '<script type="text/javascript">' ;
//            $html .= $this->doctor_m->getfile("js/doctors.js" );
//            $html .= '</script>' ;
//            return $html;   
//	}

        /**
         * HTML search form 
         * 
         * {{ doctor:search_box inputclass='form-control' submitclass='btn btn-primary' geoclass='btn btn-default'}} 
         * 
         * @return string
         */
        function search_box() 
        {
            $search = $this->input->get('s');
            $cat = $this->input->get('c');
            
            $class = $this->attribute('inputclass');
            $class = !empty($class)?' class="'.$class.'"':'';
            
            $btn = $this->attribute('submitclass');
            $btn = !empty($btn)?' class="'.$btn.'"':'';
            
            $geobtn = $this->attribute('geoclass');
            $geobtn = !empty($geobtn)?' class="'.$geobtn.'"':'';
            
            $html = '<div id="doctor-search">';
            $html .= '<form method="get" action="'.  site_url().'doctor">' ;
            $html .= form_input('c', $cat, 'placeholder="Spécialité médicale"'.$class) ;
            $html .= '<br />';
            $html .= form_input('s', $search, 'placeholder="Ville ou code postal"'.$class) ;
            $html .= '<br />';
            //$html .= 'Localisez moi!' ;
            $html .= form_button('','Localisez moi!', $geobtn) ;
            $html .= '<br />';
            $html .= '<br />';
            $html .= form_submit('','Rechercher un docteur', $btn) ;
            if(!empty($search) or !empty($cat)) $html .= anchor(site_url().'doctor','Recharger');

            $html .= '</form></div>' ;
            return $html;   
        }
        
          	
        /**
	 * doctors list
         * 
	 * {{ doctor:list_doctors limit="5" order_by="id" order="asc" zone_id="2" postcode="postcode" town="town" }}
	 *      {{ id }} {{ name }} {{ postcode }} {{ town }}
	 * {{ /doctor:list_doctors }}
	 *
	 * @return	array
	 */
	function list_doctors()
	{
                $limit = $this->attribute('limit');
                $order = !empty($this->attribute('order')) ? $this->attribute('order') : 'asc';
                $order_by = !empty($this->attribute('order_by')) ? $this->attribute('order_by') : 'name';
                $zone_id = $this->attribute('doctor_zone');
		$town = $this->attribute('town');
		$postcode = $this->attribute('postcode');
		
            // query setting
                if(!empty($zone_id)) $this->db->where("zone_id",$zone_id);
                if(!empty($town)) $this->db->or_like("town", $town);
                if(!empty($postcode)) $this->db->or_like("postcode", $postcode);
                $this->db->order_by($order_by, $order);


		$data = $this->db->limit($limit)
                                    ->get('doctor_doctors')
                                    ->result_array();

                // add numbering
                foreach ($data as $key => $value) {
                        $data[$key]['count'] = $key+1; 
                    }

                return $data;
	}
 
}

/* End of file plugin.php */