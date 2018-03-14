<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a orders module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Orders Module
 */
class Plugin_Orders extends Plugin
{ 
	/**
	 * JS as JSON string
	 * Usage:
	 * 
	 * {{ orders:js encode='oneline' }} json or oneline(escaped)
	 *
	 * @return	array
	 */
	function js()
	{
		$this->load->model('orders_m');
		//$this->lang->load('orders');
                
                $encode = strtolower($this->attribute('encode'));
		
		return $this->orders_m->getfile('js/orders.js', $encode);
	}
        
        /**
         * delivery date with customized datepicker 
         * usage
         * {{ orders:delivery_date }} 
         * 
         * @return string html 
         */
        function delivery_date()
        {
            $html = '';
		$this->load->model('orders_m');
		$this->load->model('html_m');
		//$this->lang->load('orders');
                
                //$encode = strtolower($this->attribute('encode'));

                $js = $this->orders_m->getfile('js/datepicker.js' );
                $html .= $this->html_m->form_delivery_date();   
                return $html;
        }
        
	/**
	 * CSS as JSON string
	 * Usage:
	 * 
	 * {{ orders:css encode='oneline' }} json or oneline(escaped)
	 *
	 * @return	array
	 */
	function css()
	{
		$this->load->model('orders_m');
		//$this->lang->load('orders');
                
                $encode = strtolower($this->attribute('encode'));
		
		return $this->orders_m->getfile('css/orders.css', $encode);
	}
        
        /**
	 * Cart Cookie products list
	 * Usage:
	 * 
	 * {{ orders:cartlist order="asc" }}
	 *      {{ id }} {{ name }} {{ slug }}
	 * {{ /orders:cartlist }}
	 *
	 * @return	array
	 */
	function cartlist()
	{
		$order = $this->attribute('order');
//                $p_cookie= $this->orders_m->get_cookie_cart();
                $rid = $this->input->get('remove');
                $cart = $this->orders_m->get_cart($rid);
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
	 * {{ orders:carttotal}}
	 *      {{ total_price }} {{ total_taxed }} 
	 * {{ /orders:carttotal }}
	 *
	 * @return	
	 */
	function carttotal()
	{
                $p_cookie= $this->orders_m->get_cookie_cart();
                
                $rid = $this->input->get('remove');
                $cart = $this->orders_m->get_cart($rid);
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
            $this->load->model('relay/orders_m');
            $html = '';
            $html .= '<script type="text/javascript">' ;
            $html .= $this->orders_m->getfile("js/relays.js" );

            $html .= '</script>' ;
            return $html;   
	}

        /**
         * 
         * {{ orders:categories limit="5" order="asc" cat_id="2" parent_id="1" order_by="id" no_cat_id="1,2" no_pid="5,6" }}
         *      {{ id }} {{ parent_id}} {{ name }} {{ slug }}
         * {{ /orders:categories }}
         * 
         */
        function categories() 
        {
            	// params
		$limit = $this->attribute('limit') ;
		$order = $this->attribute('order');
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
                if(!empty($order)) $this->db->order_by($order_by, $order);
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
	 * {{ orders:jscarttotal }} 
	 *
	 * @return	
	 */
	function jscarttotal()
	{
           $html = '';
           $html .= '<script type="text/javascript">' ;
           $html .= $this->orders_m->getfile("js/jscart.js" );
           
           $html .= '</script>' ;
           
            return $html;   
	}
        
	/**
	 * Search form for listing
	 * Usage:
	 * 
	 * {{ orders:search_box }} 
	 *
	 * @return	
	 */
	function search_box()
	{
           $html = '';
           $html .= '<form class="orders-search" action="'.  site_url().'orders/listing" method="post">' ;
           $html .= '<div class="search-field"><label">'.lang('orders:delivery_date') ;
           $html .= form_input('delivery_date', $this->input->post('delivery_date')) ;
           $html .= '</label"></div>' ;
           $html .= '<div class="search-field"><label">'.lang('orders:d_fullname') ;
           $html .= form_input('d_fullname', $this->input->post('d_fullname')) ;
           $html .= '</label"></div>' ;
           $html .= '<div class="search-field"><label">'.lang('orders:slug') ;
           $html .= form_input('slug', $this->input->post('slug')) ;
           $html .= '</label"></div>' ;
           $html .= '<div class="search-buttons">' ;
           $html .= form_submit('searchBtn', lang('orders:search')) ;
           $html .= anchor(site_url().'orders/listing', lang('orders:reset'), 'class="btn"') ;
           $html .= '</div>' ;
            
           $html .= '</form>' ;
           
            return $html;   
	}       
}

/* End of file plugin.php */