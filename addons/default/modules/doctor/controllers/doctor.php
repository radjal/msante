<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Doctor extends Public_Controller
{

    /**
     * The constructor
     * @access public
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('doctor_m');
        $this->lang->load('doctor');
        $this->load->driver('Streams');
        $this->template->append_css('module::doctor.css');
        $this->template->append_js('module::doctors.js');
    }
	
     /**
     * List all Doctors
     *
     * We are using the Streams API to grab
     * data from the doctors database. It handles
     * pagination as well.
     *
     * @access	public
     * @return	void
     */
    public function index($week=false)
    {        
        $category = addslashes($this->input->post('c')); 
        $search = addslashes($this->input->post('s')); 
        
        $params = array(
            'stream' => 'doctors',
            'namespace' => 'doctor',
            'paginate' => 'yes'
        );
        
        //joining table through ACTIVE RECORD
        $this->row_m->sql['join'][] = 'LEFT JOIN '.$this->db->protect_identifiers('doctor_categories', true).' ON '.$this->db->protect_identifiers('doctor_categories.id', true).' = '.$this->db->protect_identifiers('doctor_doctors.doctor_cat', true);
        $this->row_m->sql['join'][] = 'LEFT JOIN '.$this->db->protect_identifiers('doctor_organisations', true).' ON '.$this->db->protect_identifiers('doctor_organisations.id', true).' = '.$this->db->protect_identifiers('doctor_doctors.groupe', true);
        //query params 
        if($search and $category)   
        { 
            $params['where'] = "default_doctor_doctors.name LIKE '%$search%' OR default_doctor_categories.speciality LIKE '%$category%' AND ( default_doctor_doctors.town LIKE '%$search%' OR default_doctor_doctors.area_name LIKE '$search%')" ;
        } 
        else if(!$search and $category) 
        {
            $params['where'] = "default_doctor_doctors.name LIKE '%$category%' OR default_doctor_categories.speciality LIKE '%$category%' " ;
        }
        else if($search and !$category) 
        {
            $params['where'] = "default_doctor_doctors.name LIKE '%$search%' OR default_doctor_doctors.town LIKE '%$search%' OR default_doctor_doctors.area_name LIKE '$search%'" ;
        } 
        if( isset($params['where']) )
        {
            $params['where'] = $params['where']." AND default_doctor_doctors.validated = 'yes'" ;
        } else 
        {
            $params['where'] = "default_doctor_doctors.validated = 'yes'"; 
        }
        $data = new stdClass();
        $data->doctors = $this->streams->entries->get_entries($params);

        
        //open days as string for template usage 
        foreach ($data->doctors['entries'] as $key => $value) 
        {
//            $str='';
//            foreach ($data->doctors['entries'][$key]['days'] as $arr) {
//                $str .= $arr["value"] . ",";
//            }
//            $str = trim($str, ',');//removes the final comma 
//            $data->doctors['entries'][$key]['daysopenstr']=$str; 
                $data->doctors['entries'][$key]['daysopenstr'] = $this->doctor_m->days_to_str($data->doctors['entries'][$key]['days']) ; 
        } 
        
        
        /* calendar */
        $this->load->model('appointments/appointments_m');
        $this->load->model('calendar/calendar_m');
        // day periods calculation
        $day_periods = $this->calendar_m->periods_make_day();   
        $cal_week = $this->calendar_m->calculate_week($week); 
        //LOOP doctors 
        $weekArr = explode(',', 'lundi,mardi,mercredi,jeudi,vendredi,samedi,dimanche'); 
        $jours_ouverts= implode(',',$weekArr);  
        $dcount = 0;
        foreach ($data->doctors['entries'] as $doctor) 
        {
            // calculate whole week of days
            for($wc = 1; $wc < 8; $wc++) 
            { 
                    $dn = $weekArr[$wc-1]; //day names
                    if(strstr($jours_ouverts, $dn )) //if open on day
                    { 
                        // get appointments for one day
                        $datestr = str_replace('-', '', $cal_week['week_dates_iso'][$wc]['date']); 
                        $doctor['appointments'][$dn] = $this->appointments_m->get_for_date($datestr, $doctor['id']);   
                        $doctor['calendar'][$dn] = $this->calendar_m->periods_splice_arrays( $day_periods, $doctor['appointments'][$dn] ) ;  
                    }
            }
            //update doctors array
            $data->doctors['entries'][$dcount] = $doctor;
            $dcount++; 
        }   
            
            

        $template = 'doctors';
 				
        // AJAX and XHR
        if($this->input->is_ajax_request() AND $this->template->set_layout(false))
        {
            $cat = $data->doctors;
            foreach ($cat['entries'] as $key => $value) 
            {
                $cat['entries'][$key]['js_name'] = json_encode($cat['entries'][$key]['name']) ;
                $cat['entries'][$key]['js_town'] = json_encode($cat['entries'][$key]['town']) ;
                $cat['entries'][$key]['js_description'] = json_encode($cat['entries'][$key]['description']) ;
                $cat['entries'][$key]['js_address'] = json_encode($cat['entries'][$key]['address']) ;
                $cat['entries'][$key]['js_area_name'] = json_encode($cat['entries'][$key]['area_name']) ;
////                $cat['entries'][$key]['js_hours'] = json_encode($cat['entries'][$key]['hours']) ;
////                $cat['entries'][$key]['doctor_zone']['js_doctor_zone_title'] = json_encode($cat['entries'][$key]['doctor_zone']['doctor_zone_title']) ;
            }
//            $data = json_encode($data);
            $template = 'ajax';
            $data->doctors = $cat;
        } 
        
        // Build the page
            $this->template->title(lang('doctor:doctors'))
//                ->set('jsdata', $data)
                ->set('search', stripslashes($search))
                ->set('doc_count', $dcount)
                ->set('category', stripslashes($category))
                ->set('cal_week', $cal_week)
                ->build($template, $data);
    }
	
     /**
     * show doctor
     *
     * We are using the Streams API to grab
     * data from the doctors database. It handles
     * pagination as well.
     *
     * @access	public
     * @return	void
     */
    public function view($id)
    {
        
        $this->load->model('doctor_m');
        $params = array(
            'stream' => 'doctors',
            'namespace' => 'doctor',
            'paginate' => 'no'
        );
         
        $this->row_m->sql['join'][] = 'LEFT JOIN '.$this->db->protect_identifiers('doctor_categories', true).' ON '.$this->db->protect_identifiers('doctor_categories.id', true).' = '.$this->db->protect_identifiers('doctor_doctors.doctor_cat', true);
        $this->row_m->sql['join'][] = 'LEFT JOIN '.$this->db->protect_identifiers('doctor_organisations', true).' ON '.$this->db->protect_identifiers('doctor_organisations.id', true).' = '.$this->db->protect_identifiers('doctor_doctors.groupe', true);
 
        $params['where'] = "default_doctor_doctors.id = '$id' " ;
  
        $data = new stdClass();
        $data = $this->streams->entries->get_entries($params);
//        $data->doctor = $this->streams->entries->get_entry($id, $params['stream'], $params['namespace'] );
        $doctor = $data['entries'][0];
        
        //open days as string for template usage   
//        $str='';
//        foreach ($doctor['days'] as $day ) 
//        { 
//                $str .= $day["value"] . ","; 
//        }
//        $str = trim($str, ',');//removes the final comma 
//        $doctor['daysopenstr']=$str; //FINISH 
        $doctor['daysopenstr'] = $this->doctor_m->days_to_str($doctor['days']) ; 
        
        //calendar
        
        $week_id = !empty($this->uri->segment(4)) ? $this->uri->segment(4) : false; 
        $this->load->model('appointments/appointments_m');
        $this->load->model('calendar/calendar_m');
        // day periods calculation
        $day_periods = $this->calendar_m->periods_make_day();    
        $cal_week =  $this->calendar_m->calculate_week($week_id);

        //LOOP doctors 
        $weekArr = explode(',', 'lundi,mardi,mercredi,jeudi,vendredi,samedi,dimanche'); 
        $jours_ouverts= implode(',',$weekArr);  
//        $dcount = 0;
//        foreach ($data->doctors['entries'] as $doctor) 
//        {
            // calculate whole week of days
            for($wc = 1; $wc < 8; $wc++) 
            { 
                    $dn = $weekArr[$wc-1]; //day names
                    if(strstr($jours_ouverts, $dn )) //if open on day
                    { 
                        // get appointments for day
                        $datestr = str_replace('-', '', $cal_week['week_dates_iso'][$wc]['date']); 
                        $doctor['appointments'][$dn] = $this->appointments_m->get_for_date($datestr, $doctor['id']);   
                        $doctor['calendar'][$dn] = $this->calendar_m->periods_splice_arrays( $day_periods, $doctor['appointments'][$dn] ) ;  
                    }
            }
            //update doctors array
            $doctor = $doctor; //reassign
//            $dcount++; 
//        }   
        
        
        
        $template = 'doctor';
 				
        // AJAX and XHR
        if($this->input->is_ajax_request() AND $this->template->set_layout(false))
        {
//            $cat = $data->doctor;
////            foreach ($cat['entries'] as $key => $value) 
////            {
////                $cat['entries'][$key]['js_name'] = json_encode($cat['entries'][$key]['name']) ;
////                $cat['entries'][$key]['js_town'] = json_encode($cat['entries'][$key]['town']) ;
////                $cat['entries'][$key]['js_description'] = json_encode($cat['entries'][$key]['description']) ;
////                $cat['entries'][$key]['js_address'] = json_encode($cat['entries'][$key]['address']) ;
////                $cat['entries'][$key]['js_area_name'] = json_encode($cat['entries'][$key]['area_name']) ;
////////                $cat['entries'][$key]['js_hours'] = json_encode($cat['entries'][$key]['hours']) ;
////////                $cat['entries'][$key]['doctor_zone']['js_doctor_zone_title'] = json_encode($cat['entries'][$key]['doctor_zone']['doctor_zone_title']) ;
////            }
////            $data = json_encode($data);
//            $template = 'ajax';
//            $data->doctor = $cat;
        } 
        
        // Build the page
            $this->template->title(lang('doctor:doctor') . ' - View')
//                ->set('jsdata', $data)
                ->set('cal_week', $cal_week)
                ->build($template, $doctor);
    }
	
     /**
     * view doctor info only no calendar 
     *
     * @access	public
     * @return	void
     */
    public function info($id)
    {
        
        $this->load->model('doctor_m');
        $params = array(
            'stream' => 'doctors',
            'namespace' => 'doctor',
            'paginate' => 'no'
        );
         
        $this->row_m->sql['join'][] = 'LEFT JOIN '.$this->db->protect_identifiers('doctor_categories', true).' ON '.$this->db->protect_identifiers('doctor_categories.id', true).' = '.$this->db->protect_identifiers('doctor_doctors.doctor_cat', true);
        $this->row_m->sql['join'][] = 'LEFT JOIN '.$this->db->protect_identifiers('doctor_organisations', true).' ON '.$this->db->protect_identifiers('doctor_organisations.id', true).' = '.$this->db->protect_identifiers('doctor_doctors.groupe', true);
 
        $params['where'] = "default_doctor_doctors.id = '$id' " ;
  
        $data = new stdClass();
        $data = $this->streams->entries->get_entries($params); 
        $doctor = $data['entries'][0];
        
        //open days as string for template usage   
        $str='';
        foreach ($doctor['days'] as $day ) 
        { 
                $str .= $day["value"] . ","; 
        }
        $str = trim($str, ',');//removes the final comma 
        $doctor['daysopenstr']=$str; //FINISH
          
        // AJAX and XHR
        if($this->input->is_ajax_request() AND $this->template->set_layout(false))
        {
//            $cat = $data->doctor;
////            foreach ($cat['entries'] as $key => $value) 
////            {
////                $cat['entries'][$key]['js_name'] = json_encode($cat['entries'][$key]['name']) ;
////                $cat['entries'][$key]['js_town'] = json_encode($cat['entries'][$key]['town']) ;
////                $cat['entries'][$key]['js_description'] = json_encode($cat['entries'][$key]['description']) ;
////                $cat['entries'][$key]['js_address'] = json_encode($cat['entries'][$key]['address']) ;
////                $cat['entries'][$key]['js_area_name'] = json_encode($cat['entries'][$key]['area_name']) ;
////////                $cat['entries'][$key]['js_hours'] = json_encode($cat['entries'][$key]['hours']) ;
////////                $cat['entries'][$key]['doctor_zone']['js_doctor_zone_title'] = json_encode($cat['entries'][$key]['doctor_zone']['doctor_zone_title']) ;
////            }
////            $data = json_encode($data);
//            $template = 'ajax';
//            $data->doctor = $cat;
        } 
        
        // Build the page
            $this->template->title(lang('doctor:doctor'), ' - Info')
//                ->set('jsdata', $data)
//                ->set('cal_week', $cal_week)
                ->build('info', $doctor);
    }
	
     /**
     * get categories 
     *
     * @access	public
     * @return	void
     */
    public function categories($catid=null, $images=false)
    {
        $template = 'categories';
        $this->load->model('doctor_m'); 
        
        $cat = $this->doctor_m->get_categories($catid, $images);
        
        // AJAX and XHR
        if($this->input->is_ajax_request() AND $this->template->set_layout(false))
        { 
            foreach ($cat['entries'] as $key => $value) 
            {
                $cat['entries'][$key]['js_name'] = json_encode($cat['entries'][$key]['name']) ; 
            }  
            $template = 'json-categories';
        } 
        
        // Build the page
            $this->template->title(lang('doctor:doctor') ) 
                ->set('data' , $cat )
                ->build($template, $cat);
    }

    public function week($week_no) 
    {
        $this->index($week_no);
    }
}

/* End of file doctor.php */
