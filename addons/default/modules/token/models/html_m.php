<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a orders module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Orders Module
 */
class Html_m extends MY_Model {

	public function __construct()
	{		
		parent::__construct();
		
		$this->_table = 'tokens';
	}
        
        /**  HTML helpers */
        public function _form_input_wrap($name, $content, $label=false)
        {
                $label = !$label ? lang("token:$name") : $label;
                $html = '<div class="input">';
                $html .= '<label for="'.$name.'">'.$label.'</label>';
                return $html.$content.'</div>' ;
        }
        
        
        /** create table header for field with vars for search and sort
         * 
         * @param string $fieldname
         * @param string $title
         * @return string HTML code
         */
        public function table_header($fieldname, $title=false, $url=false)
        {
            $sortfield = $fieldname ;
            $gvars = $this->input->get();
            $gvars['sortdir'] = isset($gvars['sortdir']) && $gvars['sortdir'] == 'desc' ? 'asc' : 'desc';
            $gvars['sort'] = $sortfield ;
            $url = !$url ? site_url().uri_string().'?'.http_build_query($gvars) : $url;
            $html ='<th>';
            $html .= '<a href="'.$url.'">';
            $html .= !$title ? lang('token:'.$fieldname) : $title;
            $html .= '</a>';
            $html .= '</th>';
            return $html;
        }
        
        public function form_input($name, $value='', $extra='', $label=false)
        {
            $label = !$label ? lang("token:$name") : $label;
                $html = '<div class="input">';
                $html .= '<label for="'.$name.'">'.$label.'</label>';
                $html .= form_input($name, set_value($name, $value), $extra);
                $html .= '</div>';
                    
                return $html;
        }
}
