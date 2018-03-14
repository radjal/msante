<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a products module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Products Module
 */
class Products_categories_m extends MY_Model {

	public function __construct()
	{		
		parent::__construct();
		
		/**
		 * If the products module's table was named "products"
		 * then MY_Model would find it automatically. Since
		 * I named it "products" then we just set the name here.
		 */
		$this->_table = 'products_categories';
	}

	/**
         * make sure the slug is valid
         */
	public function _check_slug($slug)
	{
		$slug = strtolower($slug);
		$slug = preg_replace('/\s+/', '-', $slug);

		return $slug;
	}
        
	/**
         * create a new item
         */
	public function create($to_insert)
	{		
                $to_insert['slug'] = $this->_check_slug($to_insert['slug']);
                // some cleaning of inputs
                unset($to_insert['btnAction']);
                $to_insert['created_on'] = !empty($to_insert['created_on']) ? $to_insert['created_on'] : null;
                $to_insert['updated_on'] = !empty($to_insert['updated_on']) ? $to_insert['updated_on'] : null;
           
		return $this->db->insert('products_categories', $to_insert);
	}
	
	/**
         * return a array of category ids and name
         */
	public function category_ids()
	{	
            $this->db->select('id, name');
            $query = $this->db->get('products_categories');
            if(count($query->result_array())> 0 ) 
            {
                foreach ($query->result_array() as $row)
                {
                    $res[$row['id']] = $row['name'];
                }                
            } else {
                return array() ;
            }

            return $res;
	}
	
	/**
         * return a category name from id
         */
	public function category_name($id)
	{
            // cache results
            $c_name = "PROD_CAT_".strtoupper($id)."_NAME" ;
            if(defined($c_name)) return constant ($c_name);
            $query = $this->db->get_where('products_categories', array('id' => $id), 1);
            $res = $query->row_array();
            define($c_name, $res['name']);
            return $res['name'];
	}
        
	/**
         * return a category id from name
         */
	public function category_id($slug)
	{		
            // cache results
            $c_id = "PROD_CAT_".strtoupper($slug)."_ID" ;
            if(defined($c_id)) return constant ($c_id);
            $query = $this->db->get_where('products_categories', array('slug' => $slug), 1);
            $res = $query->row_array();
            define($c_id, $res['id']);
            return $res['id'];
	}
        
        /** returns ids corresponding to category slug or slugs, can take 
         * a string of category slugs, separated by a space, which is rawurldecoded
         * 
         * @param string category slugs, separated by a space 
         * @return string comma separated ids of category slugs
         */
        public function categories_slug2id($cats_slugs) 
        {
            $cats_slugs = rawurldecode($cats_slugs);
            $cat_slugs = explode(" ", trim($cats_slugs));

            foreach ($cat_slugs as $cat_slugname) {
                $cat_slugids[] = $this->products_categories_m->category_id($cat_slugname);
            }
            return implode(' ', $cat_slugids) ;
        }
}
