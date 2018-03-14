<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a code module for PyroCMS
 *
 * @author 		Jerel Unruh - PyroCMS Dev Team
 * @website		http://unruhdesigns.com
 * @package 	PyroCMS
 * @subpackage 	Tokens Module
 */
class Admin extends Admin_Controller
{
	protected $section = 'items';

	public function __construct()
	{
		parent::__construct();

		// Load all the required classes
		$this->load->model('token_m');
		$this->load->model('html_m');
		$this->load->library('form_validation');
		$this->lang->load('token');

		// Set the validation rules
		$this->item_validation_rules = array(
			array(
				'field' => 'token',
				'label' => 'Token',
				'rules' => 'required'
			),
			array(
				'field' => 'ip',
				'label' => 'Ip',
				'rules' => 'required'
			)
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
	 * List all items
	 */
	public function index($page = 1)
	{
		// here we use MY_Model's get_all() method to fetch everything
		//$items = $this->token_m->get_all();
            
            $limit = 20;
            $offset = $page < 2 ? 0 : ($page-1) * $limit;
            $pag_segment = 4;
            $pag_uri = "admin/token/page";
            $orderby = 'id';
            $sortdir = 'DESC';
            $svars = false;
            //searching
            if(!empty($this->input->get('searchBtn')))
            {	
                $svars = $this->input->get();
                $this->token_m->_set_search($svars);
            }
            //sorting
            if(!empty($this->input->get('sort'))) $orderby = $this->input->get('sort'); 
            if(!empty($this->input->get('sortdir'))) $sortdir = strtoupper($this->input->get('sortdir'));
            $this->db->order_by($orderby, $sortdir); //default
            $this->db->limit($limit, $offset);
            $items = $this->db->get('tokens')
                            ->result();                                    
            
            
		// Build the view with token/views/admin/items.php
		$this->template
			->title($this->module_details['name'])
			->set('items', $items)
			->build('admin/items');
	}

	/**
	 * List all items after cleaning old tokens
	 */
	public function cleanup()
	{
            $this->token_m->cleanup_dead_tokens(0);
            //$this->index();
            redirect('admin/token');
	}
	/**
	 * List all items after cleaning old tokens
	 */
	public function kill()
	{
            $this->token_m->kill_tokens(0);
            //$this->index();
            redirect('admin/token');
	}

	public function create()
	{/*
		// Set the validation rules from the array above
		$this->form_validation->set_rules($this->item_validation_rules);

		// check if the form validation passed
		if ($this->form_validation->run())
		{
                
			// See if the model can create the record
			if ($this->token_m->get_token())
			{
				// All good...
				$this->session->set_flashdata('success', lang('token.success'));
				redirect('admin/token');
			}
			// Something went wrong. Show them an error
			else
			{
				$this->session->set_flashdata('error', lang('token.error'));
				redirect('admin/token/create');
			}
		}
		*/
                $token_no= $this->token_m->get_token();
                //$token = new stdClass;
		/* 
		foreach ($this->item_validation_rules as $rule)
		{
			$token->{$rule['field']} = $this->input->post($rule['field']);
		}*/
                
                $token = $this->token_m->retrieve_token($token_no);
		// Build the view using token/views/admin/form.php
		$this->template
			->title($this->module_details['name'], lang('token.new_item'))
			->set('token', $token)
			->build('admin/form');
	}
	
	public function edit($id = 0)
	{
		$token = $this->token_m->get($id);

		// Set the validation rules from the array above
		$this->form_validation->set_rules($this->item_validation_rules);

		// check if the form validation passed
		if ($this->form_validation->run())
		{
			// get rid of the btnAction item that tells us which button was clicked.
			// If we don't unset it MY_Model will try to insert it
			unset($_POST['btnAction']);
			
			// See if the model can create the record
			if ($this->token_m->update($id, $this->input->post()))
			{
				// All good...
				$this->session->set_flashdata('success', lang('token.success'));
				redirect('admin/token');
			}
			// Something went wrong. Show them an error
			else
			{
				$this->session->set_flashdata('error', lang('token.error'));
				redirect('admin/token/create');
			}
		}

		// Build the view using token/views/admin/form.php
		$this->template
			->title($this->module_details['name'], lang('token.edit'))
			->set('token', $token)
			->build('admin/form');
	}
	
	public function delete($id = 0)
	{
		// make sure the button was clicked and that there is an array of ids
		if (isset($_POST['btnAction']) AND is_array($_POST['action_to']))
		{
			// pass the ids and let MY_Model delete the items
			$this->token_m->delete_many($this->input->post('action_to'));
		}
		elseif (is_numeric($id))
		{
			// they just clicked the link so we'll delete that one
			$this->token_m->delete($id);
		}
		redirect('admin/token');
	}
}
