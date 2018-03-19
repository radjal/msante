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
		
		return $this->appointments_m->getfile('js/appointments.js', $encode);
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
		$appointment = $this->attribute('appointment');
//                $p_cookie= $this->appointments_m->get_cookie_cart();
                $rid = $this->input->get('remove');
                $cart = $this->appointments_m->get_cart($rid);
                if(count($cart['products']) > 0) 
                { 
                    return $cart['products'];
                } 
            return false;   
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
                $p_cookie= $this->appointments_m->get_cookie_cart();
                
                $rid = $this->input->get('remove');
                $cart = $this->appointments_m->get_cart($rid);
                if(count($cart['products']) > 0) 
                { 
                    $totals['total_price'] = $cart['total_price'] ;
                    $totals['total_taxed'] = $cart['total_taxed'] ;
                    $totals['mtz'] = true ; //useful?
                    
                    return $totals;
                } 
            return false;   
	}
        
        /**
         *  script tag for relays
         * @return string
         */
	function jsrelays()
	{           
            $this->load->model('relay/appointments_m');
            $html = '';
            $html .= '<script type="text/javascript">' ;
            $html .= $this->appointments_m->getfile("js/relays.js" );

            $html .= '</script>' ;
            return $html;   
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
            	// params
		$limit = $this->attribute('limit') ;
		$appointment = $this->attribute('appointment');
		$cat_id = $this->attribute('cat_id');
		$parent_id = $this->attribute('parent_id');
		$slug = $this->attribute('slug');
		$order_by = !empty($this->attribute('order_by')) ? $this->attribute('order_by') : 'name';
		$no_cat_id = $this->attribute('no_cat_id');
		$no_pid = $this->attribute('no_pid');
                
            // query setting
                if(!empty($cat_id)) $this->db->where("id","$cat_id");
                if(!empty($parent_cid)) $this->db->where("parent_cid","$parent_cid");
                if(!empty($slug)) $this->db->where("slug",$slug);
                if(!empty($limit)) $this->db->limit($limit);
                if(!empty($appointment)) $this->db->order_by($order_by, $appointment);
                if(!empty($no_cat_id)) $this->db->where_not_in('id', explode(',', $no_cat_id));
                if(!empty($no_pid)) $this->db->where_not_in('parent_id', explode(',', $no_pid));
                
              $categories = $this->db
                            ->get('products_categories')
                                    ->result_array();
              return $categories;
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
           $html = '';
           $html .= '<script type="text/javascript">' ;
           $html .= $this->appointments_m->getfile("js/jscart.js" );
           
           $html .= '</script>' ;
           
            return $html;   
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