<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a code module for PyroCMS
 *
 * @author 		 
 * @website		 
 * @package 	PyroCMS
 * @subpackage 	Token Module
 */
class Token extends Public_Controller
{
	public function __construct()
	{
		parent::__construct();

		// Load the required classes
		$this->load->model('token_m');
		$this->lang->load('token');

		$this->template
			->append_css('module::token.css')
			->append_js('module::token.js');
	}
 
	/**
	 * All items
	 */
	public function listtokens($offset = 0)
	{
		// set the pagination limit
		$limit = 5;
		
		$items = $this->token_m->limit($limit)
			->offset($offset)
			->get_all();
			
		// we'll do a quick check here so we can tell tags whether there is data or not
		$items_exist = count($items) > 0;

		// we're using the pagination helper to do the pagination for us. Params are: (module/method, total count, limit, uri segment)
		$pagination = create_pagination('token', $this->token_m->count_all(), $limit, 2);

		$this->template
			->title($this->module_details['name'], ' listing')
			->set('items', $items)
			->set('items_exist', $items_exist)
			->set('pagination', $pagination)
			->build('listtokens');
	}
        
        public function index() 
        {   
            $this->template->title($this->module_details['name'], ' index')
                    ->set('html', '')
                    ->build('index');
        }

	public function get()
	{
            $html= $this->token_m->get_token();                
            $this->input->is_ajax_request() AND $this->template->set_layout(false);
			$this->template->title($this->module_details['name'], ' get')
				->set('html', $html )
				->build('index');
	}
     
	public function check($token =false)
	{
             $this->input->is_ajax_request() AND $this->template->set_layout(false);
               $this->template->title($this->module_details['name'], ' check')
                    ->set('html', $this->token_m->check_token($token))
                    ->build('index');
	}
}