<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * This is a products module for PyroCMS
 *
 * @author 		Radja LOMAS radjal@free.fr
 * @website		http://radja.fr
 * @package 	PyroCMS
 * @subpackage 	Products Module
 */
class Html_m extends MY_Model 
{
	public function __construct()
	{		
		parent::__construct();
	}
	
        /** HTML helpers */
        
        public function _form_input_wrap($name, $content, $label=false)
        {
                $label = !$label ? lang("products:$name") : $label;
                $html = '<div class="input">';
                $html .= '<label for="'.$name.'">'.$label.'</label>';
                return $html.$content.'</div>' ;
        }
        
        public function form_radio_units($unit, $extra='', $label=false)
        {
                $html = '<ul><li>' ;  
                $html .= form_radio('unit', 'kg', $unit == 'kg', $extra) ;  
                $html .= lang('products:unit_kg');
                $html .= '</li><li>' ;  
                $html .= form_radio('unit', '100g', $unit == '100g', $extra) ;  
                $html .= lang('products:unit_100g');
                $html .= '</li><li>' ;  
                $html .= form_radio('unit', 'unitary', $unit == 'unitary', $extra) ;  
                $html .= lang('products:unit_unitary');
                $html .= '</li><li>' ;  
                $html .= form_radio('unit', 'litre', $unit == 'litre', $extra) ;  
                $html .= lang('products:unit_litre'); 
                $html .= '</li></ul>' ; 
                return $this->_form_input_wrap('unit', $html, $label);
        }

        public function form_radio_active($value, $extra='', $label=false)
        {
                $html = '<ul><li>' ;  
                $html .= form_radio('active', '1', $value == '1', $extra) ;  
                $html .= lang('products:active_1');
                $html .= '</li><li>' ;  
                $html .= form_radio('active', '0', $value == '0', $extra) ;  
                $html .= lang('products:active_0');
                $html .= '</li></ul>' ; 
                return $this->_form_input_wrap('active', $html, $label);
        }
        
        /** create multiple selection select input populated with categories
         * 
         * @param array $selected category ids
         * @param string $extra attributes string
         * @return string HTML code
         */
        public function form_dropdown_catid($selected=array(), $extra='', $label=false)
        {
            $extra .= ' multiple'; // multiple selection allowed
                $options = $this->products_categories_m->category_ids();
                if(is_array($selected)) $selected = implode ("\r\n", $selected);
                $selected = explode("\r\n", $selected); // multiple selection
                $html = form_dropdown('cat_id[]', $options, $selected, $extra);
                return $this->_form_input_wrap('cat_id', $html, $label);
        }
        
        /** DEPRECATED 
         * 
         * @param type $selected
         * @param type $extra
         * @return type
         */
        public function form_dropdown_parent_cid($selected=array(), $extra='')
        {
                $options = $this->products_categories_m->category_ids();
                $options['0'] = '__';                        
                ksort($options);
                return form_dropdown('parent_cid', $options, $selected, $extra) ;
        }

        public function form_input($name, $value='', $extra='', $label=false)
        {
                $html = form_input($name, set_value($name, $value), $extra);
                
                return $this->_form_input_wrap($name, $html, $label);  
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
            $html .= !$title ? lang('products:'.$fieldname) : $title;
            $html .= '</a>';
            $html .= '</th>';
            return $html;
        }
}
