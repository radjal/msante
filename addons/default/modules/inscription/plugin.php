<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a inscription module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	inscription Module
 */
class Plugin_Inscription extends Plugin
{        

	/**
	 * JS as JSON string
	 * Usage:
	 * 
	 * {{ inscription:js encode='oneline' }} json or oneline(escaped)
	 *
	 * @return	array
	 */
	function js()
	{
		        
                $encode = strtolower($this->attribute('encode'));
		
		return $this->inscription_m->getfile('js/inscription.js', $encode);
	}
        
	/**
	 * CSS as JSON string
	 * Usage:
	 * 
	 * {{ inscription:css encode='oneline' }} json or oneline(escaped)
	 *
	 * @return	array
	 */
	function css()
	{        
                $encode = strtolower($this->attribute('encode'));
		
		return $this->inscription_m->getfile('css/inscription.css', $encode);
	}
        
	function inscriptionlist()
	{      
			$html = '';
            $html .= '<script type="text/javascript">' ;
            $html .= $this->inscription_m->getfile("js/inscriptions.js" );

            $html .= '</script>' ;
            return $html;   
	}

}

/* End of file plugin.php */