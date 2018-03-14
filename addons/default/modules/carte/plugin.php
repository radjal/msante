<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a carte module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	carte Module
 */
class Plugin_Carte extends Plugin
{        

	/**
	 * JS as JSON string
	 * Usage:
	 * 
	 * {{ carte:js encode='oneline' }} json or oneline(escaped)
	 *
	 * @return	array
	 */
	function js()
	{
		        
                $encode = strtolower($this->attribute('encode'));
		
		return $this->carte_m->getfile('js/carte.js', $encode);
	}
        
	/**
	 * CSS as JSON string
	 * Usage:
	 * 
	 * {{ carte:css encode='oneline' }} json or oneline(escaped)
	 *
	 * @return	array
	 */
	function css()
	{        
                $encode = strtolower($this->attribute('encode'));
		
		return $this->carte_m->getfile('css/carte.css', $encode);
	}
        
    
	function cartelist()
	{      
			$html = '';
            $html .= '<script type="text/javascript">' ;
            $html .= $this->carte_m->getfile("js/cartes.js" );

            $html .= '</script>' ;
            return $html;   
	}

}

/* End of file plugin.php */