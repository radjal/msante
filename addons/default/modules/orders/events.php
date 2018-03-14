<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Orders Events Class
 * 
 * @package        PyroCMS
 * @subpackage    Orders Module
 * @category    events
 * @author        Radja LOMAS radjal@free.fr
 * @website        http://radja.fr
 */
class Events_Orders {
    
    protected $ci;
    
    public function __construct()
    {
        $this->ci =& get_instance();
        
        //register the public_controller event
        Events::register('public_controller', array($this, 'run'));
		
		//register a second event that can be called any time.
		// To execute the "run" method below you would use: Events::trigger('orders_event');
		// in any php file within PyroCMS, even another module.
	//	Events::register('orders_event', array($this, 'run'));
    }
    
    public function run()
    {
        $this->ci->load->model('orders/orders_m');
        
        // we're fetching this data on each front-end load. You'd probably want to do something with it IRL
        $this->ci->orders_m->limit(5)->get_all();
    }
    
}
/* End of file events.php */