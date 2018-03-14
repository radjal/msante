<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a products module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Products Module
 */
class Products_m extends MY_Model {

	public function __construct()
	{		
		parent::__construct();
		
		/**
		 * If the products module's table was named "products"
		 * then MY_Model would find it automatically. Since
		 * I named it "products" then we just set the name here.
		 */
		$this->_table = 'products';
	}
	
	//make sure the slug is valid
	public function _check_slug($slug)
	{
		$slug = strtolower($slug);
		$slug = preg_replace('/\s+/', '-', $slug);

		return $slug;
	}
                
	/**
         * create a product in DB
         * 
         * @param array $to_insert
         * @return boolean  DB insertion operation result
         */
	public function create($to_insert)
	{		
                $to_insert['slug'] = $this->_check_slug($to_insert['slug']);
                $to_insert['created_on'] = date( "Y-m-d H:i:s" );
                
                if(is_array($to_insert['cat_id'])) $to_insert['cat_id'] = implode ("\r\n", $to_insert['cat_id']);
                
		return $this->db->insert('products', $to_insert);
	}
        
        /**
         * add HTML code for input and image tags for products in products array
         * uses array of products
         * requires Orders module
         * 
         * @param array $products
         * @return array
         */
        public function add_html($products)
        {
            if(count($products) == 0) return false;
            
            $this->load->model('orders_m');
            $cart = $this->orders_m->get_cookie_cart();
            $post = $this->input->post('product');
            foreach ($products as $p => $p_details) {            
				$extra = '';
				$type = 'text';
				$np = get_object_vars($p_details);
                                $pname = "product[{$np['id']}]";

                                $fvalue = (isset($cart[$np['id']]) AND !empty($cart[$np['id']])) ? $cart[$np['id']] : '';
                                $fvalue = (isset($post[$np['id']]) AND !empty($post[$np['id']])) ? $post[$np['id']] : $fvalue;
                                $fvalue = (isset($post[$np['id']]) AND $post[$np['id']]==0) ? $post[$np['id']] : $fvalue; // if zero
                                
                                // disable if no stock and stock management active
                                if(Settings::get('manage_stock') == 1 ) $extra = $np['stock'] > 0 ? 'max="'. $np['stock'].'"' : 'disabled ';
                                $extra .= !empty($fvalue) ? ' value="'.$fvalue.'"' : '' ;
                                $extra .= ' min="0"' ;

                                if($np['unit'] == 'unitary') $type = 'number' ;

                                $input = '<input class="order_product" id="'.$pname.'" name="'.$pname.'" type="'.$type.'" '.$extra.' data-dtprice="'.$np['price'].'" data-price="'.$np['final_price'].'" />';
                                $img = '<img src="'.site_url().UPLOAD_PATH.'products/'.$np['image_filename'].'" height="100" >';

                                $np['img_html'] = $img ;
                                $np['input_html'] = $input;
                    $newproducts [] = $np;
            }
            
            return $newproducts;
        }
        
	/** 
         * update a product by id
         * 
         * @param int $id
         * @param array $to_insert
         * @return boolean DB operation result
         */
	public function update_by_id($id, $to_insert)
	{		
                if(empty($id)) return false;
                $to_insert['updated_on'] = date( "Y-m-d H:i:s" );
                
                if(is_array($to_insert['cat_id'])) $to_insert['cat_id'] = implode ("\r\n", $to_insert['cat_id']);
                
                $ret = $this->products_m->update($id, $to_insert);
                        
               return $ret;
	}
        
        /**
         * return array of categories for a product
         * 
         * @param int $product_id
         * @return array 
         */
        public function categories_get($product_id) 
        {
                $categories = $this->db
                                    ->get_where('products_assign_cat', array('product_id' => $product_id))
                                    ->result_array();
                return $categories;
        }
        
        /**
         * Save product to category assignements for multiple categories
         * require product id and categories array
         * 
         * @param int $product_id
         * @param array $cat_array
         * @return boolean 
         */
        public function categories_save($product_id, $cat_ids_array) 
        {
            if( !is_array($cat_ids_array) )                return false ;
            $date = date( "Y-m-d H:i:s" );
            $res = false;
            if(count($cat_ids_array) > 0) 
            {
                foreach ($cat_ids_array as $key => $cat_id)
                {
                    $to_insert[$key]['product_id'] = $product_id ;
                    $to_insert[$key]['category_id'] = $cat_id ;
                    $to_insert[$key]['created_on'] = $date ;
                    $to_insert[$key]['updated_on'] = $date ;
                }
                $res = $this->db->insert_batch('products_assign_cat', $to_insert);
            }

            return $res;
        }
        
        /** 
         * delete all category assignements for a product
         * 
         * @param int $product_id
         * @return boolean
         */
        public function categories_del($product_id) 
        {
            $this->db->where('product_id', $product_id);
            $res = $this->db->delete('products_assign_cat'); 
            return $res ;
        }
        
        public function prepare_post($postarray) 
        {       
                if(isset($postarray['btnAction'])) unset($postarray['btnAction']) ; // cleaning
                $postarray['active'] = $postarray['active'] ?  $postarray['active'] : 0;
                $postarray['cat_id'] = isset($postarray['cat_id']) ?  $postarray['cat_id'] : ''; // @todo cat_id should accept null
                $postarray['stock'] = !empty($postarray['stock']) ? $postarray['stock'] : 0;
                $postarray['price'] = !empty($postarray['price']) ? str_replace(',', '.', $postarray['price']) : 0;
                $postarray['tax'] = !empty($postarray['tax']) ? str_replace(',', '.', $postarray['tax']) : 0;
                $postarray['final_price'] = !empty($postarray['final_price']) ? str_replace(',', '.', $postarray['final_price']) : 0;
                $postarray['start_date'] = !empty($postarray['start_date']) ? $postarray['start_date'] : null;
                $postarray['end_date'] = !empty($postarray['end_date']) ? $postarray['end_date'] : null;
                $postarray['created_on'] = !empty($postarray['created_on']) ? $postarray['created_on'] : null;
                $postarray['updated_on'] = !empty($postarray['updated_on']) ? $postarray['updated_on'] : null;
                $postarray['image_filename'] = !empty($postarray['image_filename']) ? $postarray['image_filename'] : '';
                
                if( $postarray['tax'] > 0 and $postarray['price'] > 0) // tax priced
                {
                   $postarray['final_price'] =  $postarray['price'] + ($postarray['price'] * ($postarray['tax']/100) );
                } 
                elseif($postarray['tax'] > 0 and $postarray['final_price'] > 0)
                {
                    $postarray['price'] =  $postarray['final_price'] - ($postarray['final_price'] * ($postarray['tax']/100) );
                }
                
                $postarray['price'] =  number_format($postarray['price'],2);
                $postarray['final_price'] =  number_format($postarray['final_price'],2);
                        
//                foreach ($postarray as $key => $value) // unset unused vars
//                {
//                    if($value == null )   
//                    {
//                        unset($postarray[$key]);
//                    }
//                }
                
                return $postarray;
        }
        
        public function uploadfile($newname, $inputname)
        {
            if(empty($newname)) $newname = uniqid();
            $this->load->library('upload');
            $upload = new CI_Upload();
            
            $newname = $upload->clean_file_name($newname);
            $newname = $this->remove_accents($newname);
            $newname = $upload->limit_filename_length($newname, 20);
            
            $config =  array(
                        'upload_path'     => UPLOAD_PATH.'products',
                        'upload_url'      => base_url().UPLOAD_PATH.'products',
                        'file_name'      => $newname,
                        'allowed_types'   => "gif|jpg|png|jpeg",
                        'overwrite'       => true, 
                    );

            $upload->initialize($config);
            $upload->do_upload($inputname);

                    if ($upload->display_errors() > '')
                    {
                            $this->session->set_flashdata('error', $upload->display_errors());
                    } else 
                    {
                            $this->session->set_flashdata('success', "File uploaded");
                    }
                    if($upload->image_width > 200 OR $upload->image_height > 200 )
                    {
                            $image = $this->load->library('image_lib');

                            $imgconf['image_library']    = 'gd2';
                            $imgconf['source_image']     = $upload->upload_path.$upload->file_name;
                            $imgconf['new_image']        = $upload->upload_path.$upload->file_name;
                            $imgconf['create_thumb'] = false;
                            $imgconf['maintain_ratio']   = true;
                            $imgconf['width']            = 200;
                            $imgconf['height']           = 200;
                            $image->initialize($imgconf);
//                                                ci()->image_lib->resize();
//
//                                                $data['width'] =image()->image_lib->width;
//                                                $data['height'] =image()->image_lib->height;
                                        
                            $res = $image->resize();    
                            
                            if ($image->display_errors() > '')
                            {
                                    $this->session->set_flashdata('error', $image->display_errors());
                            } else 
                            {
                                    $this->session->set_flashdata('success', "Image resized");
                            }   
                    }
                    $return = array(
                        'image_filename' => $upload->file_name ,
                    );
                    
                    return (object) $return;
        }
        
        public function remove_accents($text)
	{
                // transformer les caractères accentués en entités HTML
                $text = htmlentities($text, ENT_NOQUOTES, 'utf-8');

                // remplacer les entités HTML pour avoir juste le premier caractères non accentués
                // Exemple : "&ecute;" => "e", "&Ecute;" => "E", "Ã " => "a" ...
                $text = preg_replace('#&([A-za-z])(?:acute|grave|cedil|circ|orn|ring|slash|th|tilde|uml);#', '\1', $text);

                // Remplacer les ligatures tel que : Œ, Æ ...
                // Exemple "Å“" => "oe"
                $text = preg_replace('#&([A-za-z]{2})(?:lig);#', '\1', $text);
                // Supprimer tout le reste
                $text = preg_replace('#&[^;]+;#', '', $text);

            return stripslashes($text);
	}

	/** 
         * get file content of modules/products/$filepath
         * @param string $filepath
         * @param string $output JSON or oneline
         * @return string file content
         */
	public function getfile($filepath, $output=false)
	{
		$output = strtolower($output);
		$path = ADDONPATH."modules/products/$filepath";
		
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
        
        /** 
         * return products corresponding to params
         * 
         * @param string $search searches name field
         * @param string $cat_slugids ids of categories to keep, space separated
         * @param int $limit
         * @param int $offset
         * @param bool $active 1 or 0
         * @param string $where
         * @param string $orderby
         * @param string $sortdir
         * @return type
         */
        public function products_get($search = false, $cat_slugids=false, $limit=10, $offset=0, $active = 1, $where = false, $orderby = 'id', $sortdir = 'DESC', $distinct = false, $fields ="*") 
        {
            $distinct = $distinct ? " DISTINCT " : '';
            $sql_cat_filter = "GROUP BY default_products.id  ";
            $where = !$where ? '' : " $where" ;
            $search = !$search ? '' :  "AND default_products.name LIKE '%$search%'"  ;
            if($cat_slugids != false ) // filters, uri category
            {
                    $cat_slugids = rawurldecode($cat_slugids);
                    $cat_slugids = explode(' ', $cat_slugids);
                    $cats_count = count($cat_slugids);
                    $cat_slugids = implode(', ', $cat_slugids);
                    
                    $sql_cat_filter = "AND default_products_assign_cat.category_id IN($cat_slugids) 
                                        GROUP BY default_products.id 
                                        HAVING COUNT(default_products.id) = $cats_count";
            }
            
            $sql = "SELECT $distinct default_products.$fields
                                FROM default_products
                                    LEFT JOIN default_products_assign_cat ON default_products.id = default_products_assign_cat.product_id    
                                    LEFT JOIN default_products_categories ON default_products_assign_cat.category_id = default_products_categories.id
                                WHERE 
                                active = $active 
                                $search
                                $where    
                                $sql_cat_filter
                                ORDER BY default_products.$orderby $sortdir
                                LIMIT $limit OFFSET $offset
                    ";
//            die($sql);
            $query = $this->db->query($sql);
            $ret = $query->result();
            return $ret;
        }
        
        /**
         * for counting number of total results of correspondinf function products_get()
         * 
         * @param string $search
         * @param string $cat_slugids ids of categories to keep, space separated
         * @param bool $active 1 or 0
         * @param string $where
         * @return type
         */
        public function products_count_all($search = false, $cat_slugids=false, $active = 1, $where = false ) 
        {
            $sql_cat_filter = 'GROUP BY default_products.id ';
            
            $where = !$where ? '' : " $where" ;
            $search = !$search ? '' :  "AND default_products.name LIKE '%$search%'"  ;
            
            if($cat_slugids != false ) // filters, uri category
            {
                    $cat_slugids = explode(' ', $cat_slugids);
                    $cats_count = count($cat_slugids);
                    $cat_slugids = implode(', ', $cat_slugids);
                    
                    $sql_cat_filter = "AND default_products_assign_cat.category_id IN($cat_slugids) 
                                        GROUP BY default_products.id 
                                        HAVING COUNT(default_products.id) = $cats_count";
            }
            
            $sql = "Select COUNT(*) total_rows
                        From   (
                                SELECT 
                                COUNT( default_products.id ) nb_rows
                                FROM default_products
                                    LEFT JOIN default_products_assign_cat ON default_products.id = default_products_assign_cat.product_id    
                                    LEFT JOIN default_products_categories ON default_products_assign_cat.category_id = default_products_categories.id
                                WHERE 
                                active = $active 
                                $search
                                $where $sql_cat_filter
                                ORDER BY default_products.id DESC
                        ) AS count
                    ";
            
            $query = $this->db->query($sql);
            $ret = $query->row();
            return $ret->total_rows;
        }
        
}
