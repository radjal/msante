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
				'field' => 'doctor_id',
				'label' => lang('appointments:doctor_id'),
				'rules' => 'trim|required'
			),
			array(
				'field' => 'appointment_date',
				'label' => lang('appointments:appointment_date'),
				'rules' => 'trim|required'
			),
			array(
				'field' => 'appointment_time',
				'label' => lang('appointments:appointment_time'),
				'rules' => 'trim|required'
			),
			array(
				'field' => 'birth_date',
				'label' => lang('appointments:birth_date'),
				'rules' => 'trim|required'
			),
			array(
				'field' => 'payment_type',
				'label' => lang('appointments:payment_type'),
				'rules' => ''
			), 
//			array(
//				'field' => 'maiden_name',
//				'label' => lang('appointments:maiden_name'),
//				'rules' => 'trim'
//			),
			array(
				'field' => 'address',
				'label' => lang('appointments:address'),
				'rules' => 'trim'
			),
			array(
				'field' => 'area_name',
				'label' => lang('appointments:area_name'),
				'rules' => 'trim'
			),
			array(
				'field' => 'district',
				'label' => lang('appointments:district'),
				'rules' => 'trim|required'
			),
			array(
				'field' => 'town',
				'label' => lang('appointments:town'),
				'rules' => 'trim|required'
			),
			array(
				'field' => 'insurance',
				'label' => lang('appointments:insurance'),
				'rules' => 'trim'
			),
			array(
				'field' => 'knows_doctor',
				'label' => lang('appointments:knows_doctor'),
				'rules' => 'trim'
			),
		);
	}

        public function index($segment1=0)
        {
            $this->set($segment1);
//            $this->listing($segment1); 
        }
        
	/**
	 * appointment form crud
	 */
	public function set($offset = 0)
	{   
            $this->template
                    ->append_js('module::appointment.js') 
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
//            $remove = $this->input->get('remove');
            $this->load->model('users/profile_m');
            
            $appointment = $this->appointments_m->newappointment();
            $profile_data = $this->profile_m->get_profile(); 
            
            // get doctor info
            $this->load->model('doctor/doctor_m');
            $doctor = isset($appointment->doctor_id) ? $this->doctor_m->get_doctor($appointment->doctor_id) : ' '; 
            
            // token check
            $token = $this->token_m->current_token();
                
            // saving the appointment
            $this->form_validation->set_rules($this->item_validation_rules);
//            redirect();
                if(isset($_POST['appointmentSend']) )  // appointment sent 
                {    
//                        
                        if(!$appointment->doctor_id) 
                        {
                                $this->session->set_flashdata('error', 'No doctor ID');
                                redirect('appointments');
                        }

                        if(isset($_POST['_token'])) // for retro compatibility @todo check if being used
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
                                $noid = $this->appointments_m->save_appointment($appointment);
//                                $noid = $this->appointments_m->save_appointment($appointment, $cart);
                                if ($noid>0)
                                {
                                        $this->session->set_flashdata('success', lang('appointments:saved_waiting'));
                                        $this->_send_email('appointments-admin', $noid, $appointment, $this->current_user);
                                        $this->_send_email('appointments-patient', $noid, $appointment, $this->current_user, null, $this->current_user->email);
//                                        $this->_send_email('appointments-doctor', $noid, $appointment, $this->current_user, null, $this->current_user->email);
                                        redirect("appointments/success/$noid");
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
			->set('doctor', $doctor)
			->set('editable', true)
			->set('profile', $profile_data)
			->set('message', $msg)
			->set('appointment', $appointment)
//			->set('cartlist', $cart['products'])
//			->set('carttotal', $totals)
			->set('details', $details)
			->build('appointment');
	}

	/**
	 * view appointment form and selected products, partialy modifiable
	 */
        public function view($oid) 
        {   
            $this->template 
                    ->append_js('module::appointment.js'); 
            
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
//                redirect('appointments/listing');
            }
            
            /* get doctor info */
            $this->load->model('doctor/doctor_m');
            $doctor = $this->doctor_m->get_doctor($appointment->doctor_id);
            
            /* check if same user */
            if($appointment->user_id != $user->id)
            {
                $this->session->set_flashdata('error', lang('appointments:error').' not same user');
                redirect();
            }
            
            $profile_data = $this->profile_m->get_profile();
                
            //update selected fields if no status
            if(isset($_POST['appointmentSend']) AND empty($appointment->appointment_status)) 
            {
                 $this->form_validation->set_rules($this->item_validation_rules);
                    if ($this->form_validation->run())
                    {
//                        $update['appointment_date'] = $this->input->post('appointment_date');
                        $update['message'] = $this->input->post('message');
                        //$update['log'] = $this->input->post('log');
                        $update['payment_type'] = !empty($this->input->post('payment_type')) ? $this->input->post('payment_type') : '';
                        $update['log'] = !empty($this->input->post('log')) ? $this->input->post('log')."\n".$appointment->log : $appointment->log ;
                            $update['maiden_name'] = $this->input->post('maiden_name'); 
                            $update['town'] = $this->input->post('town') ;
                            $update['district'] = $this->input->post('district') ;
                            $update['area_name'] = $this->input->post('area_name') ;
                            $update['insurance'] = $this->input->post('insurance') ;
                            $update['knows_doctor'] = $this->input->post('knows_doctor') ;
                                    
                        $update['updated_on'] = date( "Y-m-d H:i:s" );
                        if($this->appointments_m->update($oid, $update))
                        {
                            $this->session->set_flashdata('success', lang('appointments:modified'));                                        
                            $this->_send_email('appointments-modified-admin',$oid, $update, $this->current_user);
                            redirect("appointments/view/$oid");
                        }
                    }
                    else
                    {
                            $msg = validation_errors() ;
                    }        
                    
            }
                
            //can user edit
            if(empty($appointment->appointment_status)) $editable =true;
            //output formatting
            $appointment->formatted_date = $this->appointments_m->datestr_to_day($appointment->appointment_date)
                                    .' '. $this->appointments_m->datestr_to_month($appointment->appointment_date) ;
            $appointment->formatted_time = $this->appointments_m->timestr_format($appointment->appointment_time) ;
            
            $this->template
			->title($this->module_details['name'], lang('appointments:view'))
			->set('token', '')
			->set('doctor', $doctor)
			->set('editable', $editable)
			->set('message', $msg)
			->set('profile', $profile_data)
                        ->set('appointment', $appointment) 
			->build('appointment');
        }

	/**
	 * success page
	 */
        public function success($oid=null) 
        {   
            $this->template 
                    ->append_js('module::appointment.js');  
            $msg='';   
            /* get appointment */
            $appointment = $this->appointments_m->get($oid);   
            /* get doctor info */
            $this->load->model('doctor/doctor_m');
            $doctor = $this->doctor_m->get_doctor($appointment->doctor_id);
            //output formatting
            $appointment->formatted_date = $this->appointments_m->datestr_to_day($appointment->appointment_date)
                                    .' '. $this->appointments_m->datestr_to_month($appointment->appointment_date) ;
            $appointment->formatted_time = $this->appointments_m->timestr_format($appointment->appointment_time) ;
            
            $this->template
			->title($this->module_details['name'], 'Success')
			->set('id', $oid) 
			->set('message', $msg) 
			->set('doc_id', $appointment->doctor_id)
			->set('doctor', $doctor)
                        ->set('appointment', $appointment) 
			->build('success');
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
            $appointment = $this->appointments_m->get($oid);
            //output formatting
            $appointment->time_formatted = $this->appointments_m->timestr_format($appointment->appointment_time);
            $appointment->date_formatted = $this->appointments_m->datestr_to_day($appointment->appointment_date);
            $appointment->month = $this->appointments_m->datestr_to_month($appointment->appointment_date);
            
            if(isset($_POST['appointmentDelete'])) 
            {
//                $appointment = $this->appointments_m->get($oid);
                if(empty($appointment->appointment_status) AND $appointment->user_id == $this->current_user->id) 
                {
                    $this->appointments_m->soft_delete($oid); // keep in DB
//                    $this->appointments_m->delete($oid);
                    $this->session->set_flashdata('success', lang('appointments:success'));
                    $this->_send_email('appointments-deleted-admin',$oid, $appointment, $this->current_user);
//                    redirect('appointments/listing');
                } else {
                    $this->session->set_flashdata('error', lang('appointments:no_delete_if_status'));
//                    redirect('appointments/listing');
                }
                redirect('rendez-vous'); // done redirect
            }            
            
            /* get doctor info */
            $this->load->model('doctor/doctor_m');
            $doctor = $this->doctor_m->get_doctor($appointment->doctor_id);
            // some formatting for date and time 
            
            
            
            
            $this->template
			->title($this->module_details['name'], ' delete appointment')
			->set('doctor', $doctor)  
			->set('doctor_id', $appointment->doctor_id)  
			->build('delete',$appointment);
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
//		$where = '';
		$sort = !empty($this->input->get('sort')) ? $this->input->get('sort') : 'appointments_list.id';
		$sortdir = !empty($this->input->get('sortdir')) ? $this->input->get('sortdir') : 'desc';
                $offset = $offset < 2 ? 0 : ($offset-1) * $limit; 
		
                // search query
                $svars = $this->input->post();
                if(!empty($this->input->post('searchBtn')))
                {
                    $this->appointments_m->_set_search($svars); 
                }
            
                //get dataset
		$items = $this->appointments_m->limit($limit)
                        ->join('doctor_doctors', 'appointments_list.doctor_id = doctor_doctors.id')
                        ->join('doctor_categories', 'doctor_doctors.doctor_cat = doctor_categories.id', 'left')
                        ->join('doctor_organisations', 'doctor_doctors.groupe = doctor_organisations.id', 'left')
			->offset($offset)
                        ->select('appointments_list.*')
                        ->select('doctor_doctors.id AS doc_id, doctor_doctors.name AS doc_name, doctor_doctors.image AS doc_img, doctor_doctors.address AS doc_adr, doctor_doctors.town AS doc_town, doctor_doctors.area_name AS doc_area')
                        ->select('doctor_categories.speciality AS doc_speciality, ')
                        ->select('doctor_organisations.organisation AS doc_org, doctor_organisations.subset AS doc_org_subset')
                        ->where("appointments_list.user_id = ".$this->current_user->id)
                        ->order_by($sort, $sortdir)
			->get_all();
			
                //format date and time strings
                $ic = 0;
                foreach ( $items as $appt ) 
                { 
                    $items[$ic]->short_dayname = $items[$ic]->appointment_date;
                    $appt->time_formatted = $this->appointments_m->timestr_format($appt->appointment_time);
                    $appt->date_formatted = $this->appointments_m->datestr_to_day($appt->appointment_date);
                    $appt->month = $this->appointments_m->datestr_to_month($appt->appointment_date);
                    $ic++;
//                     echo $this->appointments_m->format_appt_date($appointment->appointment_date); 
                }
                
		// we'll do a quick check here so we can tell tags whether there is data or not
		$items_exist = count($items) > 0; 
                
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
                $to =  $to === null ?  Settings::get('default_email') : $to ; // default to general site email
                $to = empty($to) ?  Settings::get('contact_email') : $to ;
                
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
        
        /**
         * erase cookie
         */
//        public function cancel_appointment() 
//        {       
//                $this->session->set_flashdata('success', lang('appointments:cart_cancelled'));
////                $appointment = $this->appointments_m->delete_cookie_cart();
////                redirect();
//        }
        
}