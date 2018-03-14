<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a products module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Products Module
 */
class Admin_Categories extends Admin_Controller
{
	/** @var int The current active section */
	protected $section = 'categories';
        
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
				'rules' => 'trim|max_length[100]|required'
			),
//			array(
//				'field' => 'parent_id',
//				'label' => 'Parent id',
//				'rules' => 'required'
//			),
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
	 * List all items
	 */
	public function index()
	{
		$where = '';
		$sort = !empty($this->input->get('sort')) ? $this->input->get('sort') : 'id';
		$sortdir = !empty($this->input->get('sortdir')) ? $this->input->get('sortdir') : 'desc';
		$filter = !empty($this->input->get('filter')) ? $this->input->get('filter') : '';
		$filter_on = !empty($this->input->get('filter_on')) ? $this->input->get('filter_on') : 'order_status';
                
                if(!empty($filter)) $where = "$filter_on = '$filter'";
                
		// here we use MY_Model's get_all() method to fetch everything
		$this->db->order_by($sort, $sortdir);
                if(!empty($where)) $this->db->where($where); 
               $categories = $this->products_categories_m->get_all();

		// Build the view with products/views/admin/categories/index.php
		$this->template
			->title($this->module_details['name'])
			->set('categories', $categories)
			->build('admin/categories/products_cat_at');
	}

	public function create()
	{
		// Set the validation rules from the array above
		$this->form_validation->set_rules($this->item_validation_rules);

		// check if the form validation passed
		if ($this->form_validation->run())
		{
			// See if the model can create the record
			if ($this->products_categories_m->create($this->input->post()))
			{
				// All good...
				$this->session->set_flashdata('success', lang('products:success'));
				redirect('admin/products/categories/create');
			}
			// Something went wrong. Show them an error
			else
			{
				$this->session->set_flashdata('error', lang('products:error'));
				redirect('admin/products/categories/create');
			}
		}
		
                
                //unset other vars
//                unset($_POST['updated_on']);
//                unset($_POST['created_on']);
                
		$category = new stdClass;
		foreach ($this->item_validation_rules as $rule)
		{
			$category->{$rule['field']} = $this->input->post($rule['field']);
		}

		// Build the view using products/views/admin/categories/form.php
		$this->template
			->title($this->module_details['name'], lang('products:new_item'))
			->set('category', $category)
			->build('admin/categories/product_cat_form_at');
	}
	
	public function edit($id = 0)
	{
		$category = $this->products_categories_m->get($id);

		// Set the validation rules from the array above
		$this->form_validation->set_rules($this->item_validation_rules);

		// check if the form validation passed
		if ($this->form_validation->run())
		{
			// get rid of the btnAction item that tells us which button was clicked.
			// If we don't unset it MY_Model will try to insert it
			unset($_POST['btnAction']);
			
			// See if the model can create the record
			if ($this->products_categories_m->update($id, $this->input->post()))
			{
				// All good...
				$this->session->set_flashdata('success', lang('products:success'));
				redirect('admin/products/categories');
			}
			// Something went wrong. Show them an error
			else
			{
				$this->session->set_flashdata('error', lang('products:error'));
				redirect('admin/products/categories/create');
			}
		}

		// Build the view using products/views/admin/form.php
		$this->template
			->title($this->module_details['name'], lang('products:edit'))
			->set('category', $category)
			->build('admin/categories/product_cat_form_at');
	}
	
	public function delete($id = 0)
	{
		// make sure the button was clicked and that there is an array of ids
		if (isset($_POST['btnAction']) AND is_array($_POST['action_to']))
		{
			// pass the ids and let MY_Model delete the items
			$this->products_categories_m->delete_many($this->input->post('action_to'));
		}
		elseif (is_numeric($id))
		{
			// they just clicked the link so we'll delete that one
			$this->products_categories_m->delete($id);
		}
		redirect('admin/products/categories');
	}
}
