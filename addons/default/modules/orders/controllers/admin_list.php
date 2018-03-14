<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a orders list module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Orders Module
 */
class Admin_List extends Admin_Controller
{
	/** @var int The current active section */
	protected $section = 'list';
	protected $sql = '
                            default_orders_list.id,
                            default_orders_list.order_status,
                            default_orders_list.delivery_date,
                            default_orders_list.i_fullname,
                            default_orders_list.d_fullname,
                            default_orders_list.slug as slug,
                            default_orders_details.order_id,
                            default_orders_details.product_id,
                            default_orders_details.product_qty,
                            default_orders_details.name as p_name,
                            default_orders_details.line_price as line_price,
                            default_orders_details.tax as tax,
                            default_orders_details.final_price as final_price,
                            default_orders_details.name as name,
                            default_orders_details.image_filename as image_filename,
                            default_orders_details.unit as unit,
                            default_orders_details.origin as origin';
        
	public function __construct()
	{
		parent::__construct();

		// Load all the required classes
		$this->load->model('orders_m');
		$this->load->model('html_m');
		$this->load->library('form_validation');
		$this->lang->load('orders');

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
	 * List all order details of orders, filter by status
	 */
	public function index($page = 1)
	{                   
                $limit = 20;
                $offset = $page < 2 ? 0 : ($page-1) * $limit;
                $pag_segment = 5;
                $pag_uri = "admin/orders/list/page";
                $orderby = 'id';
                $sortdir = 'DESC';
                $svars = false;
            
                $this->db->select($this->sql);            
            
                $this->db->join('orders_list', 'orders_details.order_id = orders_list.id ');
                
                //searching
                if(!empty($this->input->get('searchBtn')))
                {	
                    $svars = $this->input->get();
                    $this->orders_m->_set_details_search($svars);
                }

                //sorting
                if(!empty($this->input->get('sort'))) $orderby = $this->input->get('sort'); 
                if(!empty($this->input->get('sortdir'))) $sortdir = strtoupper($this->input->get('sortdir'));
                $this->db->order_by($orderby, $sortdir); //default

                $this->db->limit($limit, $offset);

                $orders= $this->db->get('orders_details')->result();

                //count results
                //$this->db->select($this->sql);
                $rescount = $this->orders_m->details_count_all($svars) ;
                // pagination
                $pagination = create_pagination($pag_uri, $rescount, $limit, $pag_segment);

                $this->template
			->title($this->module_details['name'])
			->set('orders', $orders)
                        ->set('pagination', $pagination)
                        ->set('total_rows', $rescount)
			->build('admin/list/index');
	}
        
        public function order($oid) 
        {
                $this->db->where("order_id", $oid);
               
                $this->db->order_by('name', 'asc');
            
                $order_details= $this->db->get('orders_details')->result();

                // AJAX and XHR
                if($this->input->is_ajax_request()) $this->template->set_layout(false);
                
                $this->template
			->set('order_details', $order_details)
			->build('admin/list/order');
        }

}
