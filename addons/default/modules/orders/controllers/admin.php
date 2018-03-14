<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a orders module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Orders Module
 */
class Admin extends Admin_Controller
{
	protected $section = 'items';

	public function __construct()
	{
		parent::__construct();

		// Load all the required classes
		$this->load->model('orders_m');
		$this->load->model('html_m');
		$this->load->library('form_validation');
		$this->lang->load('orders');

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
			array(
				'field' => 'order_status',
				'label' => 'Status',
				'rules' => 'trim|max_length[100]|required'
			),
			array(
				'field' => 'total_pretax',
				'label' => 'Total pretax',
				'rules' => 'required'
			),			
			array(
				'field' => 'total_final',
				'label' => 'Total final',
				'rules' => 'required'
			),
			array(
				'field' => 'order_date',
				'label' => 'Order date',
				'rules' => 'required'
			),
			array(
				'field' => 'delivery_date',
				'label' => 'Delivery date',
				'rules' => 'required'
			),
			array(
				'field' => 'd_fullname',
				'label' => 'd_fullname',
				'rules' => 'required'
			),
//			array(
//				'field' => 'd_phone',
//				'label' => 'd_phone',
//				'rules' => 'required'
//			),
			array(
				'field' => 'd_street1',
				'label' => 'd_street1',
				'rules' => 'required'
			),
//			array(
//				'field' => 'd_street2',
//				'label' => 'Devlivery town',
//				'rules' => 'required'
//			),
			array(
				'field' => 'd_town',
				'label' => 'Devlivery zipcode',
				'rules' => 'required'
			),
//			array(
//				'field' => 'd_zipcode',
//				'label' => 'Devlivery zipcode',
//				'rules' => 'required'
//			),

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
	 * List orders with pagination
	 */
	public function index($page = 1)
	{
            $limit = 20;
            $offset = $page < 2 ? 0 : ($page-1) * $limit;
            $pag_segment = 4;
            $pag_uri = "admin/orders/page";
            $orderby = 'id';
            $sortdir = 'DESC';
            $svars = false;
            
            //searching
            if(!empty($this->input->get('searchBtn')))
            {	
                $svars = $this->input->get();
                $this->orders_m->_set_search($svars);
            }
            

            //sorting
            if(!empty($this->input->get('sort'))) $orderby = $this->input->get('sort'); 
            if(!empty($this->input->get('sortdir'))) $sortdir = strtoupper($this->input->get('sortdir'));
            $this->db->order_by($orderby, $sortdir); //default
            
            $this->db->limit($limit, $offset);
            $orders = $this->db->get('default_orders_list')
                            ->result();
            
            //count results
            $rescount = $this->orders_m->orders_count_all($svars) ;
            // pagination
            $pagination = create_pagination($pag_uri, $rescount, $limit, $pag_segment);
            
		// Build the view with orders/views/admin/orders.php
		$this->template
			->title($this->module_details['name'])
			->set('orders', $orders)
                        ->set('pagination', $pagination)
                        ->set('total_rows', $rescount)
			->build('admin/orders');
	}

	public function create()
	{
		// Set the validation rules from the array above
		$this->form_validation->set_rules($this->item_validation_rules);

		// check if the form validation passed
		if ($this->form_validation->run())
		{
			// See if the model can create the record
			if ($this->orders_m->save_order($this->input->post()))
			{
				// All good...
				$this->session->set_flashdata('success', lang('orders.success'));
				redirect('admin/orders');
			}
			// Something went wrong. Show them an error
			else
			{
				$this->session->set_flashdata('error', lang('orders.error'));
				redirect('admin/orders/create');
			}
		}
		
		$order = new stdClass;
		foreach ($this->item_validation_rules as $rule)
		{
			$order->{$rule['field']} = $this->input->post($rule['field']);
		}

		// Build the view using orders/views/admin/form.php
		$this->template
			->title($this->module_details['name'], lang('orders.new_item'))
			->set('order', $order)
			->build('admin/form');
	}
	
	public function edit($id = 0)
	{
		$order = $this->orders_m->get($id);

		$this->form_validation->set_rules($this->item_validation_rules);

		if ($this->form_validation->run())
		{
			$post = $this->orders_m->prepare_post($this->input->post());
			if ($this->orders_m->update($id, $post))
			{
				$this->session->set_flashdata('success', lang('orders.success'));
				redirect("admin/orders/edit/$id");
			}
			else
			{
				$this->session->set_flashdata('error', lang('orders.error'));
				redirect('admin/orders/create');
			}
		}

                // get cart list
                $cart = $this->orders_m->get_cartdetails($id);
                
                //set values of cart total
                $totals['total_price'] = $order->total_pretax ;
                $totals['total_taxed'] = $order->total_final;
                foreach ($cart as $p => $p_details) {
                        $cart[$p]['order_qty'] = $cart[$p]['product_qty'];
                        $cart[$p]['input_html'] = $cart[$p]['order_qty'];
                        $cart[$p]['line_total'] = $cart[$p]['final_price'];
                        $cart[$p]['price'] = $cart[$p]['line_total'] / $cart[$p]['order_qty'];
                        $cart[$p]['img_url'] = site_url().UPLOAD_PATH.'products/'.$cart[$p]['image_filename'];
                        $cart[$p]['img_html'] = '<img src="'.$cart[$p]['img_url'].'" height="60"/>';
                        $cart[$p]['description'] = '';
                        $cart[$p]['line'] = $p+1;
                }
                
		$this->template
			->title($this->module_details['name'], lang('orders.edit'))
			->set('disabled', false)
			->set('order', $order)
			->set('cartlist', $cart)
			->set('totals', $totals)
			->build('admin/form');
	}
	
	public function view($id = 0)
	{
                // get order details 
		$order = $this->orders_m->get($id);
                
                // get cart list
                $cart = $this->orders_m->get_cartdetails($id);
                
                //set values of cart total
                $totals['total_price'] = $order->total_pretax ;
                $totals['total_taxed'] = $order->total_final;
                foreach ($cart as $p => $p_details) {
                        $cart[$p]['order_qty'] = $cart[$p]['product_qty'];
                        $cart[$p]['input_html'] = $cart[$p]['order_qty'];
                        $cart[$p]['line_total'] = $cart[$p]['final_price'];
                        $cart[$p]['price'] = $cart[$p]['line_total'] / $cart[$p]['order_qty'];
                        $cart[$p]['img_url'] = site_url().UPLOAD_PATH.'products/'.$cart[$p]['image_filename'];
                        $cart[$p]['img_html'] = '<img src="'.$cart[$p]['img_url'].'" height="60"/>';
                        $cart[$p]['description'] = '';
                        $cart[$p]['line'] = $p+1;
                }
                
                // build page
		$this->template
			->title($this->module_details['name'], lang('orders.edit'))
			->set('disabled', true)
			->set('order', $order)
			->set('cartlist', $cart)
			->set('totals', $totals)
			->build('admin/form');
	}
	
	public function print_order($id = 0)
	{
                // site variables
                $this->load->library('variables/variables');
                $vars = $this->variables_m->get_all();
                foreach ($vars as $value) {
                    $variables[$value->name] = $value->data ;
                }
                
                // get order details and cart list
                $order = $this->orders_m->get($id);
                $cart = $this->orders_m->get_cartdetails($id);
                
                //set values of cart total
                $totals['total_price'] = $order->total_pretax ;
                $totals['total_taxed'] = $order->total_final;
                foreach ($cart as $p => $p_details) {
                        $cart[$p]['order_qty'] = $cart[$p]['product_qty'];
                        $cart[$p]['input_html'] = $cart[$p]['order_qty'];
                        $cart[$p]['line_total'] = $cart[$p]['final_price'];
                        $cart[$p]['price'] = $cart[$p]['line_total'] / $cart[$p]['order_qty'];
                        $cart[$p]['img_url'] = site_url().UPLOAD_PATH.'products/'.$cart[$p]['image_filename'];
                        $cart[$p]['img_html'] = '<img src="'.$cart[$p]['img_url'].'" height="60"/>';
                        $cart[$p]['description'] = '';
                        $cart[$p]['line'] = $p+1;
                }
                
                // no theme
                $this->template->set_layout(false);
                
                // build page
		$this->template
			->title($this->module_details['name'], lang('orders.edit'))
			->set('disabled', true)
			->set('order', $order)
                        ->set('variables', $variables)
			->set('cartlist', $cart)
			->set('totals', $totals)
			->build('admin/print');
	}
	
	public function delete($id = 0)
	{
            $msg='';
            //confirmation of deletion
            if(!isset($_POST['confirm']))
            {
                    // build page
                    $this->template
                            ->title($this->module_details['name'], lang('orders.confirm'))
                            ->set('msg', $msg)
                            ->build('admin/partials/delete');
            } else {
                    // make sure the button was clicked and that there is an array of ids
                    if (isset($_POST['btnAction']) AND is_array($_POST['action_to']))
                    {
                            // pass the ids and let MY_Model delete the items
                            $this->orders_m->delete_many($this->input->post('action_to'));
                            // do order details as well
                            $this->db->where_in('order_id', $this->input->post('action_to'))
                            ->delete('orders_details');
                    }
                    elseif (is_numeric($id))
                    {
                            // they just clicked the link so we'll delete that one
                            $this->orders_m->delete($id);
                    }
                    redirect('admin/orders');
            }  
		
	}
	
	public function modify($id = 0)
	{            
            $msg= lang( 'orders:status_'.$this->input->post('order_status'));
            //confirmation of modification
            if(!isset($_POST['confirm']))
            {
                    // build page
                    $this->template
                            ->title($this->module_details['name'], lang('orders.confirm'))
                            ->set('msg', $msg)
                            ->build('admin/partials/modify');
            } else {

		// make sure the button was clicked and that there is an array of ids
		if ( is_array($_POST['action_to']))
		{
                    $order_status = $this->input->post('order_status');
                    foreach ($this->input->post('action_to') as $id) {
                        $ids[] = array(
                            'id' => $id ,
                            'order_status' => $order_status
                            );
                    }
                    
                    $this->db->update_batch('default_orders_list', $ids, 'id'); 
		}
		elseif (is_numeric($id))
		{
			// they just clicked the link  
		}
		redirect('admin/orders');
            }
                
	}
}
