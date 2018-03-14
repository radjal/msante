<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a products module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Products Module
 */
class Plugin_Products extends Plugin
{
    	/**
	 * JS as JSON string
	 * Usage:
	 * 
	 * {{ products:js encode='oneline' }} json or oneline(escaped)
	 *
	 * @return	array
	 */
	function js()
	{
		$this->load->model('products_m');
		//$this->lang->load('orders');
                
                $encode = strtolower($this->attribute('encode'));
		
		return $this->products_m->getfile('js/products.js', $encode);
	}
        
	/**
	 * CSS as JSON string
	 * Usage:
	 * 
	 * {{ products:css encode='oneline' }} json or oneline(escaped)
	 *
	 * @return	array
	 */
	function css()
	{
		$this->load->model('products_m');
		//$this->lang->load('orders');
                
                $encode = strtolower($this->attribute('encode'));
		
		return $this->products_m->getfile('css/products.css', $encode);
	}
        
        /**
         * {{ products:categories limit="5" order="asc" cat_id="2" parent_id="1" order_by="id" no_cat_id="1,2" no_pid="5,6" }}
         *      {{ id }} {{ parent_id}} {{ name }} {{ slug }}
         * {{ /products:categories }}
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
         *  
         * products_get($search = false, $cat_slugids=false, $limit=10, $offset=0, $active = 1, $where = false, $orderby = 'id', $sortdir = 'DESC', $distinct = false, $fields ="*" ) 
         * {{ products:get search = "salade" cat_slugs="dessert jeudi" limit=10 offset=0 active = "1" orderby = "id" sortdir = "desc" wstock="yes"  distinct="yes" fields="name, final_price" }}
         *      {{ id }} {{ parent_id}} {{ name }} {{ slug }}
         * {{ /products:get }} 
         * @return type
         */
        function get()
        {		
            // params
		$limit = !empty($this->attribute('limit')) ? $this->attribute('limit') : 5;
		$offset = !empty($this->attribute('offset')) ? $this->attribute('offset') : 0 ;
                
		$search = !empty($this->attribute('search')) ? $this->attribute('search') : false;
		$cat_slugs = !empty($this->attribute('cat_slugs')) ? rawurldecode($this->attribute('cat_slugs')) : false;
		$active = !empty($this->attribute('active')) ? $this->attribute('active') : 1;
		$where = strtolower($this->attribute('wstock')) == 'yes' ? "AND default_products.stock > 0" : '';
		$orderby = !empty($this->attribute('order_by')) ? $this->attribute('order_by') : 'name';
		$sortdir =!empty($this->attribute('order')) ? $this->attribute('order') : 'ASC';
		//$groupby = !empty($this->attribute('groupby')) ? $this->attribute('groupby') : 'id';
		$distinct = strtolower($this->attribute('distinct')) == 'yes' ? true : false;
		$fields = !empty($this->attribute('fields')) ? $this->attribute('fields') : '*';
                
                $cat_slugids = false ;
                if($cat_slugs != false) 
                {
                    $this->load->model('products_categories_m');
                    $cat_slugids = $this->products_categories_m->categories_slug2id($cat_slugs) ;
                }
                $products = $this->products_m->products_get($search , $cat_slugids , $limit, $offset, $active, $where, $orderby, $sortdir, $distinct, $fields  ) ;
                
                return $products ;
        }
        
	/** 
	 * Products List, DOES NOT WORK for multi category products
	 * Usage:
	 * 
	 * {{ products:products limit="5" order="asc" cat_id="2" parent_cid="1" wstock="yes" order_by="id" no_cat_id="1,2" no_pcid="5,6" group_by="cat_id" }}
	 *      {{ id }} {{ name }} {{ slug }}
	 *      {{ input_html }} {{ img_html }} {{ img_url }}
	 * {{ /products:products }}
	 *
	 * @return	array
	 */
	function products()
	{
		$this->load->model('orders_m');
        
		// params
		$limit = $this->attribute('limit') ;
		$order = $this->attribute('order');
		$cat_id = $this->attribute('cat_id');
		$parent_cid = $this->attribute('parent_cid');
		$slug = $this->attribute('slug');
		$wstock = $this->attribute('wstock');
		$order_by = !empty($this->attribute('order_by')) ? $this->attribute('order_by') : 'name';
		$no_cat_id = $this->attribute('no_cat_id');
		$no_pcid = $this->attribute('no_pcid');
		$group_by = $this->attribute('group_by');
		$distinct = $this->attribute('distinct');
                
            // query setting
                if(!empty($cat_id)) $this->db->where("cat_id","$cat_id");
                if(!empty($parent_cid)) $this->db->where("parent_cid","$parent_cid");
                if('yes' == strtolower($wstock)) $this->db->where("stock > 0");
                if(!empty($slug)) $this->db->where("slug",$slug);
                if(!empty($limit)) $this->db->limit($limit);
                if(!empty($order)) $this->db->order_by($order_by, $order);
                if(!empty($no_cat_id)) $this->db->where_not_in('cat_id', explode(',', $no_cat_id));
                if(!empty($no_pcid)) $this->db->where_not_in('parent_cid', explode(',', $no_pcid));
                
                $products = $this->db
                        ->where('active', 1)
                            ->get('products')
                                    ->result_array();
                
                $selected = isset($_POST['product']) ? $_POST['product'] : array(0);
                $products = $this->orders_m->products_list_html($products, $selected);
                            
                return $products;
	}
            
        /**
	 * Cart total
	 * Usage:
	 * 
	 * {{ products:jscarttotal }} 
	 *
	 * @return	
	 */
	function jscarttotal()
	{
            
            $this->load->model('products_m');
           $html = "<!-- jscarttotal -->\r\n";
           $html .= '<script type="text/javascript">' ;
           $html .= $this->products_m->getfile("js/jscart.js" );
           
           $html .= "\r\n</script>" ;
           
            return $html;   
	}
        
        /**
	 * Products form header
	 * Usage:
	 * 
	 * {{ products:productsform_start action="uri" }}
	 *
	 * @return	array
	 */
	function productsform_start()    
        { 
            $action = $this->attribute('action') != null ?  $this->attribute('action') : 'orders';
           
            return form_open_multipart(site_url().$action, 'class="products-list"');
	}
        
        /**
	 * Products form end returns 
         * button in configurable wrapper div id 
         * and form close tag
	 * Usage:
	 * 
	 * {{ products:productsform_end wrapid="wrapperId" name="submitBtn" }}
	 *
	 * @return	array
	 */
	function productsform_end()    
        {           
            $wrapid = $this->attribute('wrapid') != null ?  $this->attribute('wrapid') : 'order_button';
            $showbutton = $this->attribute('showbutton') != null ?  $this->attribute('showbutton') : 'true';
            $showbutton = strtolower($showbutton) == 'true' ?  true : false ;
            $ret = '';
            $this->lang->load('products');
            $label = lang('products:order_save');
            
            if($showbutton) $ret .=  '<div id="'.$wrapid.'">'; 
            if($showbutton) $ret .=  form_submit('submit', $label, 'class=""'); 
            if($showbutton) $ret .=  '</div>'; 
            return $ret.form_close();
	}
}

/* End of file plugin.php */