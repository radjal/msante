<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a calendar module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	calendar Module
 */
class Plugin_Calendar extends Plugin
{        

	/**
	 * JS as JSON string
	 * Usage:
	 * 
	 * {{ calendar:js encode='oneline' }} json or oneline(escaped)
	 *
	 * @return	array
	 */
	function js()
	{
		        
                $encode = strtolower($this->attribute('encode'));
		
		return $this->calendar_m->getfile('js/calendar.js', $encode);
	}
        
	/**
	 * CSS as JSON string
	 * Usage:
	 * 
	 * {{ calendar:css encode='oneline' }} json or oneline(escaped)
	 *
	 * @return	array
	 */
	function css()
	{        
                $encode = strtolower($this->attribute('encode'));
		
		return $this->calendar_m->getfile('css/calendar.css', $encode);
	}
        
    
	function calendarlist()
	{      
			$html = '';
            $html .= '<script type="text/javascript">' ;
            $html .= $this->calendar_m->getfile("js/calendars.js" );

            $html .= '</script>' ;
            return $html;   
	}

}

/* End of file plugin.php */