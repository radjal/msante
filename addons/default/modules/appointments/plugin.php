<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a appointments module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Appointments Module
 */
class Plugin_Appointments extends Plugin
{ 
	/**
	 * JS as JSON string
	 * Usage:
	 * 
	 * {{ appointments:js encode='oneline' }} json or oneline(escaped)
	 *
	 * @return	array
	 */
	function js()
	{
		$this->load->model('appointments_m');
		//$this->lang->load('appointments');
                
                $encode = strtolower($this->attribute('encode'));
		
		return $this->appointments_m->getfile('js/appointment.js', $encode);
	}
        
        /**
         * delivery date with customized datepicker 
         * usage
         * {{ appointments:appointment_date }} 
         * 
         * @return string html 
         */
        function appointment_date()
        {
            $html = '';
		$this->load->model('appointments_m');
		$this->load->model('html_m');
		//$this->lang->load('appointments');
                
                //$encode = strtolower($this->attribute('encode'));

                $js = $this->appointments_m->getfile('js/datepicker.js' );
                $html .= $this->html_m->form_appointment_date();   
                return $html;
        }
        
	/**
	 * CSS as JSON string
	 * Usage:
	 * 
	 * {{ appointments:css encode='oneline' }} json or oneline(escaped)
	 *
	 * @return	array
	 */
	function css()
	{
		$this->load->model('appointments_m');
		//$this->lang->load('appointments');
                
                $encode = strtolower($this->attribute('encode'));
		
		return $this->appointments_m->getfile('css/appointments.css', $encode);
	}
                
        /**
	 * get appointments for current doctor uses doctor_id from user profile
	 * Usage:
	 * 
	 * {{ appointments:my_pro_appointments futur_past="past|futur" for_user="yes|no|..." for_name="mark..." }}
	 *   {{appointment_date}} à {{appointment_time}}  
         *   {{gender}}  
         *   {{first_name}}    {{last_name}}  
	 * {{ /appointments:my_pro_appointments }}
	 *
	 * @return	array
	 */
        function my_pro_appointments()
	{ 
                $user = $this->current_user;
                if(!isset($user)) return false;
                $doctor_id = $user->doctor_id; 
                $futur_past = !empty($this->attribute('futur_past')) ? $this->attribute('futur_past') : 'futur';
                $for_name = !empty($this->attribute('for_name')) ? $this->attribute('for_name') : null;    
                $for_user = !empty($this->attribute('for_user')) ? $this->attribute('for_user') : null; //DB field name
                // query setting 
                if(!empty($for_user)) $this->db->where('appointments_list.for_user', $for_user);  
                if(isset($for_name)) $this->db->like('CONCAT(first_name,\' \' , last_name,\' \' ,  maiden_name)', $for_name);   
                if(stristr($futur_past,"futur")) $this->db->where('appointments_list.appointment_date >=', date('Ymd', time()));  
                if(stristr($futur_past,"past")) $this->db->where('appointments_list.appointment_date <=', date('Ymd', time()));    
                $this->db->order_by('appointments_list.appointment_date', 'ASC');   
                //get results
                $appointments = $this->db  
                            ->select('appointments_list.*')
                            ->select('doctor_doctors.id AS doc_id, doctor_doctors.name AS doc_name, doctor_doctors.image AS doc_img, doctor_doctors.address AS doc_adr, doctor_doctors.town AS doc_town, doctor_doctors.area_name AS doc_area')
                            ->select('doctor_categories.speciality AS doc_speciality, ')
                            ->select('doctor_organisations.organisation AS doc_org, doctor_organisations.subset AS doc_org_subset') 
                            ->select('files.filename AS filename') 
                            ->join('doctor_doctors', 'appointments_list.doctor_id = doctor_doctors.id')
                            ->join('doctor_categories', 'doctor_doctors.doctor_cat = doctor_categories.id', 'left')
                            ->join('doctor_organisations', 'doctor_doctors.groupe = doctor_organisations.id', 'left') 
                            ->join('files', 'files.id = doctor_doctors.image', 'left') 
                            ->where("appointments_list.doctor_id",$doctor_id )
                            ->where("appointments_list.appointment_status",'' )  
                            ->get('appointments_list')
                            ->result_array();
                //add date strings 
                $l = count($appointments);
                for ($c = 0; $c < $l; $c++ ) 
                {
                    $appointments[$c]['date_day_str'] = $this->appointments_m->datestr_to_day($appointments[$c]['appointment_date'], 'long');
                    $appointments[$c]['date_month_str'] = $this->appointments_m->datestr_to_month($appointments[$c]['appointment_date']);   
                    //@todo remove references to above, use same names as in controller instead
                    //-***************************************  
                    $appointments[$c]['time_formatted'] = $this->appointments_m->timestr_format(str_pad($appointments[$c]['appointment_time'], 4, '0', STR_PAD_LEFT));   
                    $appointments[$c]['date_formatted'] = $this->appointments_m->datestr_to_day($appointments[$c]['appointment_date']);   
                    $appointments[$c]['month'] = $this->appointments_m->datestr_to_day($appointments[$c]['appointment_date']);   
                    $appointments[$c]['short_dayname'] = $appointments[$c]['appointment_date'];    
                    
                } 
             return $appointments; 
	}
                
        /**
	 * get appointments for current user id
	 * Usage:
	 * 
	 * {{ appointments:my_appointments futur_past="past|futur" for_user="yes|no|..." for_name="mark..."  search_var="s" }}
	 *   {{appointment_date}} à {{appointment_time}}  
         *   {{gender}}  
         *   {{first_name}}    {{last_name}}  
	 * {{ /appointments:my_appointments }}
	 *
	 * @return	array
	 */
        function my_appointments()
	{ 
                $user = $this->current_user;
                if(!isset($user)) return false;
                $user_id = $user->id;
//                if(empty($user_id)) return false;
                $futur_past = !empty($this->attribute('futur_past')) ? $this->attribute('futur_past') : 'futur';
                $for_name = !empty($this->attribute('for_name')) ? $this->attribute('for_name') : null;    //does not work
                $search_var = !empty($this->attribute('search_var')) ? $this->attribute('search_var') : false;  
                if(!$search_var) $search_var = empty($this->input->post($search_var)) ? $this->input->get($search_var) : $this->input->post($search_var) ;
                $for_user = !empty($this->attribute('for_user')) ? $this->attribute('for_user') : null; //DB field name
                // query setting 
                if(!empty($for_user)) $this->db->where('appointments_list.for_user', $for_user);  
                if(isset($for_name)) $this->db->like('CONCAT(first_name,\' \' , last_name,\' \' ,  maiden_name)', $for_name);      //does not work
                if(isset($search_var)) $this->db->like('CONCAT(first_name,\' \' , last_name,\' \' ,  maiden_name)', $search_var);   
                if(stristr($futur_past,"futur")) $this->db->where('appointments_list.appointment_date >=', date('Ymd', time()));  
                if(stristr($futur_past,"past")) $this->db->where('appointments_list.appointment_date <=', date('Ymd', time()));    
                $this->db->order_by('appointments_list.appointment_date', 'ASC');   
                //get results
                $appointments = $this->db  
                            ->select('appointments_list.*')
                            ->select('doctor_doctors.id AS doc_id, doctor_doctors.name AS doc_name, doctor_doctors.image AS doc_img, doctor_doctors.address AS doc_adr, doctor_doctors.town AS doc_town, doctor_doctors.area_name AS doc_area')
                            ->select('doctor_categories.speciality AS doc_speciality, ')
//                            ->select('doctor_organisations.organisation AS doc_org, doctor_organisations.subset AS doc_org_subset') 
                            ->select('files.filename AS filename') 
                            ->join('doctor_doctors', 'appointments_list.doctor_id = doctor_doctors.id')
                            ->join('doctor_categories', 'doctor_doctors.doctor_cat = doctor_categories.id', 'left')
//                            ->join('doctor_organisations', 'doctor_doctors.groupe = doctor_organisations.id', 'left') 
                            ->join('files', 'files.id = doctor_doctors.image', 'left') 
                            ->where("appointments_list.user_id",$user_id )
                            ->where("appointments_list.appointment_status",'' )  
                            ->get('appointments_list')
                            ->result_array();
                //add date strings 
                $l = count($appointments);
                for ($c = 0; $c < $l; $c++ ) 
                {
                    $appointments[$c]['date_day_str'] = $this->appointments_m->datestr_to_day($appointments[$c]['appointment_date'], 'long');
                    $appointments[$c]['date_month_str'] = $this->appointments_m->datestr_to_month($appointments[$c]['appointment_date']);   
                    //@todo remove references to above, use same names as in controller instead
                    //-***************************************  
                    $appointments[$c]['time_formatted'] = $this->appointments_m->timestr_format(str_pad($appointments[$c]['appointment_time'], 4, '0', STR_PAD_LEFT));   
                    $appointments[$c]['date_formatted'] = $this->appointments_m->datestr_to_day($appointments[$c]['appointment_date']);   
                    $appointments[$c]['month'] = $this->appointments_m->datestr_to_day($appointments[$c]['appointment_date']);   
                    $appointments[$c]['short_dayname'] = $appointments[$c]['appointment_date'];    
                    
                } 
             return $appointments; 
	}
                
        /**
	 * count appointments for current user id
	 * Usage:
	 * 
	 * {{ appointments:my_appointments_count futur_past="past|futur" for_user="yes|no|..." for_name="mark..."  search_var="s" }} 
	 *
	 * @return	int
	 */
        function my_appointments_count() 
	{ 
                $user = $this->current_user;
                if(!isset($user)) return false;
                $user_id = $user->id;
//                if(empty($user_id)) return false;
                $futur_past = !empty($this->attribute('futur_past')) ? $this->attribute('futur_past') : 'futur';
                $for_name = !empty($this->attribute('for_name')) ? $this->attribute('for_name') : null;    
                $for_user = !empty($this->attribute('for_user')) ? $this->attribute('for_user') : null;    //DB field name
                $search_var = !empty($this->attribute('search_var')) ? $this->attribute('search_var') : false;  
                if(!$search_var) $search_var = empty($this->input->post($search_var)) ? $this->input->get($search_var) : $this->input->post($search_var) ;
                // query setting 
                if(!empty($for_user)) $this->db->where('appointments_list.for_user', $for_user);  
                if(isset($for_name)) $this->db->like('CONCAT(first_name,\' \' , last_name,\' \' ,  maiden_name)', $for_name);   
                if(stristr($futur_past,"futur")) $this->db->where('appointments_list.appointment_date >=', date('Ymd', time()));  
                if(stristr($futur_past,"past")) $this->db->where('appointments_list.appointment_date <=', date('Ymd', time()));     
                if(isset($search_var)) $this->db->like('CONCAT(first_name,\' \' , last_name,\' \' ,  maiden_name)', $search_var);   
                //get results
                $appointments = $this->db   
                            ->from('appointments_list')
                            ->where("appointments_list.user_id",$user_id )
                            ->where("appointments_list.appointment_status",'' )   
                            ->count_all_results();  
                //add date strings  
             return $appointments; 
	}
        
        /**
         * returns list of other names in user appointments list, matches on "for_user" field ="yes|no"  search_var="name" 
         * 
	 * {{ appointments:other_persons futur_past="past|futur"  search_var="s"  }} 
         *   {{ first_name }} {{ last_name }}
         * 
	 * {{ /appointments:other_persons }}
         */
        function other_persons()
        {
                $user = $this->current_user;
                if(!isset($user)) return false;
                $user_id = $user->id;
                $futur_past = !empty($this->attribute('futur_past')) ? $this->attribute('futur_past') : 'futur';
                $search_var = !empty($this->attribute('search_var')) ? $this->attribute('search_var') : false;  
                if(!$search_var) $search_var = empty($this->input->post($search_var)) ? $this->input->get($search_var) : $this->input->post($search_var) ;
                
                if(stristr($futur_past,"futur")) $this->db->where('appointments_list.appointment_date >=', date('Ymd', time()));  
                if(stristr($futur_past,"past")) $this->db->where('appointments_list.appointment_date <=', date('Ymd', time()));   
                if(isset($search_var)) $this->db->like('CONCAT(first_name,\' \' , last_name,\' \' ,  maiden_name)', $search_var);   
                 
                $users = $this->db 
                            ->select('appointments_list.first_name, appointments_list.last_name')
                            ->distinct()
                            ->where("appointments_list.user_id",$user_id )
                            ->where("appointments_list.for_user",'no' ) 
                            ->where("appointments_list.appointment_status",'' )  
                            ->get('appointments_list')
                            ->result_array();  
                return $users;
        }
        
        /**
         * counts results for other_persons() uses same params
         * 
	 * {{ appointments:other_persons_count futur_past="past|futur" search_var="s"  }}  
         * 
         */
        function other_persons_count()
        {
                $user = $this->current_user;
                if(!isset($user)) return false;
                $user_id = $user->id;
                $futur_past = !empty($this->attribute('futur_past')) ? $this->attribute('futur_past') : 'futur';
                $search_var = !empty($this->attribute('search_var')) ? $this->attribute('search_var') : false;  
                if(!$search_var) $search_var = empty($this->input->post($search_var)) ? $this->input->get($search_var) : $this->input->post($search_var) ;
                
                if(stristr($futur_past,"futur")) $this->db->where('appointments_list.appointment_date >=', date('Ymd', time()));  
                if(stristr($futur_past,"past")) $this->db->where('appointments_list.appointment_date <=', date('Ymd', time()));   
                if(isset($search_var)) $this->db->like('CONCAT(first_name,\' \' , last_name,\' \' ,  maiden_name)', $search_var);   
                 
                $users = $this->db 
                            ->select('appointments_list.*')
                            ->distinct() 
                            ->from('appointments_list')
                            ->where("appointments_list.user_id",$user_id )
                            ->where("appointments_list.for_user",'no' ) 
                            ->where("appointments_list.appointment_status",'' )  
//                            ->get('appointments_list')
//                            ->result_array();  
                            ->count_all_results();  
                return $users;
        }
        
        /**
	 * Cart Cookie products list
	 * Usage:
	 * 
	 * {{ appointments:cartlist appointment="asc" }}
	 *      {{ id }} {{ name }} {{ slug }}
	 * {{ /appointments:cartlist }}
	 *
	 * @return	array
	 */
	function cartlist()
	{
//		$appointment = $this->attribute('appointment');
////                $p_cookie= $this->appointments_m->get_cookie_cart();
//                $rid = $this->input->get('remove');
//                $cart = $this->appointments_m->get_cart($rid);
//                if(count($cart['products']) > 0) 
//                { 
//                    return $cart['products'];
//                } 
//            return false;   
	}
        
        /**
	 * Cart total
	 * Usage:
         * 
	 * {{ appointments:carttotal}}
	 *      {{ total_price }} {{ total_taxed }} 
	 * {{ /appointments:carttotal }}
	 *
	 * @return	
	 */
	function carttotal()
	{
//                $p_cookie= $this->appointments_m->get_cookie_cart();
//                
//                $rid = $this->input->get('remove');
//                $cart = $this->appointments_m->get_cart($rid);
//                if(count($cart['products']) > 0) 
//                { 
//                    $totals['total_price'] = $cart['total_price'] ;
//                    $totals['total_taxed'] = $cart['total_taxed'] ;
//                    $totals['mtz'] = true ; //useful?
//                    
//                    return $totals;
//                } 
            return false;   
	}
        
        /**
         *  script tag for relays
         * @return string
         */
	function jsrelays()
	{           
//            $this->load->model('relay/appointments_m');
//            $html = '';
//            $html .= '<script type="text/javascript">' ;
//            $html .= $this->appointments_m->getfile("js/relays.js" );
//
//            $html .= '</script>' ;
//            return $html;   
	}

        /**
         * 
         * {{ appointments:categories limit="5" appointment="asc" cat_id="2" parent_id="1" order_by="id" no_cat_id="1,2" no_pid="5,6" }}
         *      {{ id }} {{ parent_id}} {{ name }} {{ slug }}
         * {{ /appointments:categories }}
         * 
         */
        function categories() 
        {
//            	// params
//		$limit = $this->attribute('limit') ;
//		$appointment = $this->attribute('appointment');
//		$cat_id = $this->attribute('cat_id');
//		$parent_id = $this->attribute('parent_id');
//		$slug = $this->attribute('slug');
//		$order_by = !empty($this->attribute('order_by')) ? $this->attribute('order_by') : 'name';
//		$no_cat_id = $this->attribute('no_cat_id');
//		$no_pid = $this->attribute('no_pid');
//                
//            // query setting
//                if(!empty($cat_id)) $this->db->where("id","$cat_id");
//                if(!empty($parent_cid)) $this->db->where("parent_cid","$parent_cid");
//                if(!empty($slug)) $this->db->where("slug",$slug);
//                if(!empty($limit)) $this->db->limit($limit);
//                if(!empty($appointment)) $this->db->order_by($order_by, $appointment);
//                if(!empty($no_cat_id)) $this->db->where_not_in('id', explode(',', $no_cat_id));
//                if(!empty($no_pid)) $this->db->where_not_in('parent_id', explode(',', $no_pid));
//                
//              $categories = $this->db
//                            ->get('products_categories')
//                                    ->result_array();
//              return $categories;
        }   	
        
        /**
	 * Cart total
	 * Usage:
	 * 
	 * {{ appointments:jscarttotal }} 
	 *
	 * @return	
	 */
	function jscarttotal()
	{
//           $html = '';
//           $html .= '<script type="text/javascript">' ;
//           $html .= $this->appointments_m->getfile("js/jscart.js" );
//           
//           $html .= '</script>' ;
//           
//            return $html;   
	}
        
	/**
	 * Search form for listing
	 * Usage:
	 * 
	 * {{ appointments:search_box }} 
	 *
	 * @return	
	 */
	function search_box()
	{
           $html = '';
           $html .= '<form class="appointments-search" action="'.  site_url().'appointments/listing" method="post">' ;
           $html .= '<div class="search-field"><label">'.lang('appointments:appointment_date') ;
           $html .= form_input('appointment_date', $this->input->post('appointment_date')) ;
           $html .= '</label"></div>' ;
           $html .= '<div class="search-field"><label">'.lang('appointments:d_fullname') ;
           $html .= form_input('d_fullname', $this->input->post('d_fullname')) ;
           $html .= '</label"></div>' ;
           $html .= '<div class="search-field"><label">'.lang('appointments:slug') ;
           $html .= form_input('slug', $this->input->post('slug')) ;
           $html .= '</label"></div>' ;
           $html .= '<div class="search-buttons">' ;
           $html .= form_submit('searchBtn', lang('appointments:search')) ;
           $html .= anchor(site_url().'appointments/listing', lang('appointments:reset'), 'class="btn"') ;
           $html .= '</div>' ;
            
           $html .= '</form>' ;
           
            return $html;   
	}       
}

/* End of file plugin.php */