<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Appointments Events Class
 * 
 * @package        PyroCMS
 * @subpackage    Appointments Module
 * @category    events
 * @author        Radja LOMAS radjal@free.fr
 * @website        http://radja.fr
 */
class Events_Appointments {
    
    protected $ci;
    
    public function __construct()
    {
        $this->ci =& get_instance();
        
        //register the public_controller event
        Events::register('public_controller', array($this, 'run'));
		
		//register a second event that can be called any time.
		// To execute the "run" method below you would use: Events::trigger('appointments_event');
		// in any php file within PyroCMS, even another module.
	//	Events::register('appointments_event', array($this, 'run'));
    }
    
    public function run()
    {
        $this->ci->load->model('appointments/appointments_m');
        
        // we're fetching this data on each front-end load. You'd probably want to do something with it IRL
        $this->ci->appointments_m->limit(5)->get_all();
    }
    
}
/* End of file events.php */