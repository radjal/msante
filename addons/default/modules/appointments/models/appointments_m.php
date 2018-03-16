<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a appointments module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Appointments Module
 */
class Appointments_m extends MY_Model {

	public function __construct()
	{		
		parent::__construct();
		
		/**
		 * If the appointments module's table was named "appointmentss"
		 * then MY_Model would find it automatically. Since
		 * I named it "appointments" then we just set the name here.
		 */
		$this->_table = 'appointments_list';
	}
        
	//make sure the slug is valid
	public function _check_slug($slug)
	{
		$slug = strtolower($slug);
		$slug = preg_replace('/\s+/', '-', $slug);

		return $slug;
	}
        
        /** set search conditions for appointments listing
         * 
         * @param array $search array of search vars, usually from GET
         */
        public function _set_search($search)
	{
                // convert to string if array
                if(isset($search['appointment_status']) && is_array($search['appointment_status']) ) $search['appointment_status'] = implode (' ', $search['appointment_status']); 
                if(isset($search['appointment_status']) && !empty($search['appointment_status'])) $search['appointment_status'] = trim($search['appointment_status']) ;
                
                if(isset($search['payment_type']) && is_array($search['payment_type']) ) $search['payment_type'] = implode (' ', $search['payment_type']); 
                if(isset($search['payment_type']) && !empty($search['payment_type'])) $search['payment_type'] = trim($search['payment_type']) ;

                if(!empty($search['appointment_status'])) $this->db->where('default_appointments_list.appointment_status', $search['appointment_status'] );
                if(!empty($search['payment_type'])) $this->db->where('default_appointments_list.payment_type', $search['payment_type'] );
                if(!empty($search['name'])) $this->db->like('default_appointments_list.name', $search['name'] );
                if(!empty($search['id'])) $this->db->like('default_appointments_list.id', $search['id'], 'after');
                if(!empty($search['slug'])) $this->db->like('default_appointments_list.slug', $search['slug'], 'after');
                if(!empty($search['delivery_date'])) $this->db->like('default_appointments_list.delivery_date', $search['delivery_date'], 'after');
                if(!empty($search['user_id'])) $this->db->like('default_appointments_list.user_id', $search['user_id'], 'after');
                if(!empty($search['d_fullname'])) $this->db->like('default_appointments_list.d_fullname', $search['d_fullname'], 'both' );
                if(!empty($search['d_company'])) $this->db->like('default_appointments_list.d_company', $search['d_company'], 'both' );
                if(!empty($search['d_town'])) $this->db->like('default_appointments_list.d_town', $search['d_town'], 'after' );
                if(!empty($search['d_zipcode'])) $this->db->like('default_appointments_list.d_zipcode', $search['d_zipcode'], 'after' );
                if(!empty($search['d_mail'])) $this->db->like('default_appointments_list.d_mail', $search['d_mail'], 'after' );
                if(!empty($search['d_mobile'])) $this->db->like('default_appointments_list.d_mobile', $search['d_mobile'], 'after' );
                if(!empty($search['d_phone'])) $this->db->like('default_appointments_list.d_phone', $search['d_phone'], 'after' );
        } 	
       
        /** set search conditions for appointment details listing
         * 
         * @param array $search array of search vars, usually from GET
         */
        public function _set_details_search($search)
	{
                // convert to string if array
                if(isset($search['appointment_status']) && is_array($search['appointment_status']) ) $search['appointment_status'] = implode (' ', $search['appointment_status']); 
                if(isset($search['appointment_status']) && !empty($search['appointment_status'])) $search['appointment_status'] = trim($search['appointment_status']) ;
                
                if(isset($search['payment_type']) && is_array($search['payment_type']) ) $search['payment_type'] = implode (' ', $search['payment_type']); 
                if(isset($search['payment_type']) && !empty($search['payment_type'])) $search['payment_type'] = trim($search['payment_type']) ;

                if(!empty($search['appointment_status'])) $this->db->where('default_appointments_list.appointment_status', $search['appointment_status'] );
                if(!empty($search['payment_type'])) $this->db->where('default_appointments_list.payment_type', $search['payment_type'] );
                if(!empty($search['name'])) $this->db->like('default_appointments_list.name', $search['name'] );
                if(!empty($search['id'])) $this->db->like('default_appointments_list.id', $search['id'], 'after');
                if(!empty($search['slug'])) $this->db->like('default_appointments_list.slug', $search['slug'], 'after');
                if(!empty($search['delivery_date'])) $this->db->like('default_appointments_list.delivery_date', $search['delivery_date'], 'after');
                if(!empty($search['user_id'])) $this->db->like('default_appointments_list.user_id', $search['user_id'], 'after');
                if(!empty($search['d_fullname'])) $this->db->like('default_appointments_list.d_fullname', $search['d_fullname'], 'both' );
                if(!empty($search['d_company'])) $this->db->like('default_appointments_list.d_company', $search['d_company'], 'both' );
                if(!empty($search['d_town'])) $this->db->like('default_appointments_list.d_town', $search['d_town'], 'after' );
                if(!empty($search['d_mail'])) $this->db->like('default_appointments_list.d_mail', $search['d_mail'], 'after' );
                if(!empty($search['d_mobile'])) $this->db->like('default_appointments_list.d_mobile', $search['d_mobile'], 'after' );
                if(!empty($search['d_phone'])) $this->db->like('default_appointments_list.d_phone', $search['d_phone'], 'after' );
        } 	
        
        /**
         * 
         * @param array $newstocks
         * @return array
         */
        public function add_to_stock($newstocks) 
        {
                foreach ($newstocks as $line => $p) {
                        $res = $this->db->update('products', 
                                    array(
                                      'id' => $p['id'] ,
                                      'stock' => $p['stock'] ,
                                    ),
                                    array('id' => $p['id']));
                }
                return $res;
        }
	
        public function substract_from_stock($newstocklist) 
        {
            $data = array();
            foreach ($newstocklist as $line => $p) {
                            $data[] = array(
                                  'id' => $p['id'] ,
                                  'stock' => $p['stock'] ,
                                );
                                
            }           
            return    $this->db->update_batch('products', $data, 'id'); 

        }
        
        // @todo normalize cart product usage 
        //create a new item
	public function save_appointment($appointment, $cart=null)
	{
            if (is_object($appointment)) {
                $appointment = get_object_vars($appointment);
            }
		$appointment['slug'] = $this->_check_slug($appointment['slug']);
                // some cleaning of inputs
                unset($appointment['btnAction']);
                unset($appointment['_token']);
                $appointment['total_pretax'] = !empty($appointment['total_pretax']) ? $appointment['total_pretax'] : 0;
                $appointment['total_final'] = !empty($appointment['total_final']) ? $appointment['total_final'] : 0;
                $appointment['appointment_date'] = date( "Y-m-d H:i:s" );
                $appointment['delivery_date'] = !empty($appointment['delivery_date']) ? format_date($appointment['delivery_date'], "Y-m-d") : null;
                $appointment['created_on'] = date( "Y-m-d H:i:s" );
                $appointment['updated_on'] = null;
                $appointment['ip'] = $this->input->ip_address();
                $appointment['user_agent'] = $this->input->user_agent();

                
		$this->db->insert('appointments_list', $appointment);
                $noid = $this->db->insert_id();
                
                /** 
                 * 
                if(is_array($cart) AND count($cart['products'])>0 )
                {
                    foreach ($cart['products'] as $p => $p_details) {
                        
                                $newstocklist[$p]['id'] = $p_details['id'];
                                $newstocklist[$p]['stock'] = $p_details['stock'] - $p_details['appointment_qty'];
                                //* appointments_details table //
                                $details[$p]['appointment_id'] = $noid;
                                $details[$p]['product_id'] = $p_details['id'];
                                $details[$p]['name'] = $p_details['name'];
                                $details[$p]['slug'] = $p_details['slug'];
                                $details[$p]['unit'] = $p_details['unit'];
                                $details[$p]['origin'] = $p_details['origin'];
                                $details[$p]['product_qty'] = $p_details['appointment_qty'];
                                $details[$p]['unit_price'] = $p_details['price'];
                                $details[$p]['line_price'] = $p_details['line_price'];
                                $details[$p]['tax'] = $p_details['tax'];
                                $details[$p]['final_price'] = $p_details['line_total'];
                                $details[$p]['image_filename'] = $p_details['image_filename'];
                                $details[$p]['created_on'] = date( "Y-m-d H:i:s" );
                    }
                    $this->delete_cookie_cart();
                    $res = $this->db->insert_batch('appointments_details', $details);
                }
                 */
                
                /**
                 // stock management 
		if (Settings::get('manage_stock') == 1)
                {                    
                    $res = $this->substract_from_stock($newstocklist);
                }
                if($res) return $noid;
                return $res; 
                 */
                return $noid;
        }

        public function newappointment() 
        {
            $profile = $this->current_user;

            $appointment['delivery_date'] = $this->input->post('delivery_date');
            $appointment['user_id'] = isset($profile->id) ? $profile->id : 0 ;
            $appointment['slug'] = empty($this->input->post('slug')) ? uniqid(): $this->input->post('slug') ;
            $appointment['name'] =  empty($this->input->post('name')) ? $appointment['slug'] : $this->input->post('name');
            $appointment['appointment_status'] = '';
            $appointment['total_pretax'] = 0;
            $appointment['total_final'] = 0;
            $appointment['appointment_date'] = date( "Y-m-d H:i:s" );
            $appointment['delivery_date'] = $this->input->post('delivery_date');
            $appointment['appointment_time'] = $this->input->post('appointment_time');
            $appointment['log'] = $this->input->post('log');
            $appointment['payment_type'] = !empty($this->input->post('payment_type')) ? $this->input->post('payment_type') : '';
            $appointment['payment_status'] = '';
			
			// defaults adapt to pyro user custom fields 
                        $message        =  ($profile->info_acces != null AND empty($this->input->post('message')) )  ? $profile->info_acces : '';
                        
			$i_company 	= $profile->company != null 	? $profile->company : ''; 		
			$maiden_name 	= $profile->last_name != null 	? $profile->first_name . " ". $profile->last_name : '' ; 		
			$mobile 	= $profile->phone != null 		? $profile->phone : ''; 			
			$phone 	= $profile->mobile != null 		? $profile->mobile : '';  			
			$email 	= $profile->email != null 		? $profile->email : ''; 			
			$address 	= $profile->address != null 	? $profile->address : ''; 		
			$i_street2 	= ''; 		
			$town 	= $profile->ville != null 		? $profile->ville : ''; 			
			$area_name 	= $profile->code_postal != null 	? $profile->code_postal : ''; 		
			$i_country 	=  ''; 		

			$d_company 	= $i_company; 		
			$d_fullname 	= $maiden_name; 		
			$d_mobile 	= $mobile; 			
			$d_phone 	= $phone; 			
			$d_mail 	= $email; 			
			$d_street1 	= $address; 		
			$d_street2 	= $i_street2; 		
			$d_town 	= $town; 			
			$d_zipcode 	= $area_name; 		
			$d_country 	= $i_country; 		
			
			
			// override with POST values
			$appointment['i_company'] = empty($this->input->post('i_company')) 	? $i_company 	: $this->input->post('i_company');
			$appointment['maiden_name'] = empty($this->input->post('maiden_name')) 			? $maiden_name 		: $this->input->post('maiden_name');
			$appointment['mobile'] = empty($this->input->post('mobile')) 		? $mobile 	: $this->input->post('mobile') ;
			$appointment['phone'] = empty($this->input->post('phone')) 		? $phone 		: $this->input->post('phone');
			$appointment['email'] = empty($this->input->post('email')) 			? $email 		: $this->input->post('email');
			$appointment['address'] = empty($this->input->post('address')) 	? $address 	: $this->input->post('address') ;
			$appointment['i_street2'] = empty($this->input->post('i_street2')) 	? $i_street2 	: $this->input->post('i_street2');
			$appointment['town'] = empty($this->input->post('town')) 			? $town 		: $this->input->post('town') ;
			$appointment['area_name'] = empty($this->input->post('area_name')) 	? $area_name 	: $this->input->post('area_name') ;
			$appointment['i_country'] = empty($this->input->post('i_country')) 	? $i_country 	: $this->input->post('i_country') ;
			
			$appointment['d_company'] = empty($this->input->post('d_company')) 	? $d_company 	: $this->input->post('d_company');
			$appointment['d_fullname'] = empty($this->input->post('d_fullname')) 			? $d_fullname 		: $this->input->post('d_fullname');
			$appointment['d_mobile'] = empty($this->input->post('d_mobile')) 		? $d_mobile 	: $this->input->post('d_mobile') ;
			$appointment['d_phone'] = empty($this->input->post('d_phone')) 		? $d_phone 		: $this->input->post('d_phone');
			$appointment['d_mail'] = empty($this->input->post('d_mail')) 			? $d_mail 		: $this->input->post('d_mail');
			$appointment['d_street1'] = empty($this->input->post('d_street1')) 	? $d_street1 	: $this->input->post('d_street1') ;
			$appointment['d_street2'] = empty($this->input->post('d_street2')) 	? $d_street2 	: $this->input->post('d_street2');
			$appointment['d_town'] = empty($this->input->post('d_town')) 			? $d_town 		: $this->input->post('d_town') ;
			$appointment['d_zipcode'] = empty($this->input->post('d_zipcode')) 	? $d_zipcode 	: $this->input->post('d_zipcode') ;
			$appointment['d_country'] = empty($this->input->post('d_country')) 	? $d_country 	: $this->input->post('d_country') ;
					
                    $appointment['message'] = $this->input->post('message')."\n$message";
            
            return (object) $appointment;
        }
        
        /*
         * delete details of appointment base on appointment id 
         */
        public function delete_details($appointment_id)
        {
            if(empty($appointment_id)) return false ;    
            $this->db->where('appointment_id', $appointment_id);
            $res = $this->db->delete('appointments_details'); 
            return $res ;
        }
        
        /** set appointment status to 'cancelled by user' 
         * 
         * @param int $appointment_id
         * @return boolean
         */
        public function soft_delete($appointment_id)
        {
            if(empty($appointment_id)) return false ;   
            
            // stock management 
            if (Settings::get('manage_stock') == 1)
            {
                $cart = $this->get_cartdetails($appointment_id, 'desc');
                foreach ($cart as $line => $p ) {
                    $pidlist[] = $p['product_id'];
                }
                unset($line);
                unset($p);
                
                $products = $this->get_selected_products($pidlist, 'desc');
                foreach ($products as $line => $p) {
                        $newstocks[$line]['stock'] = $p['stock'] + $cart[$line]['product_qty'];
                        $newstocks[$line]['id'] = $p['id'] ;
                }
                $this->add_to_stock($newstocks);
            }
            
            //$res = $this->delete_details($appointment_id);
//            $this->db->where('id', $appointment_id);
//            return $this->db->delete('appointments_list'); 
            $update['appointment_status'] = 'cancelled_by_user';
            $this->appointments_m->update($appointment_id, $update);
        }
        
        /*
         * delete based on appointment id 
         */
        public function delete($appointment_id)
        {
            if(empty($appointment_id)) return false ;   
            
            // stock management 
            if (Settings::get('manage_stock') == 1)
            {
                $cart = $this->get_cartdetails($appointment_id, 'desc');
                foreach ($cart as $line => $p ) {
                    $pidlist[] = $p['product_id'];
                }
                unset($line);
                unset($p);
                
                $products = $this->get_selected_products($pidlist, 'desc');
                foreach ($products as $line => $p) {
                        $newstocks[$line]['stock'] = $p['stock'] + $cart[$line]['product_qty'];
                        $newstocks[$line]['id'] = $p['id'] ;
                }
                $this->add_to_stock($newstocks);
            }
            
            $res = $this->delete_details($appointment_id);
            
            $this->db->where('id', $appointment_id);
            return $this->db->delete('appointments_list'); 
        }
        
        /*
         * get products using a products id array
         */
        public function get_selected_products($pidlist, $appointment='asc')
        {
            $this->db->order_by('name', $appointment);    
            $res = $this->db->where_in('id', $pidlist)
                            ->get('products')
                            ->result_array();
        
            return $res;
        }
        
        /** add useful HTML to products array 
         *  merges with array of selected IDs for populatinf input with selecteed quantity
         * 
         * @param array $products
         * @param array $selected
         * @return array
         */
        public function products_list_html($products, $selected= array())
        {
            foreach ($products as $p => $p_details) 
                {
                    $pid = $p_details['id'];
                    $pname = "product[$pid]";
                    $fvalue = isset($selected[$pid]) ? $selected[$pid] : '';
                    $fvalue = str_replace(',', '.', $fvalue) ;
                    $extra ='';
                    $class = '';
					$type = 'text';
                    // disable if no stock and stock management active
                    if(Settings::get('manage_stock') == 1 ) $extra = $p_details['stock'] > 0 ? 'max="'. $p_details['stock'].'"' : 'disabled ';
                    
                    $extra .= !empty($fvalue) ? ' value="'.$fvalue.'"' : '' ;
                    $extra .= ' min="0"' ;
                    if($p_details['unit'] == 'unitary') $type = 'number' ;
                    if($p_details['stock'] <= 0) $class = ' no-stock' ;
					
                    $input = '<input class="appointment_product'.$class.'" id="'.$pname.'" name="'.$pname.'" type="'.$type.'" aria-type="'.$type.'" '.$extra.' data-stock="'.$p_details['stock'].'" data-dtprice="'.$p_details['price'].'" data-price="'.$p_details['final_price'].'" />';
                    $img = '<img src="'.site_url().UPLOAD_PATH.'products/'.$p_details['image_filename'].'" height="100" >';
                    $products[$p]['input_html']= $input;
                    $products[$p]['img_html']= $img ; 
                    $products[$p]['img_url']= site_url().UPLOAD_PATH.'products/'.$p_details['image_filename'] ; 
                    $products[$p]['short_final_price']= number_format($p_details['final_price'],0) ; 
                 }
            return $products;
        }
        
        /*
         * calculate cart total using products array
         */
        public function calculate_cart($products, $selected = array())
        {
            $sum_price = 0;
            $sum_taxed = 0;
            $count = 0;
//                foreach ($selected as $s_id => $s_qty) 
                foreach ($products as $p => $p_details) 
                {
                    $s_qty = $selected[$p_details['id']];
                    $s_qty = str_replace(',', '.', $s_qty) ;
                    $s_id = $p_details['id'];
                    if($s_qty > 0 ) 
                    {                       
                        $count ++;
                        $products[$p]['line'] = $count;       
                        $products[$p]['appointment_qty'] = $s_qty;
                        $products[$p]['line_price'] = number_format($products[$p]['price'] * $s_qty, 2);
                        $products[$p]['line_total'] = number_format($products[$p]['final_price'] * $s_qty, 2);
                        $sum_price += $products[$p]['price'] * $s_qty;
                        $sum_taxed += $products[$p]['final_price'] * $s_qty;
                        $products[$p]['sum_price'] = $sum_price;
                        $products[$p]['sum_taxed'] = $sum_taxed;
                    }
                }
                
                //calc totals
                $cart['total_price'] = number_format($sum_price, 2);
                $cart['total_taxed'] = number_format($sum_taxed, 2);
                $cart['products'] = $products;
                
            return $cart;
                 
        }
        
        /*
         * clean post array
         */
        public function prepare_post($postarray) 
        {       
                if(isset($postarray['btnAction'])) unset($postarray['btnAction']) ; // cleaning
                $postarray['total_pretax'] = !empty($postarray['total_pretax']) ? str_replace(',', '.', $postarray['total_pretax']) : 0;
                $postarray['total_final'] = !empty($postarray['total_final']) ? str_replace(',', '.', $postarray['total_final']) : 0;
                $postarray['appointment_date'] = !empty($postarray['appointment_date']) ? $postarray['appointment_date'] : null;
                $postarray['delivery_date'] = !empty($postarray['delivery_date']) ? $postarray['delivery_date'] : null;
                $postarray['appointment_time'] = !empty($postarray['appointment_time']) ? $postarray['appointment_time'] : null;
                $postarray['created_on'] = !empty($postarray['created_on']) ? $postarray['created_on'] : null;
                $postarray['updated_on'] = !empty($postarray['updated_on']) ? $postarray['updated_on'] : null;
                return $postarray;
        }
        
        /** get cart, refresh with POST selection, calculates prices and adds html 
         * 
         * @param int $removeid product id to remove from cart
         * @param string $appointmentdir asc or desc
         * @return boolean
         */
        public function get_cart($removeid='',$appointmentdir = 'asc')
        {
            
            $stored = $this->get_cookie_cart(); 
            
            // make list of selected products and amounts
            if(isset($_POST['product'])) 
            {
                $prods = $_POST['product'] ; //cart products array
                    foreach ($prods as $pid => $p_qty) {
                            //$p_qty = empty($p_qty) ? 0 : $p_qty;
                        
                            if(!empty($p_qty) AND $p_qty > 0 ) 
                            // construct selected from post
                            {       
                                 
                                    if ($pid !== $removeid) $selected[$pid] = $p_qty; 
                                    //remove exising from cookie data
                                    if(isset($stored)) unset($stored[$pid]);
                            } 
                    }

                    // add fresh selection to remainder of old
                    if(isset($selected) AND is_array($stored)) {
                        $stored = $stored + $selected; 
                    } elseif(!$stored AND isset($selected)) {
                        $stored = $selected;
                    }
                    unset($pid);
            } 
            
                if(!$stored) return false;
                // construct product id list for later
                if(!empty($removeid) ) $stored[$removeid]=0;
                foreach ($stored as $pid => $p_qty) {
                                 if($p_qty > 0)
                                 {
                                    $pidlist[] = $pid;
                                 } else {
                                    if(isset($stored)) unset($stored[$pid]); // souldn't happen
                                 }
                }
                
          
                $this->set_cookie_cart($stored); 
                if(!isset($pidlist)) return false;
                // get products
                $products = $this->appointments_m->get_selected_products($pidlist, $appointmentdir);

                if(count($products) > 0) 
                {
                    $products =  $this->appointments_m->products_list_html($products, $stored);
                    $cart =  $this->appointments_m->calculate_cart($products, $stored);    
                } 
                return $cart;
        }
        
        /*
         * get saved cart list of products
         */
        public function get_cartdetails($appointment_id, $appointment='asc')
        {
            if(empty($appointment_id)) return false;
            
                $this->db->order_by('name', $appointment);  
                // get products
                $cart = $this->db
                        ->get_where('appointments_details', array('appointment_id' => $appointment_id))
                        ->result_array();
                
                // correction because of inconsistant field names 
                // @todo normalise field names between tables
                foreach ($cart as $p => $p_details) {
                    $cart[$p]['sum_price'] = number_format($p_details['line_price'], 2);
                    $cart[$p]['sum_taxed'] = number_format($p_details['final_price'], 2);
                    //$cart[$p]['price'] = number_format($p_details['price'], 2);
                }
                
                return $cart;
        }

        /**
         * get cookie for 
         * @return	content
         */
        public function get_cookie_cart()
        {
           
            $this->load->helper('cookie');
            $cookiedata = get_cookie('appointmentcart');
            return unserialize($cookiedata);
        }
                        
        /**
         * set cookies for domain
         * @return	?TO FINISH
         */
        public function set_cookie_cart($data='')
        {
            $expire = 3600 * 24  ;//1day
            $value = is_array($data) ? serialize($data) : $data ;
            $this->load->helper('cookie');
             return set_cookie('appointmentcart', $value, $expire);
        }
        
        public function delete_cookie_cart()
        {
            $this->load->helper('cookie');
             return set_cookie('appointmentcart', '', '-3600');
        }
                
        /** count total appointments results for search
         * 
         * @param array $search_vars
         * @return int
         */
        public function appointments_count_all($search_vars = false) 
        {
            if(!$search_vars) return $this->db->count_all('default_appointments_list');
            $this->db->from('default_appointments_list');
            $this->_set_search($search_vars);
            return $this->db->count_all_results(); 
        }
                
        /** count total appointment details results for search
         * 
         * @param array $search_vars
         * @return int
         */
        public function details_count_all($search_vars = false) 
        {
            if(!$search_vars) return $this->db->count_all('default_appointments_details');
            $this->db->from('default_appointments_details');
            $this->db->join('appointments_list', 'appointments_details.appointment_id = appointments_list.id ');
            $this->_set_details_search($search_vars);
            return $this->db->count_all_results(); 
        }
        
        /** wouldn't need this if cart data model was normalized
         *  
         */
        private function normalize_cart() 
        {
            
        }


        /**
         * 
         * @param string $filepath
         * @param string $output JSON or oneline
         * @return string file content
         */
	public function getfile($filepath, $output=false)
	{
		$output = strtolower($output);
		$path = ADDONPATH."modules/appointments/$filepath";
		
		if(!empty($path)) $content = file_get_contents($path); 
		
		switch($output) {
			case 'json':
				$content = json_encode($content);
				break;
			case 'oneline':
				$appointment   = array("\r\n", "\n", "\r");
				$content = str_replace($appointment, ' ', $content);
				$content = str_replace("'", "\'", $content);
				break;
			default :
				break;
		}
		return $content;
	}
        
}
