<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Calendar extends Public_Controller
{
    /**
     * The constructor
     * @access public
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    
        $this->load->model('calendar_m');
        // $this->lang->load('calendar');
        // $this->load->driver('Streams');
         $this->template->append_js('module::calendar.js');
         $this->template->append_css('module::calendar.css');
    }
    
    /** wrapper for index */
    public function this_week()
    {
        $this->index();
    }
    
    /** wrapper for index */
    public function week($week_no=false)
    {
//        $day = $this->uri->segment(4);
//        if(!empty($day)) 
//        {
//            $this->day($day, $week_no);
//        } else {
            $this->index($week_no);
//        }
    }
 	
    /**
     * calcul du jour de la semaine 
     *
     *
     * @access	public
     * @return	void
     */
    public function day($jour='', $week_no = false)
    {
        if(empty($jour)) return false;
        
//        $this->load->model('orders_m');
        $this->load->model('token/token_m');
        
        $token = $this->token_m->current_token();
        
        // remove cart cookie to avoid mixing products for different days
        // @todo add as setting
//        $this->orders_m->delete_cookie_cart();
        
        $template = 'jour';
        
        $data = $this->calendar_m->calculate_week($week_no);
        if(!$week_no) $week_no = $data['week'];	

        //get cat id from slug eg:s44 = semaine 44
//        $week_cat_id =  $this->calendar_m->category_id("s$week_no");
            
        $data['msg_global']         = Settings::get('msg_global'); 
        $data['msg_dujour']         = Settings::get( 'msg_'.$jour );
        $data['msg_global']         = Settings::get('msg_global');
//        $data['min_order_amount']         = Settings::get('min_order_amount');
        
        $data['titre']  = $data['isodays'][$jour];
      
        //date of selected day
        $jourdate = $data['week_dates_iso'][$data['isodays'][$jour]]['date'] ;
        $journo = $data['week_dates_iso'][$data['isodays'][$jour]]['day'] ;

        //jour passé
        $passe = false;
        $showinput = false;
        if($data['today'] <= $jourdate)
        {
            $showinput = is_logged_in() ? true : false ;
        } else {
            $passe = true;
        }
                
//        // boissons
//        $boissons = $this->calendar_m->produits('', '', $data['no_cat_boissons']);
//        if ($showinput) $boissons = $this->orders_m->products_list_html($boissons);
//        
//        // entrées
//        $entrees = $this->calendar_m->produits($catjour, $week_cat_id, $data['no_cat_entree']);
//        if ($showinput) $entrees = $this->orders_m->products_list_html($entrees);
//        
//        // plats
//        $plats = $this->calendar_m->produits($catjour, $week_cat_id, $data['no_cat_plat']);
//        if ($showinput) $plats = $this->orders_m->products_list_html($plats);
//        
//        // desserts
//        $desserts = $this->calendar_m->produits($catjour, $week_cat_id, $data['no_cat_dessert']);
//        if ($showinput) $desserts = $this->orders_m->products_list_html($desserts);
//        
        // AJAX and XHR
        if($this->input->is_ajax_request() AND $this->template->set_layout(false))
        {}
        
        // Build the page
            $this->template->title('calendar')
                ->set('token', $token)
                ->set('data', $data)
                ->set('jour', $jour)
                ->set('jourdate', $jourdate)
                ->set('journo', $journo)
                ->set('passe', $passe)
                ->set('showinput', $showinput)
//                ->set('entrees', $entrees)
//                ->set('plats', $plats)
//                ->set('desserts', $desserts)
//                ->set('boissons', $boissons)
                ->build($template);
    }
 	
    /**
     * calendar module settings
     */
    public function info()
    {
        $this->load->model('orders_m');
        $template = 'info';
        
        $data = $this->calendar_m->calculate_week($jour);
		
        $data['msg_global']         = Settings::get('msg_global');
        
//        $data['no_cat_entree']      = Settings::get('no_cat_entree');
//        $data['no_cat_plat']        = Settings::get('no_cat_plat');
//        $data['no_cat_dessert']     = Settings::get('no_cat_dessert');
//        $data['no_cat_boissons']    = Settings::get('no_cat_boissons');
//        
//        $data['cat_lundi']          = Settings::get('cat_lundi');
//        $data['cat_mardi']          = Settings::get('cat_mardi');
//        $data['cat_mercredi']       = Settings::get('cat_mercredi');
//        $data['cat_jeudi']          = Settings::get('cat_jeudi');
//        $data['cat_vendredi']       = Settings::get('cat_vendredi');
//        $data['cat_samedi']         = Settings::get('cat_samedi');
//        $data['cat_dimanche']       = Settings::get('cat_dimanche');
        
        // Build the page
            $this->template->title('info')
                ->set('data', $data)
                ->build($template);
    }
 	
    /**
     * calcul de la semaine 
     *
     *
     * @access	public
     * @return	void
     */
    public function index($week_no=false)
    {
            $template = 'index';
            $doctor_id = !empty($this->uri->segment(4)) ? $this->uri->segment(4) : false;
            

            $data = $this->calendar_m->calculate_week($week_no);

            $data['msg_global']         = Settings::get('msg_global');
            
            if(!$week_no) $week_no = $data['week'];
            $data['no_semaine_pair']      = ($week_no % 2) == 1 ? true : false ;
            
            $data['titre'] = 'Calendar ';
            
//            $data['no_cat_entree']      = Settings::get('no_cat_entree'); 	
			
            //get cat id from slug eg:s44 = semaine 44
//            $week_cat_id =  $this->calendar_m->category_id("s$week_no");
//            if(!empty($week_cat_id)) 
//            {
                            // jours
                            $jours_ouverts = Settings::get('jours_ouverts'); // sun = 0
                            if(strstr($jours_ouverts, '1')) 
                            {
                                $semaine['lundi'] = true;
                                // get appointments for day
                                $datestr = str_replace('-', '', $data['week_dates_iso'][1]['date']); 
                                $appointments['lundi'] = $this->appointments_m->get_for_date($datestr, $doctor_id);  
                            }
                            if(strstr($jours_ouverts, '2')) 
                            {
                                $semaine['mardi'] = true;
                                // get appointments for day
                                $datestr = str_replace('-', '', $data['week_dates_iso'][2]['date']); 
                                $appointments['mardi'] = $this->appointments_m->get_for_date($datestr, $doctor_id);  
                            }    
                            if(strstr($jours_ouverts, '3')) 
                            {
                                $semaine['mercredi'] = true;
                                // get appointments for day
                                $datestr = str_replace('-', '', $data['week_dates_iso'][3]['date']); 
                                $appointments['mercredi'] = $this->appointments_m->get_for_date($datestr, $doctor_id);  
                            }
                            if(strstr($jours_ouverts, '4'))
                            {
                                $semaine['jeudi'] = true;
                                // get appointments for day
                                $datestr = str_replace('-', '', $data['week_dates_iso'][4]['date']); 
                                $appointments['jeudi'] = $this->appointments_m->get_for_date($datestr, $doctor_id);  
                            }
                            if(strstr($jours_ouverts, '5')) 
                            {
                                $semaine['vendredi'] = true;
                                // get appointments for day
                                $datestr = str_replace('-', '', $data['week_dates_iso'][5]['date']); 
                                $appointments['vendredi'] = $this->appointments_m->get_for_date($datestr, $doctor_id);  
                            }
                            if(strstr($jours_ouverts, '6')) 
                            {
                                $semaine['samedi'] = true;
                                // get appointments for day
                                $datestr = str_replace('-', '', $data['week_dates_iso'][6]['date']); 
                                $appointments['samedi'] = $this->appointments_m->get_for_date($datestr, $doctor_id);  
                            }
                            if(strstr($jours_ouverts, '7')) 
                            {
                                $semaine['dimanche'] = true;
                                // get appointments for day
                                $datestr = str_replace('-', '', $data['week_dates_iso'][7]['date']); 
                                $appointments['dimanche'] = $this->appointments_m->get_for_date($datestr, $doctor_id);  
                            }   
                             
//            } 
//            else
//            {
//                $semaine[] = '';
//            }
            
            /** make var for each day */
//            $lundi      = isset($semaine['lundi']) ? $semaine['lundi']: false;
//            $mardi      = isset($semaine['mardi']) ? $semaine['mardi']: false;
//            $mercredi   = isset($semaine['mercredi']) ? $semaine['mercredi']: false;
//            $jeudi      = isset($semaine['jeudi']) ? $semaine['jeudi']: false;
//            $vendredi   = isset($semaine['vendredi']) ? $semaine['vendredi']: false;
//            $samedi     = isset($semaine['samedi']) ? $semaine['samedi']: false;
//            $dimanche   = isset($semaine['dimanche']) ? $semaine['dimanche']: false;

            /** count days to show */
            $data['dayscount'] = count($semaine);
            if (($data['dayscount'] % 2) == 1)
            { 
                 $data['days_oddeven'] = 'odd'; // odd or even number of days
            }
            else
            { 
                         $data['days_oddeven'] = 'even';
            }
            
            $day_link_segment = $this->method == 'this_week' ? 'jour' : "week/$week_no" ;

            /**
            // AJAX and XHR
            if($this->input->is_ajax_request() AND $this->template->set_layout(false))
            {}
             */
        
            // Build the page
            $this->template->title('calendar')
                ->set('data', $data)
                ->set('appointments', $appointments)
                ->set('lundi', $semaine['lundi'])
                ->set('mardi', $semaine['mardi'])
                ->set('mercredi', $semaine['mercredi'])
                ->set('jeudi', $semaine['jeudi'])
                ->set('vendredi', $semaine['vendredi'])
                ->set('samedi', $semaine['samedi'])
                ->set('dimanche', $semaine['dimanche'])
                ->set('day_link_segment', $day_link_segment)
                ->build($template, $data);
    }

}

/* End of file calendar.php */
