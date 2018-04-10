<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Based on FAQ Module example - radja
 *
 * This is a sample module for PyroCMS
 * that illustrates how to use the streams core API
 * for data management. It is also a fully-functional
 * FAQ module so feel free to use it on your sites.
 *
 * Most of these functions use the Streams API CP driver which
 * is designed to handle repetitive CP tasks, down to even loading the page.
 *
 * @author 		Adam Fairholm - PyroCMS Dev Team
 * @package 	PyroCMS
 * @subpackage 	Streams Sample Module
 */
class Admin extends Admin_Controller
{
    // This will set the active section tab
    protected $section = 'doctor';

    public function __construct()
    {
        parent::__construct();

        $this->lang->load('doctor');
        $this->load->driver('Streams');
        
        $this->template->append_css('module::admin.css');
    }

    /**
     * List all enrties using Streams CP Driver
     *
     * We are using the Streams API to grab
     * data from the doctors database. It handles
     * pagination as well.
     *
     * @return	void
     */
    public function index_streams()
    {
        // The extra array is where most of our
        // customization options go.
        $extra = array();

        // The title can be a string, or a language
        // string, prefixed by lang:
        $extra['title'] = 'lang:doctor:doctors';
        
        // We can customize the buttons that appear
        // for each row. They point to our own functions
        // elsewhere in this controller. -entry_id- will
        // be replaced by the entry id of the row.
        $extra['buttons'] = array(
            array(
                'label' => lang('global:edit'),
                'url' => 'admin/doctor/edit/-entry_id-'
            ),
            array(
                'label' => lang('global:delete'),
                'url' => 'admin/doctor/delete/-entry_id-',
                'confirm' => true
            )
        );
        
        
        /** 
	 * Extra parameters to pass in $extra array: 
	 * title	- Title of the page header (if using view override)
	 *			$extra['title'] = 'Streams Sample'; 
	 * buttons	- an array of buttons (if using view override)
	 *			$extra['buttons'] = array(
	 *				'label' 	=> 'Delete',
	 *				'url'		=> 'admin/streams_sample/delete/-entry_id-',
	 *				'confirm'	= true
	 *			);
	 * columns  - an array of field slugs to display. This overrides view options.
	 * 			$extra['columns'] = array('field_one', 'field_two'); 
 	 * sorting  - bool. Whether or not to turn on the drag/drop sorting of entries. This defaults
 	 * 			to the sorting option of the stream. 
         */
        // customizing headers
        $extra['columns'] = array('id', 'image', 'name', 'days', 'area_name', 'town',);
        
        $this->streams->cp->entries_table('doctors', 'doctor', 20, null, true, $extra);
    }

    /**
     * List all entries (Alternate)
     *
     * This example is similar to index(), but we are
     * getting entries manually using the entries API
     * and displaying the output in a custom view file.
     *
     * @return  void
     */
    public function index()
    {
        // Get our entries. We are simply specifying
        // the stream/namespace, and then setting the pagination up.
        $params = array(
            'stream' => 'doctors',
            'namespace' => 'doctor',
            'paginate' => 'no',
            'limit' => 100,
            'pag_segment' => 3
        ); 
        //search 
        $town = $this->input->post('f_town');
        $name = $this->input->post('f_name');
        $validated = $this->input->post('f_validated');
        if(!empty($town)) $params['where'] = "default_doctor_doctors.town LIKE '%$town%'" ;
        if(!empty($name)) $params['where'] = "default_doctor_doctors.name LIKE '%$name%'" ;
        if(!empty($validated)) $params['where'] = "default_doctor_doctors.validated LIKE '%$validated%'" ;
        //get entries
        $data = $this->streams->entries->get_entries($params);

        $this->load->model('doctor/doctor_m');
        //open days as string for template usage 
        foreach ($data['entries'] as $key => $value) 
        {   
                $data['entries'][$key]['daysopenstr'] = $this->doctor_m->days_to_str($data['entries'][$key]['days']) ; 
        } 

        // Build the page. See views/admin/index.php
        // for the view code.
        $this->template
                    ->title($this->module_details['name'])
                    ->set('doctors', $data['entries'])
                    ->build('admin/index', $data);
    }

    /**
     * Create a new entry
     *
     * We're using the entry_form function
     * to generate the form.
     *
     * @return	void
     */
    public function create()
    {
        $extra = array(
            'return' => 'admin/doctor',
            'success_message' => lang('doctor:submit_success'),
            'failure_message' => lang('doctor:submit_failure'),
            'title' => lang('lang:doctor:new'),
         );
        
        $skips = array('dom_id');
        //entry_form($stream_slug, $namespace_slug, $mode = 'new', $entry_id = null, $view_override = false, $extra = array(), $skips = array(), $tabs = false, $hidden = array(), $defaults = array())
        $this->streams->cp->entry_form('doctors', 'doctor', 'new', null, true, $extra, $skips);
    }
    
    /**
     * Edit an entry using the entry_form function
     * to generate the edit form. We're passing the
     * id of the entry, which will allow entry_form to
     * repopulate the data from the database.
     *
     * @param   int [$id] The id of the FAQ to the be deleted.
     * @return	void
     */
    public function edit($id = 0)
    {
        $this->load->model('doctor_m');
        $extra = array(
            'return' => 'admin/doctor',
            'success_message' => lang('doctor:submit_success'),
            'failure_message' => lang('doctor:submit_failure'),
            'title' => 'lang:doctor:edit'
        );

        $skips = array(); // array('name'); //fields to skip
        $tabs = false; // array('A', 'B'); 
        $hidden = array('latitude', 'longitude'); 
        
        /** * Extra parameters to pass in $extra array: 
         * email_notifications 	- see docs for more explanation
	 * return				- URL to return to after submission, defaults to current URL.
	 * success_message		- Flash message to show after successful submission, defaults to generic successful entry submission message
	 * failure_message		- Flash message to show after failed submission, defaults to generic failed entry submission message
	 * required				- String to show as required - this defaults to the standard * for the PyroCMS CP
	 * title				- Title of the form header (if using view override)
	 * no_fields_message    - Custom message when there are no fields.
         * 
         * entry_form($stream_slug, $namespace_slug, $mode = 'new', $entry_id = null, $view_override = false, $extra = array(), $skips = array(), $tabs = false, $hidden = array(), $defaults = array())
         */         
        //option 1
         $this->streams->cp->entry_form('doctors', 'doctor', 'edit', $id, true, $extra, $skips, $tabs ); // original auto form
//          //option 2
//            $this->streams->cp->entry_form('doctors', 'doctor', 'edit', $id, false, $extra); // custom 
//        // Build the page, only if using custom view
//        $this->template
//                    ->title($this->module_details['name'], 'Edit')
//                    ->build('admin/form' );
        
    }

    /**
     * Delete an entry
     * 
     * @param   int [$id] The id of FAQ to be deleted
     * @return  void
     */
    public function delete($id = 0)
    {
        $this->streams->entries->delete_entry($id, 'doctors', 'doctor');
        $this->session->set_flashdata('error', lang('doctor:deleted'));
 
        redirect('admin/doctor/');
    }
    
    /** returns AJAX list of user IDs for name query
     * 
     * @param type $query
     */
    public function user_search($query) 
    {
        
    }

}