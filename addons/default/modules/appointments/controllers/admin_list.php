<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a appointments list module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Appointments Module
 */
class Admin_List extends Admin_Controller
{
	/** @var int The current active section */
	protected $section = 'list';
	protected $sql = '
                            default_appointments_list.id, 
                            default_appointments_details.appointment_id,
                            default_appointments_details.product_id';
        
	public function __construct()
	{
		parent::__construct();

		// Load all the required classes
		$this->load->model('appointments_m');
		$this->load->model('html_m');
		$this->load->library('form_validation');
		$this->lang->load('appointments');

		// Set the validation rules
		$this->item_validation_rules = array();

		// We'll set the partials and metadata here since they're used everywhere
		$this->template->append_js('module::admin.js')
						->append_css('module::admin.css');
	}
        
        /** multi page view
         *
         * @param int $offset
         */
        public function page($page = 1 )
        {
            $this->index($page);
        }
        
	/**
	 * List all appointment details of appointments, filter by status
	 */
	public function index($page = 1)
	{                   
                $limit = 20;
                $offset = $page < 2 ? 0 : ($page-1) * $limit;
                $pag_segment = 5;
                $pag_uri = "admin/appointments/list/page";
                $appointmentby = 'id';
                $sortdir = 'DESC';
                $svars = false;
            
                $this->db->select($this->sql);            
            
                $this->db->join('appointments_list', 'appointments_details.appointment_id = appointments_list.id ');
                
                //searching
                if(!empty($this->input->get('searchBtn')))
                {	
                    $svars = $this->input->get();
                    $this->appointments_m->_set_details_search($svars);
                }

                //sorting
                if(!empty($this->input->get('sort'))) $appointmentby = $this->input->get('sort'); 
                if(!empty($this->input->get('sortdir'))) $sortdir = strtoupper($this->input->get('sortdir'));
                $this->db->order_by($appointmentby, $sortdir); //default

                $this->db->limit($limit, $offset);

                $appointments= $this->db->get('appointments_details')->result();

                //count results
                //$this->db->select($this->sql);
                $rescount = $this->appointments_m->details_count_all($svars) ;
                // pagination
                $pagination = create_pagination($pag_uri, $rescount, $limit, $pag_segment);

                $this->template
			->title($this->module_details['name'])
			->set('appointments', $appointments)
                        ->set('pagination', $pagination)
                        ->set('total_rows', $rescount)
			->build('admin/list/index');
	}
        
        public function appointment($oid) 
        {
                $this->db->where("appointment_id", $oid);
               
                $this->db->order_by('name', 'asc');
            
                $appointment_details= $this->db->get('appointments_details')->result();

                // AJAX and XHR
                if($this->input->is_ajax_request()) $this->template->set_layout(false);
                
                $this->template
			->set('appointment_details', $appointment_details)
			->build('admin/list/appointment');
        }

}
