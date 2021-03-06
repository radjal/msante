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
    
    /**
     * calcul du jour de la semaine 
     *
     *
     * @access	public
     * @return	void
     */
    public function day($jour='', $week_no = false, $doctor_id=false, $template = 'jour')
    {
        if(empty($jour)) return false;
//        $doctor_id = !empty($this->uri->segment(4)) ? $this->uri->segment(4) : false; 
        
        $this->load->model('token/token_m');
        
        $token = $this->token_m->current_token(); 
        
        $data = $this->calendar_m->calculate_week($week_no);
        if(!$week_no) $week_no = $data['week'];	 
            
        $data['msg_global']         = Settings::get('msg_global'); 
        $data['msg_dujour']         = Settings::get( 'msg_'.$jour );
        $data['msg_global']         = Settings::get('msg_global');
//        $data['min_order_amount']         = Settings::get('min_order_amount'); 
        $data['titre']  = $data['isodays'][$jour]; 
        //date of selected day
        $jourdate = $data['week_dates_iso'][$data['isodays'][$jour]]['date'] ;
        $journo = $data['week_dates_iso'][$data['isodays'][$jour]]['day'] ;  
        $mois_no =  date('n', strtotime($jourdate))  ;  
        $mois_nom = $data['months'][$mois_no]   ;  
        $datenumero = str_replace('-', '',$jourdate) ;
        //jour passé
        $passe = false;
        $showinput = false;
        //access control
        if($data['today'] <= $jourdate)
        {
            $showinput = is_logged_in() ? true : false ;
        } else {
            $passe = true;
        }   
        // get appointments for date 
        $day_periods = $this->calendar_m->periods_make_day(); 
        $appointments = $this->appointments_m->get_for_date($datenumero, $doctor_id);   
        $appointments = $this->calendar_m->periods_splice_arrays( $day_periods, $appointments ) ; 
        
        // AJAX and XHR
//        if($this->input->is_ajax_request() AND $this->template->set_layout(false))
//        {}
        
        // Build the page
            $this->template->title('calendar')
                ->set('token', $token)
                ->set('data', $data)
                ->set('doctor_id', $doctor_id)
                ->set('appointments', $appointments) 
                ->set('jour', $jour)
                ->set('datenumero', $datenumero)
                ->set('jourdate', $jourdate)
                ->set('mois_no', $mois_no)
                ->set('mois_nom', $mois_nom)
                ->set('journo', $journo)
                ->set('passe', $passe)
                ->set('showinput', $showinput) 
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
            // jours d'activités
            $jours_ouverts = Settings::get('jours_ouverts'); // sun = 0 //NOT USED
            /* calendar */
            // day periods calculation
            $day_periods = $this->calendar_m->periods_make_day();  
            // calculate whole week of days
            $weekArr = explode(',', 'lundi,mardi,mercredi,jeudi,vendredi,samedi,dimanche'); 
            for($wc = 1; $wc < 8; $wc++) 
            { 
                    $dn = $weekArr[$wc-1]; //day names
                    if(strstr($jours_ouverts, "$wc")) //if open on day
                    {
                        $semaine[$dn] = true;
                        // get appointments for day
                        $datestr = str_replace('-', '', $data['week_dates_iso'][$wc]['date']); 
                        $appointments[$dn] = $this->appointments_m->get_for_date($datestr, $doctor_id);   
                        $appointments[$dn.'_joined'] = $this->calendar_m->periods_splice_arrays( $day_periods, $appointments[$dn] ) ;
                    }
            }  
                              
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
            //for template use
//            $day_link_segment = $this->method == 'this_week' ? 'day' : "day/$week_no" ;

            /**
            // AJAX and XHR
            if($this->input->is_ajax_request() AND $this->template->set_layout(false))
            {}
             */
        
            // Build the page
            $this->template->title('calendar')
                ->set('data', $data)
                ->set('appointments', $appointments)
                ->set('doctor_id', $doctor_id)
                ->set('lundi', $semaine['lundi'])
                ->set('mardi', $semaine['mardi'])
                ->set('mercredi', $semaine['mercredi'])
                ->set('jeudi', $semaine['jeudi'])
                ->set('vendredi', $semaine['vendredi'])
                ->set('samedi', $semaine['samedi'])
                ->set('dimanche', $semaine['dimanche'])
//                ->set('day_link_segment', $day_link_segment)
                ->build($template, $data);
    }

    /** 
     * wrapper for day(), takes a date string YYYYMMDD  
     * 
     * @param type $date
     */
    public function fordate($date, $template = 'jour') 
    { 
        $date = str_replace('-', '', $date); // remove '-' in case of SQL date format YYYY-MM-DD
        $y = substr($date, 0, 4);
        $m = substr($date, 4, 2);
        $d = substr($date, 6);
        //get day no and week no
        $newdate = new DateTime();
        $newdate->setDate((int)$y, (int)$m, (int)$d);
        $newdate->setTime(0, 0 ); 
        $week_no = $newdate->format('W'); 
        $day_no = $newdate->format('N');  
        //need name of week day for day function
        $days[1] = 'lundi';
        $days[2] = 'mardi';
        $days[3] = 'mercredi';
        $days[4] = 'jeudi';
        $days[5] = 'vendredi';
        $days[6] = 'samedi';
        $days[7] = 'dimanche';        
        $day = $days[$day_no];
        // use profile to get doctor_id in user setting 
        $this->load->model('users/profile_m');
        $profile_data = $this->profile_m->get_profile(); 
        $doctor_id = !empty($profile_data->doctor_id) && $profile_data->doctor_id >0 ? $profile_data->doctor_id : false ;
        // call day function
        $this->day( $day, $week_no, $doctor_id , $template); 
    }
     
    /** 
     * return summary of appointments for day, takes a date string YYYYMMDD  
     * wrapper for fordate()
     * 
     * @param type $date
     */
    public function fordate_digest($date, $template = 'fordate_digest') 
    {  
        // call fordate function with template for AJAX/JSON
        $this->fordate( $date, $template); 
    }
    
    /**
     *  wrapper functions below
     */
       
    /** wrapper for index */
    public function this_week()
    {
        $this->index();
    }
    
    /** wrapper for index */
    public function week($week_no=false)
    { 
            $this->index($week_no); 
    }
    	
    /** wrapper for day lundi */
    public function lundi($week_no=false, $doc_id=false)
    { 
            $this->day('lundi', $week_no, $doc_id); 
    }

    /** wrapper for day mardi */
    public function mardi($week_no=false, $doc_id=false)
    { 
            $this->day('mardi', $week_no, $doc_id); 
    }

    /** wrapper for day mercredi */
    public function mercredi($week_no=false, $doc_id=false)
    { 
            $this->day('mercredi', $week_no, $doc_id); 
    }

    /** wrapper for day jeudi */
    public function jeudi($week_no=false, $doc_id=false)
    { 
            $this->day('jeudi', $week_no, $doc_id); 
    }

    /** wrapper for day vendredi */
    public function vendredi($week_no=false, $doc_id=false)
    { 
            $this->day('vendredi', $week_no, $doc_id); 
    }

    /** wrapper for day samedi */
    public function samedi($week_no=false, $doc_id=false)
    { 
            $this->day('samedi', $week_no, $doc_id); 
    }

    /** wrapper for day dimanche */
    public function dimanche($week_no=false, $doc_id=false)
    { 
            $this->day('dimanche', $week_no, $doc_id); 
    } 
}

/* End of file calendar.php */
