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
    public function index()
    {
        
        $this->load->model('doctor_m');
        $params = array(
            'stream' => 'doctors',
            'namespace' => 'doctor',
            'paginate' => 'yes'
        );
        
        $category = $this->input->get('c'); 
            $this->row_m->sql['join'][] = 'LEFT JOIN '.$this->db->protect_identifiers('doctor_categories', true).' ON '.$this->db->protect_identifiers('doctor_categories.id', true).' = '.$this->db->protect_identifiers('doctor_doctors.doctor_cat', true);

        $search = $this->input->get('s');
        if(!empty($search) and !empty($category))   
        { 
            $params['where'] = "default_doctor_categories.speciality LIKE '%$category%' AND ( default_doctor_doctors.town LIKE '%$search%' OR default_doctor_doctors.area_name LIKE '$search%')" ;
        } 
        else if(!empty($category)) 
        {
            $params['where'] = "default_doctor_categories.speciality LIKE '%$category%' " ;
        }
        
        $data = new stdClass();
        $data->doctors = $this->streams->entries->get_entries($params);

        $template = 'doctors';
 				
        // AJAX and XHR
        if($this->input->is_ajax_request() AND $this->template->set_layout(false))
        {
            $adata = $data->doctors;
            foreach ($adata['entries'] as $key => $value) {
                $adata['entries'][$key]['js_name'] = json_encode($adata['entries'][$key]['name']) ;
                $adata['entries'][$key]['js_hours'] = json_encode($adata['entries'][$key]['hours']) ;
                $adata['entries'][$key]['js_town'] = json_encode($adata['entries'][$key]['town']) ;
                $adata['entries'][$key]['js_description'] = json_encode($adata['entries'][$key]['description']) ;
                $adata['entries'][$key]['js_address'] = json_encode($adata['entries'][$key]['address']) ;
                $adata['entries'][$key]['js_area_name'] = json_encode($adata['entries'][$key]['area_name']) ;
                $adata['entries'][$key]['doctor_zone']['js_doctor_zone_title'] = json_encode($adata['entries'][$key]['doctor_zone']['doctor_zone_title']) ;
            }
//            $data = json_encode($data);
            $template = 'ajax';
            $data->doctors = $adata;
        }
        
        // Build the page
            $this->template->title(lang('doctor:doctors'))
                ->set('jsdata', $data)
                ->build($template, $data);
    }

}

/* End of file doctor.php */
