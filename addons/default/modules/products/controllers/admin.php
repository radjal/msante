<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a products module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Products Module
 */
class Admin extends Admin_Controller
{
	protected $section = 'items';

	public function __construct()
	{
		parent::__construct();

		// Load all the required classes
		$this->load->model('products_m');
		$this->load->model('products_categories_m');
		$this->load->model('html_m');
		$this->load->library('form_validation');
		$this->lang->load('products');

		// Set the validation rules
		$this->item_validation_rules = array(
			array(
				'field' => 'name',
				'label' => 'Name',
				'rules' => 'trim|max_length[100]|required'
			),
			array(
				'field' => 'slug',
				'label' => 'Slug',
				'rules' => 'trim|max_length[100]|required|unique'
			),
                        array(
				'field' => 'active',
				'label' => 'Active',
				'rules' => 'required'
                        ),
                        array(
				'field' => 'cat_id',
				'label' => 'Category',
				'rules' => ''
                        ),
                        array(
				'field' => 'parent_cid',
				'label' => 'Category',
				'default' => 0,
				'rules' => ''
                        ),
			array(
				'field' => 'unit',
				'label' => 'Units',
				'rules' => ''
                        ),
			array(
				'field' => 'stock',
				'label' => 'Stock',
				'default' => 0,
				'rules' => ''
                        ),
			array(
				'field' => 'price',
				'label' => 'Price',
				'default' => 0,
				'rules' => ''
                        ),
			array(
				'field' => 'tax',
				'label' => 'Tax',
				'default' => 0,
				'rules' => ''
                        ),
			array(
				'field' => 'final_price',
				'label' => 'Final price',
				'rules' => ''
                        ),
			array(
				'field' => 'origin',
				'label' => 'Origin',
				'rules' => ''
                        ),
			array(
				'field' => 'description',
				'label' => 'Description',
				'rules' => ''
                        ),
			array(
				'field' => 'image_filename',
				'label' => 'Image',
				'rules' => ''
                        ),
			array(
				'field' => 'start_date',
				'label' => 'Start date',
				'rules' => ''
                        ),
			array(
				'field' => 'end_date',
				'label' => 'End date',
				'rules' => ''
                        ),
//                        array(
//				'field' => 'created_on',
//				'label' => 'Created',
//				'rules' => ''
//                        ),
//			array(
//				'field' => 'updated_on',
//				'label' => 'Updated',
//				'rules' => ''
//                        ),
		);

		// We'll set the partials and metadata here since they're used everywhere
		$this->template->append_js('module::admin.js')
						->append_css('module::admin.css');
	}

        /**
         * multi page view
         * @param int $offset
         */
        public function page($page = 1 )
        {
            $this->index($page);
        }
        
	/**
	 * List products with pagination
	 */
	public function index($page = 1)
	{
            /*
//		$where = '';
//		$sort = !empty($this->input->get('sort')) ? $this->input->get('sort') : 'id';
//		$sortdir = !empty($this->input->get('sortdir')) ? $this->input->get('sortdir') : 'desc';
//		$filter = !empty($this->input->get('filter')) ? $this->input->get('filter') : '';
//		$filter_on = !empty($this->input->get('filter_on')) ? $this->input->get('filter_on') : 'order_status';
//                
//                if(!empty($filter)) $where = "$filter_on = '$filter'";
//                
//		// here we use MY_Model's get_all() method to fetch everything
//		$this->db->order_by($sort, $sortdir);
//                if(!empty($where)) $this->db->where($where); 
//		$products= $this->products_m->get_all(); 
             * */

            // set the pagination limit
		$limit = 20;
                $offset = $page < 2 ? 0 : ($page-1) * $limit;
                $pag_segment = 4;
                $pag_uri = "admin/products/page";
                $search = false;
                $where = false; 
                $active = 1 ;
                $orderby = 'id';
                $sortdir = 'DESC';
                $cat_slugids = false;
                    //searching
                    if(!empty($this->input->get('searchBtn'))) 
                    {
                        //$this->_set_search();
                        $svars = $this->input->get();
                        // convert to string if array
                        if(isset($svars['cat_id']) && is_array($svars['cat_id']) ) $svars['cat_id'] = implode (' ', $svars['cat_id']); 
                        if(isset($svars['active']) ) $active = $svars['active'];
                        if(!empty($svars['name'])) $search = $svars['name'];
                        if(!empty($svars['id'])) $where .= " AND default_products.id LIKE '{$svars['id']}%'";
                        if(!empty($svars['unit'])) $where .= " AND default_products.unit LIKE '{$svars['unit']}'";
                        if(!empty($svars['tax'])) $where .= " AND default_products.tax LIKE '{$svars['tax']}%'";
                        if(!empty($svars['price'])) $where .= " AND default_products.price LIKE '{$svars['price']}%'";
                        if(!empty($svars['final_price'])) $where .= " AND default_products.final_price LIKE '{$svars['final_price']}%'";
                        if(!empty($svars['stock'])) $where .= " AND default_products.stock LIKE '{$svars['stock']}%'";
                        if(!empty($svars['parent_cid'])) $where .= " AND default_products.parent_cid = '{$svars['parent_cid']}'";
                        if(isset($svars['cat_id']) && !empty($svars['cat_id'])) $cat_slugids = trim($svars['cat_id']) ;
                    }
                    
                    //sorting
                    if(!empty($this->input->get('sort'))) $orderby = $this->input->get('sort'); 
                    if(!empty($this->input->get('sortdir'))) $sortdir = strtoupper($this->input->get('sortdir'));
                    
                    $products = $this->products_m->products_get($search, $cat_slugids, $limit, $offset, $active, $where, $orderby, $sortdir) ;
                    
                    // count results
                    $rescount = $this->products_m->products_count_all($search, $cat_slugids, $active, $where) ;
                    // pagination
                    $pagination = create_pagination($pag_uri, $rescount, $limit, $pag_segment);
                
                    // Build the view with products/views/admin/items.php
                    $this->template
                            ->title($this->module_details['name'])
                            ->set('products', $products)
                            ->set('pagination', $pagination)
                            ->set('total_rows', $rescount)
                            ->build('admin/products_at');
        }

	public function create()
	{
		// Set the validation rules from the array above
		$this->form_validation->set_rules($this->item_validation_rules);
                // check if the form validation passed
		if ($this->form_validation->run())
		{      
                     $post = $this->products_m->prepare_post($this->input->post());
                     
                        // See if the model can create the record
			if ($this->products_m->create( $post ))  
			{
                                $pid = $this->db->insert_id();
                                // multi cat
                                $categories = $this->input->post('cat_id[]') ;
                                if(is_array($categories) AND count($categories) > 0 ) 
                                {
                                    $this->products_m->categories_save($pid, $categories) ;
                                }
                                // upload file
                                if(!empty($_FILES['image_filename']['name']))  
                                {
                                    $up = $this->products_m->uploadfile("p_$pid", 'image_filename') ;
                                    $this->products_m->update($pid, $up);
                                }
                                // All good...
				$this->session->set_flashdata('success', lang('products:success'));
				redirect('admin/products/');
			}
			// Something went wrong. Show them an error
			else
			{
				$this->session->set_flashdata('error', lang('products:error'));
				redirect('admin/products');
			}
		}
		
 		$products = new stdClass;
		foreach ($this->item_validation_rules as $rule)
		{
			$products->{$rule['field']} = $this->input->post($rule['field']);
		}
                
                if(isset($up)) $products->image_filename = $up->image_filename ;
		// Build the view using products/views/admin/product_form_at.php
		$this->template
			->title($this->module_details['name'], lang('products:new_item'))
			->set('products', $products)
			->build('admin/product_form_at');
	}
	
	public function edit($id = 0)
	{
            $updated=false;
                $products = $this->products_m->get($id); //@todo make function for multiple relation cat
		$this->form_validation->set_rules($this->item_validation_rules);
                
		// check if the form validation passed
		if (isset($_POST['btnAction']) AND $this->form_validation->run())
		{       
                        $pvars = $this->products_m->prepare_post($this->input->post());
                        // multi cat
                        $categories = $this->input->post('cat_id') ;
                        if(is_array($categories) AND count($categories) > 0 ) 
                        {
                            $this->products_m->categories_del($id) ;
                            $this->products_m->categories_save($id, $categories) ;
                        }
                        // upload file
                        if(!empty($_FILES['image_filename']['name']))  
                        {
                            $up = $this->products_m->uploadfile("p_$id", 'image_filename') ;
                            $pvars['image_filename']  = $up->image_filename;
                        }
                        
                        $updated = $this->products_m->update_by_id($id, $pvars ) ;
			if ($updated)
			{   
				$this->session->set_flashdata('success', lang('products:success'));
				if($this->input->post('btnAction') == "save_exit") 
                                {
                                    redirect("admin/products/");
                                } else {
                                    redirect("admin/products/edit/$id");
                                }
			}
			else
			{
				$this->session->set_flashdata('error', lang('products:error'));
				redirect('admin/products');
			}
		} 

		// Build the view using products/views/admin/product_form_at.php
		$this->template
			->title($this->module_details['name'], lang('products:edit'))
			->set('products', $products)
			->build('admin/product_form_at');
	}
	
	public function delete($id = 0)
	{
		// make sure the button was clicked and that there is an array of ids
		if (isset($_POST['btnAction']) AND is_array($_POST['action_to']))
		{
			// pass the ids and let MY_Model delete the items
			$this->products_m->delete_many($this->input->post('action_to'));
		}
		elseif (is_numeric($id))
		{
			// they just clicked the link so we'll delete that one
			$this->products_m->delete($id);
		}
		redirect('admin/products');
	}
                
        public function copy($id = false) 
        {
            if(!$id)                return;
            $product = $this->products_m->get($id);
            $data = get_object_vars($product);
            unset($data['id']);
            $data = $this->products_m->prepare_post($data);
            $res = $this->products_m->create( $data );
            $pid = $this->db->insert_id();
            $categories = explode("\r\n", $data['cat_id']) ;
                    if(is_array($categories) AND count($categories) > 0 ) 
                    {
                        $this->products_m->categories_save($pid, $categories) ;
                    }
                    
                    
            if($res) 
            {
                    $this->session->set_flashdata('success', lang('products:success'));
                    redirect("admin/products/edit/$pid");
            } else {
                    $this->session->set_flashdata('error', lang('products:error'));
                    redirect('admin/products');
            }
        }

}
