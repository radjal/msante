<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a orders module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Orders Module
 */
class Orders extends Public_Controller
{
	public function __construct()
	{
		parent::__construct();

		// Load the required classes
		$this->load->model('users/profile_m');
		$this->load->model('orders_m');
		$this->load->model('html_m');
		$this->lang->load('orders');

		$this->template
			->append_css('module::orders.css');
                
                $this->load->library('form_validation');
               
		// Set the validation rules
		$this->item_validation_rules = array(
			array(
				'field' => 'delivery_date',
				'label' => lang('orders:delivery_date'),
				'rules' => 'required'
			),
			array(
				'field' => 'payment_type',
				'label' => lang('orders:payment_type'),
				'rules' => ''
			),
			array(
				'field' => 'd_fullname',
				'label' => lang('orders:d_fullname'),
				'rules' => 'required'
			),
			array(
				'field' => 'd_street1',
				'label' => lang('orders:d_street1'),
				'rules' => 'required'
			),
			array(
				'field' => 'd_town',
				'label' => lang('orders:d_town'),
				'rules' => 'required'
			),
			array(
				'field' => 'd_zipcode',
				'label' => lang('orders:d_zipcode'),
				'rules' => 'required|max_length[10]'
			),
//			array(
//				'field' => 'i_fullname',
//				'label' => lang('orders:i_fullname'),
//				'rules' => 'required'
//			),
//			array(
//				'field' => 'i_street1',
//				'label' => lang('orders:i_street1'),
//				'rules' => 'required'
//			),
//			array(
//				'field' => 'i_town',
//				'label' => lang('orders:i_town'),
//				'rules' => 'required'
//			),
//			array(
//				'field' => 'i_zipcode',
//				'label' => lang('orders:i_zipcode'),
//				'rules' => 'required|max_length[10]'
//			),
		);
	}

	/**
	 * order form and selected products
	 */
	public function index($offset = 0)
	{   
            $this->template
                    ->append_js('module::orders.js')
                    ->append_js('module::jscart.js')
//                    ->append_js('module::relays.js')
//                    ->append_js('module::paypal.js')
//                    ->append_js('module::livraison.js')
                    ->append_js('module::datepicker.js');   
           
            $this->load->model('token/token_m');
            
            if(!$this->current_user)
            {
                    $this->session->set_flashdata('success', lang('orders:only_user_send'));
                    $this->session->set_userdata('redirect_to','orders');
                    redirect('users/login');
            }
            
            $details = null;
            $msg ='';
            $remove = $this->input->get('remove');
            $this->load->model('users/profile_m');
            
            $order = $this->orders_m->neworder();
            $profile_data = $this->profile_m->get_profile();
            $cart = $this->orders_m->get_cart($remove);
            
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
            $order->total_pretax = $cart['total_price'];
            $order->total_final = $cart['total_taxed']; 

            // saving the order
            $this->form_validation->set_rules($this->item_validation_rules);
                if(isset($_POST['orderSend']) AND $order->total_final > 0)  // order sent
                {   
                        if($order->total_final < $this->settings->min_order_amount) 
                        {
                                $this->session->set_flashdata('error', lang('orders:min_amount_not_met'));
                                redirect('orders');
                        }

                        if(isset($_POST['_token'])) // for retro compatibility 
                        {
                                if($this->token_m->check_token($this->input->post('_token'), true ) === false) {
                                    // stop
                                    $this->session->set_flashdata('error', lang('orders:token_error'));
                                    redirect('orders');
                                }
                                                           
                                // if it got this far we can remove token
                                $this->token_m->kill_token($token); 
                                $this->token_m->delete_cookie_token($token); 
                        } 
                        
                        if ($this->form_validation->run())
                        {
                                $noid = $this->orders_m->save_order($order, $cart);
                                if ($noid)
                                {
                                        $this->session->set_flashdata('success', lang('orders:saved_waiting'));
                                        $this->_send_email('orders-admin',$noid, $order, $this->current_user, $cart['products']);
                                        $this->_send_email('orders-client', $noid, $order, $this->current_user, $cart['products'], $this->current_user->email);
                                        redirect("orders/listing");
                                } else {
                                    $this->session->set_flashdata('error', lang('orders:error'));
                                }
                        } 
                        else
                        {
                                $msg = validation_errors() ;
                        }
                }

            
		$this->template
			->title($this->module_details['name'], lang('orders:create'))
			->set('token', $token)
			->set('editable', true)
			->set('profile', $profile_data)
			->set('message', $msg)
			->set('order', $order)
			->set('cartlist', $cart['products'])
			->set('carttotal', $totals)
			->set('details', $details)
			->build('order');
	}

	/**
	 * view order form and selected products, partialy modifiable
	 */
        public function view($oid) 
        {   
            $this->template
                    //->append_js('module::jscart.js')
                    ->append_js('module::orders.js')
                    ->append_js('module::datepicker.js')
//                    ->append_js('module::relays.js')
//                    ->append_js('module::paypal.js')
                    ->append_js('module::livraison.js');
            
            $msg='';
            $editable=false;
            $user = $this->current_user;
            if(!$user)
            {
                $this->session->set_flashdata('success', lang('orders:only_for_user'));
                redirect('users/login');
            }
            
            /* get order */
            $order = $this->orders_m->get($oid);
            if(!isset($order)) 
            {
                $this->session->set_flashdata('error', lang('orders:error').' no oid');
                redirect('orders/listing');
            }
            
            /* check if same user */
            if($order->user_id != $user->id)
            {
                $this->session->set_flashdata('error', lang('orders:error').' not same user');
                redirect('orders/listing');
            }
            
            $profile_data = $this->profile_m->get_profile();
            $cart = $this->orders_m->get_cartdetails($oid);
            
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
            
            //set values of cart total
            $totals[0]['total_price'] = $order->total_pretax ;
            $totals[0]['total_taxed'] = $order->total_final;
            
            //update allowed fields if no status
            if(isset($_POST['orderSend']) AND empty($order->order_status)) 
            {
                 $this->form_validation->set_rules($this->item_validation_rules);
                    if ($this->form_validation->run())
                    {
                        $update['delivery_date'] = $this->input->post('delivery_date');
                        $update['message'] = $this->input->post('message');
                        //$update['log'] = $this->input->post('log');
                        $update['payment_type'] = !empty($this->input->post('payment_type')) ? $this->input->post('payment_type') : '';
                        $update['log'] = !empty($this->input->post('log')) ? $this->input->post('log')."\n".$order->log : $order->log ;
                            $update['i_fullname'] = $this->input->post('i_fullname');
                            $update['i_mobile'] = $this->input->post('i_mobile');
                            $update['i_phone'] = $this->input->post('i_phone');
                            $update['i_mail'] = $this->input->post('i_mail');
                            $update['i_street1'] = $this->input->post('i_street1') ;
                            //$update['i_street2'] = $this->input->post('i_street2');
                            $update['i_town'] = $this->input->post('i_town') ;
                            $update['i_zipcode'] = $this->input->post('i_zipcode') ;
                                $update['d_fullname'] = $this->input->post('d_fullname');
                                $update['d_mobile'] = $this->input->post('d_mobile');
                                $update['d_phone'] = $this->input->post('d_phone');
                                $update['d_mail'] = $this->input->post('d_mail');
                                $update['d_street1'] = $this->input->post('d_street1') ;
                                //$update['d_street2'] = $this->input->post('d_street2');
                                $update['d_town'] = $this->input->post('d_town') ;
                                $update['d_zipcode'] = $this->input->post('d_zipcode') ;
                                    
                        $update['updated_on'] = date( "Y-m-d H:i:s" );
                        if($this->orders_m->update($oid, $update))
                        {
                            $this->session->set_flashdata('success', lang('orders:modified'));                                        
                            $this->_send_email('orders-modified-admin',$oid, $update, $this->current_user, $cart);
                            redirect("orders/view/$oid");
                        }
                    }
                    else
                    {
                            $msg = validation_errors() ;
                    }        
                    
            }
            

                
            $cartlist['products'] = $cart;
            if(empty($order->order_status)) $editable =true;
            
            $this->template
			->title($this->module_details['name'], lang('orders:view'))
			->set('token', '')
			->set('editable', $editable)
			->set('message', $msg)
			->set('profile', $profile_data)
                        ->set('order', $order)
			->set('carttotal', $totals)
			->set('cartlist', $cart)
			->build('order');
        }
        
        /** confirm and delete an order
         * 
         * @param integer $oid
         */
        public function delete($oid) 
        {
            if(!$this->current_user)
            {
                redirect('users/login');
            }
            if(isset($_POST['orderDelete'])) 
            {
                $order = $this->orders_m->get($oid);
                if(empty($order->order_status) AND $order->user_id == $this->current_user->id) 
                {
                    $this->orders_m->soft_delete($oid); // keep in DB
//                    $this->orders_m->delete($oid);
                    $this->session->set_flashdata('success', lang('orders:success'));
                    $this->_send_email('orders-deleted-admin',$oid, $order, $this->current_user);
                    redirect('orders/listing');
                } else {
                    $this->session->set_flashdata('error', lang('orders:no_delete_if_status'));
                    redirect('orders/listing');
                }
            }            
            
            $this->template
			->title($this->module_details['name'], ' delete order')
			->build('delete');
        }
        
        /**
         * erase cookie
         */
        public function cancel_order() 
        {       
                $this->session->set_flashdata('success', lang('orders:cart_cancelled'));
                $order = $this->orders_m->delete_cookie_cart();
                redirect();
        }
        
        /**
         * list orders for user 
         * @param int $offset
         */
        public function listing($offset = 0)
	{
            if($offset < 0) $offset = 0; //@todo  a proper job of  negative offset 
            $this->template->append_js('module::search_datepicker.js');
            
            if(!$this->current_user)
            {
                $this->session->set_flashdata('success', lang('orders:only_for_user'));
                redirect('users/login');
            }
		// set the pagination limit
		$limit = 20;
		$where = '';
		$sort = !empty($this->input->get('sort')) ? $this->input->get('sort') : 'id';
		$sortdir = !empty($this->input->get('sortdir')) ? $this->input->get('sortdir') : 'desc';
		
                if(!empty($this->input->post('searchBtn')))
                {
                    $delivery_date = $this->input->post('delivery_date');
                    $d_fullname = $this->input->post('d_fullname');
                    $slug = $this->input->post('slug');

                    if(!empty($delivery_date)) $this->db->or_like('delivery_date', $delivery_date, 'after');
                    if(!empty($d_fullname)) $this->db->or_like('d_fullname', $d_fullname);
                    if(!empty($slug)) $this->db->where('slug', $slug);
                }
            
		$items = $this->orders_m->limit($limit)
			->offset($offset)
                        ->where($where."user_id = ".$this->current_user->id)
                        ->order_by($sort, $sortdir)
			->get_all();
			
		// we'll do a quick check here so we can tell tags whether there is data or not
		$items_exist = count($items) > 0;

                // proper count for users
                $query = $this->db->query('SELECT count(*) as count FROM default_orders_list where ' . "user_id = ".$this->current_user->id);
                $row = $query->row();
                $count =  $row->count;
                
		// we're using the pagination helper to do the pagination for us. Params are: (module/method, total count, limit, uri segment)
		$pagination = create_pagination('orders/listing', $count, $limit, 3);

		$this->template
			->title($this->module_details['name'], lang('orders:listing'))
			->set('orders', $items)
			->set('count', $count)
			->set('items_exist', $items_exist)
			->set('pagination', $pagination)
			->build('myorders');
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
            $order = $this->orders_m->get($oid);
            
            $user = $this->current_user;
            if($order->user_id != $user->id) return false;
            
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
                                "orderId" => "$oid-$slug",
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
                                    "description" => "Identifiant de commande ".$slug."\nMontant :".$order->total_final
                                  ],
                                ]
                            ]);
                            if ($result->success) {
                              $output = ("Success ID: " . $result->transaction->id);
                              $update['payment_status'] = 'paid';
                              
                                //$this->_send_email('orders-paid', $oid, $order, $this->current_user, '', $this->current_user->email);
                              $update['order_status'] = 'waiting_treatment';
                            } else {
                              $output = ("Error Message: " . $result->message);
                              $update['payment_status'] = 'error';
                              $update['order_status'] = 'waiting_treatment';
                            }
                            
                       $update['log'] = $output . "\n" . $order->log; 
                        if(!$this->orders_m->update($oid, $update))
                        {
                            $output = "Log data update error\n".$output;
                        } 
                        
                    break;
            }
            
            // AJAX and XHR
            $this->template->set_layout(false)->set('output', $output)->build('ajax');
        }
       
        /**
         * add something to log field of an order
         * @param type $oid order ID
         * @return string on error
         */
        public function log($oid) 
        {
            $order = $this->orders_m->get($oid);
            $user = $this->current_user;
            
            if($order->user_id != $user->id) return;
            $msg = $this->input->get('m');
            if(empty($msg)) return;
            $update['log'] = $msg . "\n" . $order->log ;
                if(!$this->orders_m->update($oid, $update))
                {
                    $output = "Log data update error\n" ;
                } 
                        
        }
        
        /** Sends an email using PyroCMS templating engine
         * 
         * 
         * @param string $slug email template slug required
         * @param int $order_id 
         * @param object $order
         * @param object $user
         * @param object $cart
         * @param string $to recipient email
         * @return bool
         */
	private function _send_email($slug, $order_id = null, $order=null, $user=null, $cart=null, $to=null )
	{
		$this->load->library('email');
		$this->load->library('user_agent');
                $from = Settings::get('server_email');
                $to = $to === null ?  Settings::get('seller_email') : $to ;
                $to = empty($to) ?  Settings::get('default_email') : $to ; // default to general site email
                //$to = Settings::get('contact_email');
                
                $params = array(
							//'subject' => 'new order',
							'name' => Settings::get('site_name'),
							'sender_ip' => $this->input->ip_address(),
							'sender_agent' => $this->agent->browser().' '.$this->agent->version(),
							'sender_os' => $this->agent->platform(),
							'slug' => $slug, // email template slug
							'email' => $from,
							'to' => $to,
							'order_id' => $order_id , // order id
							'admin_url' => '<a href="'.site_url().'admin/orders/view/'.$order_id.'">Voir commande '.$order_id.'</a>' ,  //admin link
							'order_data' => $order, 
							'user_data' => $user, 
							'cart_data' => $cart, 
						);
                // admin
                return Events::trigger('email', $params, 'array'); 
//                // client
//                $params['slug'] = 'orders-client';
//                $params['subject'] = 'your order';
               // Events::trigger('email', $params, 'array'); 
		return ;
		
	}
}