<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a appointments module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Appointments Module
 */
class Admin extends Admin_Controller
{
	protected $section = 'items';

	public function __construct()
	{
		parent::__construct();

		// Load all the required classes
		$this->load->model('appointments_m');
		$this->load->model('html_m');
		$this->load->library('form_validation');
		$this->lang->load('appointments');

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
				'rules' => 'unique'
			),
			array(
				'field' => 'appointment_status',
				'label' => 'Appointment status',
				'rules' => 'trim'
			),
			array(
				'field' => 'payment_status',
				'label' => 'Payment status',
				'rules' => 'trim'
			),
//			array(
//				'field' => 'appointment_status',
//				'label' => 'Order status',
//				'rules' => 'trim|max_length[100]|required'
//			),
			array(
				'field' => 'payment_type',
				'label' => 'Payment type',
//				'rules' => 'trim'
			),
			array(
				'field' => 'total_pretax',
				'label' => 'Total pretax',
//				'rules' => 'required'
			),			
			array(
				'field' => 'total_final',
				'label' => 'Total final',
//				'rules' => 'required'
			),
			array(
				'field' => 'appointment_date',
				'label' => 'Appointment date',
//				'rules' => 'required'
			),
			array(
				'field' => 'delivery_date',
				'label' => 'Delivery date',
//				'rules' => 'required'
			),
			array(
				'field' => 'd_fullname',
				'label' => 'd_fullname',
//				'rules' => 'required'
			),
			array(
				'field' => 'd_phone',
				'label' => 'd_phone',
//				'rules' => 'required'
			),
			array(
				'field' => 'd_street1',
				'label' => 'd_street1',
//				'rules' => 'required'
			),
//			array(
//				'field' => 'd_street2',
//				'label' => 'Devlivery town',
//				'rules' => 'required'
//			),
			array(
				'field' => 'd_town',
				'label' => 'Delivery town',
//				'rules' => 'required'
			),
//			array(
//				'field' => 'd_zipcode',
//				'label' => 'Devlivery zipcode',
//				'rules' => 'required'
//			),
			array(
				'field' => 'message',
				'label' => 'Message',
				'rules' => 'trim'
			),

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
	 * List appointments with pagination
	 */
	public function index($page = 1)
	{
            $limit = 20;
            $offset = $page < 2 ? 0 : ($page-1) * $limit;
            $pag_segment = 4;
            $pag_uri = "admin/appointments/page";
            $orderby = 'id';
            $sortdir = 'DESC';
            $svars = false;
            
            //searching
            if(!empty($this->input->get('searchBtn')))
            {	
                $svars = $this->input->get();
                $this->appointments_m->_set_search($svars);
            }
            

            //sorting
            if(!empty($this->input->get('sort'))) $orderby = $this->input->get('sort'); 
            if(!empty($this->input->get('sortdir'))) $sortdir = strtoupper($this->input->get('sortdir'));
            $this->db->order_by($orderby, $sortdir); //default
            
            $this->db->limit($limit, $offset);
            $appointments = $this->db->get('default_appointments_list')
                            ->result();
            
            //count results
            $rescount = $this->appointments_m->appointments_count_all($svars) ;
            // pagination
            $pagination = create_pagination($pag_uri, $rescount, $limit, $pag_segment);
            
		// Build the view with appointments/views/admin/appointments.php
		$this->template
			->title($this->module_details['name'])
			->set('appointments', $appointments)
                        ->set('pagination', $pagination)
                        ->set('total_rows', $rescount)
			->build('admin/appointments');
	}

	public function create()
	{
		// Set the validation rules from the array above
		$this->form_validation->set_rules($this->item_validation_rules);

		// check if the form validation passed
		if ($this->form_validation->run())
		{
			// See if the model can create the record
			if ($this->appointments_m->save_appointment($this->input->post()))
			{
				// All good...
				$this->session->set_flashdata('success', lang('appointments.success'));
				redirect('admin/appointments');
			}
			// Something went wrong. Show them an error
			else
			{
				$this->session->set_flashdata('error', lang('appointments.error'));
				redirect('admin/appointments/create');
			}
		}
		
//		$appointment = $this->appointments_m->newappointment();
		$appointment = new stdClass;
		foreach ($this->item_validation_rules as $rule)
		{
			$appointment->{$rule['field']} = $this->input->post($rule['field']);
		}

		// Build the view using appointments/views/admin/form.php
		$this->template
			->title($this->module_details['name'], lang('appointments.new_item'))
			->set('appointment', $appointment)
			->build('admin/form');
	}
	
	public function edit($id = 0)
	{
		$appointment = $this->appointments_m->get($id);

		$this->form_validation->set_rules($this->item_validation_rules);

		if ($this->form_validation->run())
		{
			$post = $this->appointments_m->prepare_post($this->input->post());
			if ($this->appointments_m->update($id, $post))
			{
				$this->session->set_flashdata('success', lang('appointments.success'));
				redirect("admin/appointments/edit/$id");
			}
			else
			{
				$this->session->set_flashdata('error', lang('appointments.error'));
				redirect('admin/appointments/create');
			}
		}

                // get cart list
                $cart = $this->appointments_m->get_cartdetails($id);
                
                //set values of cart total
                $totals['total_price'] = $appointment->total_pretax ;
                $totals['total_taxed'] = $appointment->total_final;
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
			->title($this->module_details['name'], lang('appointments.edit'))
			->set('disabled', false)
			->set('appointment', $appointment)
			->set('cartlist', $cart)
			->set('totals', $totals)
			->build('admin/form');
	}
	
	public function view($id = 0)
	{
                // get appointment details 
		$appointment = $this->appointments_m->get($id);
                
                // get cart list
                $cart = $this->appointments_m->get_cartdetails($id);
                
                //set values of cart total
                $totals['total_price'] = $appointment->total_pretax ;
                $totals['total_taxed'] = $appointment->total_final;
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
			->title($this->module_details['name'], lang('appointments.edit'))
			->set('disabled', true)
			->set('appointment', $appointment)
			->set('cartlist', $cart)
			->set('totals', $totals)
			->build('admin/form');
	}
	
	public function print_appointment($id = 0)
	{
                // site variables
                $this->load->library('variables/variables');
                $vars = $this->variables_m->get_all();
                foreach ($vars as $value) {
                    $variables[$value->name] = $value->data ;
                }
                
                // get appointment details and cart list
                $appointment = $this->appointments_m->get($id);
                $cart = $this->appointments_m->get_cartdetails($id);
                
                //set values of cart total
                $totals['total_price'] = $appointment->total_pretax ;
                $totals['total_taxed'] = $appointment->total_final;
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
			->title($this->module_details['name'], lang('appointments.edit'))
			->set('disabled', true)
			->set('appointment', $appointment)
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
                            ->title($this->module_details['name'], lang('appointments.confirm'))
                            ->set('msg', $msg)
                            ->build('admin/partials/delete');
            } else {
                    // make sure the button was clicked and that there is an array of ids
                    if (isset($_POST['btnAction']) AND is_array($_POST['action_to']))
                    {
                            // pass the ids and let MY_Model delete the items
                            $this->appointments_m->delete_many($this->input->post('action_to'));
                            // do appointment details as well
                            $this->db->where_in('appointment_id', $this->input->post('action_to'))
                            ->delete('appointments_details');
                    }
                    elseif (is_numeric($id))
                    {
                            // they just clicked the link so we'll delete that one
                            $this->appointments_m->delete($id);
                    }
                    redirect('admin/appointments');
            }  
		
	}
	
	public function modify($id = 0)
	{            
            $msg= lang( 'appointments:status_'.$this->input->post('appointment_status'));
            //confirmation of modification
            if(!isset($_POST['confirm']))
            {
                    // build page
                    $this->template
                            ->title($this->module_details['name'], lang('appointments.confirm'))
                            ->set('msg', $msg)
                            ->build('admin/partials/modify');
            } else {

		// make sure the button was clicked and that there is an array of ids
		if ( is_array($_POST['action_to']))
		{
                    $appointment_status = $this->input->post('appointment_status');
                    foreach ($this->input->post('action_to') as $id) {
                        $ids[] = array(
                            'id' => $id ,
                            'appointment_status' => $appointment_status
                            );
                    }
                    
                    $this->db->update_batch('default_appointments_list', $ids, 'id'); 
		}
		elseif (is_numeric($id))
		{
			// they just clicked the link  
		}
		redirect('admin/appointments');
            }
                
	}
}
