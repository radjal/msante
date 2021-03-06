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
		
		return $this->doctor_m->getfile('js/doctors.js', $encode);
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
         * {{ doctor:search_box }} 
         * 
         * @return string
         */
        function search_box() 
        {
            $search = $this->input->post('s');
            $cat = $this->input->post('c'); 
            
            $html = '<div id="doctor-search" class="">';
                $html .= '<form method="post" action="'.  site_url().'doctor">' ;
                    $html .= '<div class="form-group searchbox-query">';
                        $html .= '<div class="input-group">';
                            $html .= '<span class="input-group-addon"><a class="" onclick="cleanDocSearch()"><i class="glyphicon glyphicon-remove-circle"></i></a></span>';  
                            $html .= form_input('c', $cat, 'placeholder="Domaine ou spécialité médicale"'.' class="form-control"') ;
                        $html .= '</div> ';
                    $html .= '</div> <div class="form-group searchbox-area">';
                        $html .= '<div class="input-group">';
                            $html .= '<span class="input-group-addon"><a class="" onclick="geoGetTown()"><i class="glyphicon glyphicon-map-marker"></i></a></span>';  
                            $html .= form_input('s', $search, 'placeholder="Ville, quartier ou CP"'.' class="form-control"') ; 
                            $html .= '<span class="input-group-btn">'; 
                                $html .= form_button(array('name' => 'submitBtn', 'type'=>'submit'),'<i class="glyphicon glyphicon-search"></i>', ' class="btn btn-primary"') ;
                            $html .= '</span>';
                        $html .= '</div>';
                    $html .= '</div>';
                $html .= '</form>';
            $html .= '</div>'; 
                
//                if(!empty($search) or !empty($cat)) { $html .= '<br />'.anchor(site_url().'doctor','Recharger'); }
                
//                $html .= '<script> console.log("test") ; $( document ).ready(function(){ ';
//                $html .= "if(navigator.geolocation !== true) { $('#doctor-search .input-group-addon a').addClass('disabled'); ";
//                $html .=  "} else { $('#doctor-search .input-group-addon a').on('click', geoGetTown); console.log('geobtn') ;} ";
//                $html .= ' });</script>';
                
            $html .= '</div></form></div>' ;
            return $html;   
        } 
          	
        /**
	 * doctors list
         * 
	 * {{ doctor:listing limit="5" order_by="id" order="asc" zone_id="2" area_name="area_name" town="town" }}
	 *      {{ id }} {{ name }} {{ area_name }} {{ town }}
	 * {{ /doctor:listing }}
	 *
	 * @return	array
	 */
	function listing()
	{
                $limit = $this->attribute('limit');
                $order = !empty($this->attribute('order')) ? $this->attribute('order') : 'asc';
                $order_by = !empty($this->attribute('order_by')) ? $this->attribute('order_by') : 'name';
                $zone_id = $this->attribute('doctor_zone');
		$town = $this->attribute('town');
		$area_name = $this->attribute('area_name');
		
            // query setting
                if(!empty($zone_id)) $this->db->where("zone_id",$zone_id);
                if(!empty($town)) $this->db->or_like("town", $town);
                if(!empty($area_name)) $this->db->or_like("area_name", $area_name);
                $this->db->order_by($order_by, $order);


		$data = $this->db->limit($limit)
                                    ->where("doctor_doctors.validated ",'yes')
                                    ->get('doctor_doctors')
                                    ->result_array();

                // add numbering
                foreach ($data as $key => $value) {
                        $data[$key]['count'] = $key+1; 
                    }

                return $data;
	}
          	 
        /**
	 * categories list 
         * image = true wil return only images
         * 
	 * {{ doctor:categories parent_cat="parent_cat" images="true" }}
	 *      {{ id }} {{ name }} {{ parent_cat }} {{ speciality }} {{ filename }} 
	 * {{ /doctor:categories }}
	 *
	 * @return	array
	 */
	function categories()
	{ 
		$parent_cat = $this->attribute('parent_cat');
		$images = $this->attribute('images'); 
                $this->load->model('doctor_m'); 
                $data = $this->doctor_m->get_categories($parent_cat, $images); 
                // add numbering
                foreach ($data as $key => $value) {
                        if(empty($data[$key]['filename']))
                        {   
                            unset($data[$key]);                        
                        } else {
                            $data[$key]['count'] = $key+1;  
                        }
                    } 
                return $data;
	}
          	
        /**
	 * show doctor
         * 
	 * {{ doctor:show id="10" }}
	 *      {{ id }} {{ name }} {{ area_name }} {{ town }}
	 * {{ /doctor:show }}
	 *
	 * @return	array or false
	 */
	function show()
	{
                $limit = 1;  
                $id = $this->attribute('id');
                if(empty($id)) return false;
                //@todo user role checks
//                $user_id
//                $doctor_id
                $this->db->select('doctor_doctors.*');
                $this->db->select('doctor_categories.*');
                $this->db->select('doctor_organisations.*');
                $this->db->select('files.filename AS img_path');
            // query setting
                if(!empty($id)) 
                {
                    $this->db->where("doctor_doctors.id ",$id); 
                } else {
                    return false;
                }
                $this->db->join('doctor_categories', 'doctor_categories.id = doctor_doctors.doctor_cat', 'left');
                $this->db->join('doctor_organisations', 'doctor_doctors.groupe = doctor_organisations.id', 'left');
                $this->db->join('files', 'doctor_doctors.image = files.id', 'left');
		$data = $this->db->limit($limit)
                                    ->get('doctor_doctors')
                                    ->result_array(); 

                return isset($data[0]) ? $data[0] : null;
	}
                 
        /**
	 * returns category image of speciality in case of no doctor image
         * 
	 * {{ doctor:speciality_img speciality="dentiste" }} 
	 *
	 * @return	str image filename
	 */
	function speciality_img()
	{   
                $this->load->model('doctor_m'); 
                $speciality = $this->attribute('speciality');
                return $this->doctor_m->speciality_img($speciality) ; 
	}  
}

/* End of file plugin.php */