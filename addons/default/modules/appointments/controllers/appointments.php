<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a appointments module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Appointments Module
 */
class Appointments extends Public_Controller
{
	public function __construct()
	{
		parent::__construct();

		// Load the required classes
		$this->load->model('users/profile_m');
		$this->load->model('appointments_m');
		$this->load->model('html_m');
		$this->lang->load('appointments');

		$this->template
			->append_css('module::appointment.css');
                
                $this->load->library('form_validation');
               
		// Set the validation rules
		$this->item_validation_rules = array(
			array(
				'field' => 'appointment_date',
				'label' => lang('appointments:appointment_date'),
				'rules' => 'required'
			),
			array(
				'field' => 'payment_type',
				'label' => lang('appointments:payment_type'),
				'rules' => ''
			),
//			array(
//				'field' => 'd_fullname',
//				'label' => lang('appointments:d_fullname'),
//				'rules' => 'required'
//			),
//			array(
//				'field' => 'd_street1',
//				'label' => lang('appointments:d_street1'),
//				'rules' => 'required'
//			),
//			array(
//				'field' => 'd_town',
//				'label' => lang('appointments:d_town'),
//				'rules' => 'required'
//			),
//			array(
//				'field' => 'd_zipcode',
//				'label' => lang('appointments:d_zipcode'),
//				'rules' => 'required|max_length[10]'
//			),
			array(
				'field' => 'maiden_name',
				'label' => lang('appointments:maiden_name'),
				'rules' => 'required'
			),
			array(
				'field' => 'address',
				'label' => lang('appointments:address'),
				'rules' => 'required'
			),
			array(
				'field' => 'town',
				'label' => lang('appointments:town'),
				'rules' => 'required'
			),
			array(
				'field' => 'area_name',
				'label' => lang('appointments:area_name'),
				'rules' => 'required|max_length[10]'
			),
		);
	}

	/**
	 * appointment form and selected products
	 */
	public function index($offset = 0)
	{   
            $this->template
                    ->append_js('module::appointment.js')
                    ->append_js('module::jscart.js')
//                    ->append_js('module::relays.js')
//                    ->append_js('module::paypal.js')
//                    ->append_js('module::livraison.js')
                    ->append_js('module::datepicker.js');   
           
            $this->load->model('token/token_m');
            
            if(!$this->current_user)
            {
                    $this->session->set_flashdata('success', lang('appointments:only_user_send'));
                    $this->session->set_userdata('redirect_to','appointments');
                    redirect('users/login');
            }
            
            $details = null;
            $msg ='';
            $remove = $this->input->get('remove');
            $this->load->model('users/profile_m');
            
            $appointment = $this->appointments_m->newappointment();
            $profile_data = $this->profile_m->get_profile();
            $cart = $this->appointments_m->get_cart($remove);
            
            // token check
            $token = $this->token_m->current_token();
            
            if(!$cart) 
            {
                unset($cart);
                 $cart['total_price'] = 0;
                 $cart['total_taxed'] = 0;
                 $cart['products'] = array();
            }
                      
            //set values of cart total
            $totals[0]['total_price'] = $cart['total_price'] ;
            $totals[0]['total_taxed'] = $cart['total_taxed'] ;
            $appointment->total_pretax = $cart['total_price'];
            $appointment->total_final = $cart['total_taxed']; 

            // saving the appointment
            $this->form_validation->set_rules($this->item_validation_rules);
                if(isset($_POST['appointmentSend']) AND $appointment->total_final > 0)  // appointment sent
                {   
                        if($appointment->total_final < $this->settings->min_appointment_amount) 
                        {
                                $this->session->set_flashdata('error', lang('appointments:min_amount_not_met'));
                                redirect('appointments');
                        }

                        if(isset($_POST['_token'])) // for retro compatibility 
                        {
                                if($this->token_m->check_token($this->input->post('_token'), true ) === false) {
                                    // stop
                                    $this->session->set_flashdata('error', lang('appointments:token_error'));
                                    redirect('appointments');
                                }
                                                           
                                // if it got this far we can remove token
                                $this->token_m->kill_token($token); 
                                $this->token_m->delete_cookie_token($token); 
                        } 
                        
                        if ($this->form_validation->run())
                        {
                                $noid = $this->appointments_m->save_appointment($appointment, $cart);
                                if ($noid)
                                {
                                        $this->session->set_flashdata('success', lang('appointments:saved_waiting'));
                                        $this->_send_email('appointments-admin',$noid, $appointment, $this->current_user, $cart['products']);
                                        $this->_send_email('appointments-patient', $noid, $appointment, $this->current_user, $cart['products'], $this->current_user->email);
                                        redirect("appointments/listing");
                                } else {
                                    $this->session->set_flashdata('error', lang('appointments:error'));
                                }
                        } 
                        else
                        {
                                $msg = validation_errors() ;
                        }
                }

            
		$this->template
			->title($this->module_details['name'], lang('appointments:create'))
			->set('token', $token)
			->set('editable', true)
			->set('profile', $profile_data)
			->set('message', $msg)
			->set('appointment', $appointment)
			->set('cartlist', $cart['products'])
			->set('carttotal', $totals)
			->set('details', $details)
			->build('appointment');
	}

	/**
	 * view appointment form and selected products, partialy modifiable
	 */
        public function view($oid) 
        {   
            $this->template
                    //->append_js('module::jscart.js')
                    ->append_js('module::appointment.js')
                    ->append_js('module::datepicker.js')
//                    ->append_js('module::relays.js')
//                    ->append_js('module::paypal.js')
                    ->append_js('module::livraison.js');
            
            $msg='';
            $editable=false;
            $user = $this->current_user;
            if(!$user)
            {
                $this->session->set_flashdata('success', lang('appointments:only_for_user'));
                redirect('users/login');
            }
            
            /* get appointment */
            $appointment = $this->appointments_m->get($oid);
            if(!isset($appointment)) 
            {
                $this->session->set_flashdata('error', lang('appointments:error').' no oid');
                redirect('appointments/listing');
            }
            
            /* check if same user */
            if($appointment->user_id != $user->id)
            {
                $this->session->set_flashdata('error', lang('appointments:error').' not same user');
                redirect('appointments/listing');
            }
            
            $profile_data = $this->profile_m->get_profile();
//            $cart = $this->appointments_m->get_cartdetails($oid);
            
//            foreach ($cart as $p => $p_details) {
//               $cart[$p]['appointment_qty'] = $cart[$p]['product_qty'];
//               $cart[$p]['input_html'] = $cart[$p]['appointment_qty'];
//               $cart[$p]['line_total'] = $cart[$p]['final_price'];
//               $cart[$p]['price'] = $cart[$p]['line_total'] / $cart[$p]['appointment_qty'];
//               $cart[$p]['img_url'] = site_url().UPLOAD_PATH.'products/'.$cart[$p]['image_filename'];
//               $cart[$p]['img_html'] = '<img src="'.$cart[$p]['img_url'].'" height="60"/>';
//               $cart[$p]['description'] = '';
//               $cart[$p]['line'] = $p+1;
//            }
            
            //set values of cart total
            $totals[0]['total_price'] = $appointment->total_pretax ;
            $totals[0]['total_taxed'] = $appointment->total_final;
            
            //update allowed fields if no status
            if(isset($_POST['appointmentSend']) AND empty($appointment->appointment_status)) 
            {
                 $this->form_validation->set_rules($this->item_validation_rules);
                    if ($this->form_validation->run())
                    {
                        $update['appointment_date'] = $this->input->post('appointment_date');
                        $update['message'] = $this->input->post('message');
                        //$update['log'] = $this->input->post('log');
                        $update['payment_type'] = !empty($this->input->post('payment_type')) ? $this->input->post('payment_type') : '';
                        $update['log'] = !empty($this->input->post('log')) ? $this->input->post('log')."\n".$appointment->log : $appointment->log ;
                            $update['maiden_name'] = $this->input->post('maiden_name');
                            $update['mobile'] = $this->input->post('mobile');
                            $update['phone'] = $this->input->post('phone');
                            $update['email'] = $this->input->post('email');
                            $update['address'] = $this->input->post('address') ;
                            //$update['i_street2'] = $this->input->post('i_street2');
                            $update['town'] = $this->input->post('town') ;
                            $update['area_name'] = $this->input->post('area_name') ;
                                $update['d_fullname'] = $this->input->post('d_fullname');
                                $update['d_mobile'] = $this->input->post('d_mobile');
                                $update['d_phone'] = $this->input->post('d_phone');
                                $update['d_mail'] = $this->input->post('d_mail');
                                $update['d_street1'] = $this->input->post('d_street1') ;
                                //$update['d_street2'] = $this->input->post('d_street2');
                                $update['d_town'] = $this->input->post('d_town') ;
                                $update['d_zipcode'] = $this->input->post('d_zipcode') ;
                                    
                        $update['updated_on'] = date( "Y-m-d H:i:s" );
                        if($this->appointments_m->update($oid, $update))
                        {
                            $this->session->set_flashdata('success', lang('appointments:modified'));                                        
                            $this->_send_email('appointments-modified-admin',$oid, $update, $this->current_user, $cart);
                            redirect("appointments/view/$oid");
                        }
                    }
                    else
                    {
                            $msg = validation_errors() ;
                    }        
                    
            }
            

                
//            $cartlist['products'] = $cart;
            if(empty($appointment->appointment_status)) $editable =true;
            
            $this->template
			->title($this->module_details['name'], lang('appointments:view'))
			->set('token', '')
			->set('editable', $editable)
			->set('message', $msg)
			->set('profile', $profile_data)
                        ->set('appointment', $appointment)
			->set('carttotal', $totals)
//			->set('cartlist', $cart)
			->build('appointment');
        }
        
        /** confirm and delete an appointment
         * 
         * @param integer $oid
         */
        public function delete($oid) 
        {
            if(!$this->current_user)
            {
                redirect('users/login');
            }
            if(isset($_POST['appointmentDelete'])) 
            {
                $appointment = $this->appointments_m->get($oid);
                if(empty($appointment->appointment_status) AND $appointment->user_id == $this->current_user->id) 
                {
                    $this->appointments_m->soft_delete($oid); // keep in DB
//                    $this->appointments_m->delete($oid);
                    $this->session->set_flashdata('success', lang('appointments:success'));
                    $this->_send_email('appointments-deleted-admin',$oid, $appointment, $this->current_user);
                    redirect('appointments/listing');
                } else {
                    $this->session->set_flashdata('error', lang('appointments:no_delete_if_status'));
                    redirect('appointments/listing');
                }
            }            
            
            $this->template
			->title($this->module_details['name'], ' delete appointment')
			->build('delete');
        }
        
        /**
         * erase cookie
         */
        public function cancel_appointment() 
        {       
                $this->session->set_flashdata('success', lang('appointments:cart_cancelled'));
                $appointment = $this->appointments_m->delete_cookie_cart();
                redirect();
        }
        
        /**
         * list appointments for user 
         * @param int $offset
         */
        public function listing($offset = 0)
	{
//            if($offset < 0) $offset = 0; //@todo  a proper job of  negative offset 
            $this->template->append_js('module::search_datepicker.js');
            
            if(!$this->current_user)
            {
                $this->session->set_flashdata('success', lang('appointments:only_for_user'));
                redirect('users/login');
            }
		// set the pagination limit
		$limit = 20;
		$where = '';
		$sort = !empty($this->input->get('sort')) ? $this->input->get('sort') : 'id';
		$sortdir = !empty($this->input->get('sortdir')) ? $this->input->get('sortdir') : 'desc';
                $offset = $offset < 2 ? 0 : ($offset-1) * $limit; 
		
                // search query
                $svars = $this->input->post();
                if(!empty($this->input->post('searchBtn')))
                {

//                    $svars = $this->input->post();
                    $this->appointments_m->_set_search($svars);
//                    
//                    $appointment_date = $this->input->post('appointment_date');
//                    $first_name = $this->input->post('first_name');
//                    $last_name = $this->input->post('last_name');
//                    $other_person = $this->input->post('other_person'); 
//
//                    if(!empty($appointment_date)) $this->db->like('appointment_date', $appointment_date, 'after');
//                    if(!empty($first_name)) $this->db->like('first_name', $first_name);
//                    if(!empty($last_name)) $this->db->like('last_name', $last_name);
//                    if(!empty($other_person)) $this->db->like('other_person', $other_person);
////                    if(!empty($slug)) $this->db->where('slug', $slug);
                }
            
                //get dataset
		$items = $this->appointments_m->limit($limit)
			->offset($offset)
                        ->where($where."user_id = ".$this->current_user->id)
                        ->order_by($sort, $sortdir)
			->get_all();
			
                //format date strings
                $ic = 0;
                foreach ( $items as $appt ) 
                { 
                    $items[$ic]->short_dayname = $items[$ic]->appointment_date;
                    $appt->short_dayname = $this->appointments_m->str_to_day($appt->appointment_date);
                    $ic++;
//                     echo $this->appointments_m->format_appt_date($appointment->appointment_date); 
                }
                
		// we'll do a quick check here so we can tell tags whether there is data or not
		$items_exist = count($items) > 0;

                // proper count for users
//                    $this->appointments_m->_set_search($svars); 
//                $query = $this->db->query('SELECT count(*) as count FROM default_appointments_list where ' . "user_id = ".$this->current_user->id);
//                $row = $query->row();
//                $count =  $row->count;
                
                $count=  $this->appointments_m->_search_result_count($svars)[0]->count;
		// we're using the pagination helper to do the pagination for us. Params are: (module/method, total count, limit, uri segment)
		$pagination = create_pagination('appointments/listing', $count, $limit, 3);

		$this->template
			->title($this->module_details['name'], lang('appointments:listing'))
			->set('appointments', $items)
			->set('count', $count)
			->set('items_exist', $items_exist)
			->set('pagination', $pagination)
			->build('myappointments');
	}
        
        /**
         * PayPal integration AJAX
         * @param string $action 
         * @return boolean
         */
        public function paypal($action=false)
        {
            if(!$action) return;
            require_once('assets/braintree/lib/Braintree.php');
            $accessToken = Settings::get('paypal_access_token') ;
            $commercialName = Settings::get('paypal_commercial_name') ;
            $oid = $this->input->get('oid');
            
            if(empty($oid) OR empty($accessToken) OR empty($commercialName)) return;
            $appointment = $this->appointments_m->get($oid);
            
            $user = $this->current_user;
            if($appointment->user_id != $user->id) return false;
            
            switch (strtolower($action))
            {
                case 'gettoken':
                        $gateway = new Braintree_Gateway(array(
                            'accessToken' => $accessToken,
                           ));
                       $token = $gateway->clientToken()->generate();
                       $output = "paypal_token = \"$token\";"; // JS
            break;
                case 'sendnonce':
                        $nonce = $this->input->get('nonce');  
                        $amount = $this->input->get('amount');  
                        $slug = $this->input->get('slug');  
                        if($nonce == null OR $amount == null OR $slug == null) return;
                        $gateway = new Braintree_Gateway(array(
                            'accessToken' => $accessToken,
                        ));

                            $result = $gateway->transaction()->sale([
                                "amount" => $amount,
                                'merchantAccountId' => 'EUR',
                                "paymentMethodNonce" => $nonce,
                                "appointmentId" => "$oid-$slug",
//                                "descriptor" => [
//                                  "name" => $commercialName //"Descriptor displayed in customer CC statements. 22 char max" 
//                                ],
//                                "shipping" => [
//                                  "firstName" => "Jen",
//                                  "lastName" => "Smith",
//                                  "company" => "Braintree",
//                                  "streetAddress" => "1 E 1st St",
//                                  "extendedAddress" => "Suite 403",
//                                  "locality" => "Bartlett",
//                                  "region" => "IL",
//                                  "postalCode" => "60103",
//                                  "countryCodeAlpha2" => "US"
//                                ],
                                "options" => [
                                  "paypal" => [
                                    "customField" => "Panier Gourmand91",
                                    "description" => "Identifiant de commande ".$slug."\nMontant :".$appointment->total_final
                                  ],
                                ]
                            ]);
                            if ($result->success) {
                              $output = ("Success ID: " . $result->transaction->id);
                              $update['payment_status'] = 'paid';
                              
                                //$this->_send_email('appointments-paid', $oid, $appointment, $this->current_user, '', $this->current_user->email);
                              $update['appointment_status'] = 'waiting_treatment';
                            } else {
                              $output = ("Error Message: " . $result->message);
                              $update['payment_status'] = 'error';
                              $update['appointment_status'] = 'waiting_treatment';
                            }
                            
                       $update['log'] = $output . "\n" . $appointment->log; 
                        if(!$this->appointments_m->update($oid, $update))
                        {
                            $output = "Log data update error\n".$output;
                        } 
                        
                    break;
            }
            
            // AJAX and XHR
            $this->template->set_layout(false)->set('output', $output)->build('ajax');
        }
       
        /**
         * add something to log field of an appointment
         * @param type $oid appointment ID
         * @return string on error
         */
        public function log($oid) 
        {
            $appointment = $this->appointments_m->get($oid);
            $user = $this->current_user;
            
            if($appointment->user_id != $user->id) return;
            $msg = $this->input->get('m');
            if(empty($msg)) return;
            $update['log'] = $msg . "\n" . $appointment->log ;
                if(!$this->appointments_m->update($oid, $update))
                {
                    $output = "Log data update error\n" ;
                } 
                        
        }
        
        /** Sends an email using PyroCMS templating engine
         * 
         * 
         * @param string $slug email template slug required
         * @param int $appointment_id 
         * @param object $appointment
         * @param object $user
         * @param object $cart
         * @param string $to recipient email
         * @return bool
         */
	private function _send_email($slug, $appointment_id = null, $appointment=null, $user=null, $cart=null, $to=null )
	{
		$this->load->library('email');
		$this->load->library('user_agent');
                $from = Settings::get('server_email');
                $to = $to === null ?  Settings::get('seller_email') : $to ;
                $to = empty($to) ?  Settings::get('default_email') : $to ; // default to general site email
                //$to = Settings::get('contact_email');
                
                $params = array(
							//'subject' => 'new appointment',
							'name' => Settings::get('site_name'),
							'sender_ip' => $this->input->ip_address(),
							'sender_agent' => $this->agent->browser().' '.$this->agent->version(),
							'sender_os' => $this->agent->platform(),
							'slug' => $slug, // email template slug
							'email' => $from,
							'to' => $to,
							'appointment_id' => $appointment_id , // appointment id
							'admin_url' => '<a href="'.site_url().'admin/appointments/view/'.$appointment_id.'">Voir commande '.$appointment_id.'</a>' ,  //admin link
							'appointment_data' => $appointment, 
							'user_data' => $user, 
							'cart_data' => $cart, 
						);
                // admin
                return Events::trigger('email', $params, 'array'); 
//                // client
//                $params['slug'] = 'appointments-patient';
//                $params['subject'] = 'your appointment';
               // Events::trigger('email', $params, 'array'); 
		return ;
		
	}
}