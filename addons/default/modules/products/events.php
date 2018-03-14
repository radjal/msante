<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Products Events Class
 * 
 * @package        PyroCMS
 * @subpackage    Products Module
 * @category    events
 * @author        Radja LOMAS radjal@free.fr
 * @website        http://radja.fr
 */
class Events_Products {
    
    protected $ci;
    
    public function __construct()
    {
        $this->ci =& get_instance();
        
        //register the public_controller event
        Events::register('public_controller', array($this, 'run'));
		
		//register a second event that can be called any time.
		// To execute the "run" method below you would use: Events::trigger('products_event');
		// in any php file within PyroCMS, even another module.
		Events::register('products_event', array($this, 'run'));
    }
    
    public function run()
    {
        $this->ci->load->model('products/products_m');
        
        // we're fetching this data on each front-end load. You'd probably want to do something with it IRL
        $this->ci->products_m->limit(5)->get_all();
    }
    
}
/* End of file events.php */