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
		
		/**
		 * If the orders module's table was named "orderss"
		 * then MY_Model would find it automatically. Since
		 * I named it "orders" then we just set the name here.
		 */
		$this->_table = 'orders_list';
	}
        
        /**  HTML helpers */
                        
        public function _form_input_wrap($name, $content, $label=false)
        {
                $label = !$label ? lang("orders:$name") : $label;
                $html = '<div class="input">';
                $html .= '<label for="'.$name.'">'.$label.'</label>';
                return $html.$content.'</div>' ;
        }
        
        public function form_sort_fields_dropdown()
        {   
            $sortdir = empty($this->input->get('sortdir')) ? 'id' : $this->input->get('sortdir') ;
            $sort = empty($this->input->get('sort')) ? 'desc' : $this->input->get('sort') ;
            $html = '';
            
            $fields = $this->input->get();
            unset($fields['searchBtn']);
            unset($fields['sortdir']);
            unset($fields['sort']);
            unset($fields['view']);
                 if(count($fields) > 0 )  
                 {
                    foreach ($fields as $field => $value) {
                        $log[$field]=$value;
                        $options[$field] = $field;
                    } 
                 } else {
                     return;
                 }
                    $html .= form_dropdown('sort', $options , $sort);
                    $html .= form_dropdown('sortdir', array('asc' => 'asc', 'desc' => 'desc') , $sortdir);
                
                return $html ;
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
            $html .= !$title ? lang('orders:'.$fieldname) : $title;
            $html .= '</a>';
            $html .= '</th>';
            return $html;
        }
        
        public function table_header_last_old($fieldname, $title=false, $url=false)
        {
            $sortdir = !empty($this->input->get('sortdir')) ? $this->input->get('sortdir') : "desc" ;
            $url = !$url ? site_url().uri_string() : $url ;
            $url = $url.'?sort='.$fieldname ;
            $url .= $sortdir=='desc' ? '&sortdir=asc' : '&sortdir=desc' ;
            
            $html ='<th>';
            $html .= '<a href="'.$url.'">';
            $html .= !$title ? lang('orders:'.$fieldname) : $title;
            $html .= '</a>';
            $html .= '</th>';
            return $html;
            
        }        

        public function table_header_old($fieldname, $link=false)
        {
            $sortdir = !empty($this->input->get('sortdir')) ? $this->input->get('sortdir') : "desc" ;
            $url = !$link ? site_url().uri_string().'?sort='.$fieldname : $link ;
            $url .= $sortdir=='desc' ? '&sortdir=asc' : '&sortdir=desc' ;
            
            $html ='<th>';
            if($link!=='') $html .= '<a href="'.$url.'">';
            $html .= lang('orders:'.$fieldname);
            if($link!=='') $html .= '</a>';
            $html .= '</th>';
            return $html;
            
        }
        
        public function form_delivery_date($value='', $extra='')
        {
            $html ='';
            // form select
            $html .= '<div id="order-customised-datepicker">'."\n";
            $html .= '<label for="delivery_date">'.lang("orders:delivery_date").'</label>';
            $html .= form_input('delivery_date', $value, $extra);   
            $html .= '<p id="delivery-times"></p>'."\n";     
            $html .= '</div>'."\n";
            // datepicker constraint
            $html .= '<script type="text/javascript">'."\n"; 
            $html .= '$( document ).ready(function() {'."\n"; 
            $html .= "if(typeof show_day === 'undefined') var show_day = [];\n";
            $html .= "if(typeof hours_day === 'undefined') var hours_day = [];\n";
            $html .= "if(typeof name_day === 'undefined') var name_day = [];\n";
            $html .= "if(typeof off_period === 'undefined') var off_period = {};\n";
            $html .= "\n";
            $html .= "//defaults \n";
            $html .= "show_day[0] = false;\n";
            $html .= "show_day[1] = false;\n";
            $html .= "show_day[2] = false;\n";
            $html .= "show_day[3] = false;\n";
            $html .= "show_day[4] = false;\n";
            $html .= "show_day[5] = false;\n";
            $html .= "show_day[6] = false;\n";
            
            
            //prepare hours
            $hoursday[1] = addslashes($this->settings->hours_weekday1) ; //monday
            $hoursday[2] = addslashes($this->settings->hours_weekday2) ; 
            $hoursday[3] = addslashes($this->settings->hours_weekday3) ; 
            $hoursday[4] = addslashes($this->settings->hours_weekday4) ; 
            $hoursday[5] = addslashes($this->settings->hours_weekday5) ; 
            $hoursday[6] = addslashes($this->settings->hours_weekday6) ; 
            $hoursday[0] = addslashes($this->settings->hours_weekday0) ; //sun
            
            //prepare day names
            $dayname[1] = lang('orders:weekday1') ; //monday
            $dayname[2] = lang('orders:weekday2') ; 
            $dayname[3] = lang('orders:weekday3') ; 
            $dayname[4] = lang('orders:weekday4') ; 
            $dayname[5] = lang('orders:weekday5') ; 
            $dayname[6] = lang('orders:weekday6') ; 
            $dayname[0] = lang('orders:weekday0') ; //sun
            
            $days = explode(',', $this->settings->delivery_days);
            $html .= "// printout days and hours \n";
            foreach ($days as $day) {
                $html .= "show_day[$day] = $day;\n";
                $html .= "hours_day[$day] = '$hoursday[$day]';\n";
                $html .= "name_day[$day] = '$dayname[$day]';\n";
                $html .= "\n";
            }
            
            // closed
            $offperiod  = $this->settings->off_period;
            if(!empty($off_period)) 
            {
                $off_p = explode('|', $this->settings->off_period) ;
                $html .= "off_period.start = '".$off_p[0]."';\n";
                $html .= "off_period.end = '".$off_p[1]."';\n";
            }
                    
            // update datepicker
            $html .= "change_datepicker(show_day, off_period);\n";
            
            // populate hours
            $html .= '$("#delivery-times").append("<ol>")'."\n";
            $html .= 'for (var dayid in hours_day) {'."\n";
            $html .= '  $("#delivery-times").append("<li>"+name_day[dayid]+": "+hours_day[dayid]+"</li>")'."\n";
            $html .= '}'."\n";
            $html .= '$("#delivery-times").append("</ol>")'."\n";
            $html .= "});\n</script>\n";
                                      
            return $html ;
        }
        
        public function form_input($name, $value='', $extra='', $label=false)
        {
            $label = !$label ? lang("orders:$name") : $label;
                $html = '<div class="input">';
                $html .= '<label for="'.$name.'">'.$label.'</label>';
                $html .= form_input($name, set_value($name, $value), $extra);
                $html .= '</div>';
                    
                return $html;
        }
        
        public function form_dropdown_order_status($selected=array(), $extra='')
	{
                $options[''] = lang('orders:status_none') ;                                
                $options['prep'] = lang('orders:status_prep') ;                                
                $options['delivery'] = lang('orders:status_delivery') ;                                
                $options['delivered'] = lang('orders:status_delivered') ;                                
                $options['waiting'] = lang('orders:status_waiting') ;                                
                $options['waiting_pay'] = lang('orders:status_waiting_pay') ;                                
                $options['waiting_treatment'] = lang('orders:status_waiting_treatment') ;                                
                $options['cancelled'] = lang('orders:status_cancelled') ;                                
                $options['cancelled_by_user'] = lang('orders:status_cancelled_by_user') ;                                
				
            return form_dropdown('order_status', $options, $selected, $extra) ;
        }
        
        public function form_radio_payment_status($selected, $extra='')
        {
                $html  = form_radio('payment_status', 'waiting', $selected == 'waiting', $extra);
                $html .= lang('orders:po_stat_waiting');
                    $html .= form_radio('payment_status', 'paid', $selected == 'paid', $extra);
                    $html .= lang('orders:po_stat_paid');
                        $html .= form_radio('payment_status', 'error', $selected == 'error', $extra);
                        $html .= lang('orders:po_stat_error');
                return $html ;
        }
        
        public function form_radio_payment_type($selected, $extra='')
        {
            $html = '';
//                $html .=form_radio('payment_type', 'transfer', $selected == 'transfer', $extra); 
//                $html .=lang('orders:po_transfer');
                    $html .=form_radio('payment_type', 'cc', $selected == 'cc', $extra); 
                    $html .=lang('orders:po_cc');
                        $html .=form_radio('payment_type', 'cheque', $selected == 'cheque', $extra); 
                        $html .=lang('orders:po_cheque');
                            $html .=form_radio('payment_type', 'cash', $selected == 'cash', $extra); 
                            $html .=lang('orders:po_cash');
                                $html .=form_radio('payment_type', 'meal_coupon', $selected == 'meal_coupon', $extra); 
                                $html .=lang('orders:po_meal_coupon');
//                            $html .=form_radio('payment_type', 'delivery', $selected == 'delivery', $extra); 
//                            $html .=lang('orders:po_delivery');
                return $html ;
        }
        
        
        
}
