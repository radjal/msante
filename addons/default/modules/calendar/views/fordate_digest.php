{{ custom:disable_theme_if_ajax }}
<?php    
//morning or afternoon
$show = !empty($this->uri->segment(5)) ? $this->uri->segment(5) : false; 
//$show=$this->input->get('show');
$show_am = strtolower($show)=='am' ? true : false ;
$show_pm = strtolower($show)=='pm' ?  true : false ;
//style display attribute
$show_am_attr = $show_am && !$show_pm ? 'block' : 'none' ; 
$show_pm_attr =   !$show_am && $show_pm ? 'block' : 'none' ;  
$appts_total = 0 ; $appts_pre_break = $appts_post_break = false;
$html_pre_break = $html_post_break = ''; 
//loop periods
$break_passed =false;
foreach ($appointments as $periods ) 
{   
        $html = $class = ''; 
        $html .= substr($periods['dt'], 0, 2) .':'. substr($periods['dt'], 2 ) ; // format time presentation 
        if($periods['break'] == 'true')
        {
            $break_passed = true;
            $html .= ' En pause';
            $class .= 'pause '; 
            $appts_pre_break = $appts_total; 
        }
        if(isset($periods['appointment']) && count($periods['appointment'])>0 )
        {   
            $class .= ' has_appt disabled';
            $appts_total += count($periods['appointment']);
//            $html .= $this->calendar_m->html_caldots($periods['appointment']) ; 
        } 
        //output pre render                            
//        if($periods['break'] !== 'true' && !$break_passed) 
//        { 
//            $html_pre_break .=   '<div class="col-xs-4 cols-sm-1" >'
//                            . '<button class="break-pre btn btn-default '.$class.'" onclick="setTime('.$periods['dt'].');$(\'.calendar-jour button\').removeClass(\'active\');$(this).addClass(\'active\');">'.$html.'</button>'
//                            . '</div>';   
//        } else if($periods['break'] !== 'true' && $break_passed) {
//            $html_post_break .=  '<div class="col-xs-4 cols-sm-1" ><button class="break-post btn btn-default '.$class.'" onclick="setTime('.$periods['dt'].');$(\'.calendar-jour button\').removeClass(\'active\');$(this).addClass(\'active\');">'.$html.'</button></div>' ; 
//        }
        //final render 
        //----------
}    
//post loop output
//echo "<div class=\"period-am row center-block\"><center class=\"h5\">Matin</center>$html_pre_break</div>" ; 
//echo "<div class=\"period-pm row center-block\"><center class=\"h5\">Après midi</center>$html_post_break</div>" ;
$appts_post_break = $appts_total - $appts_pre_break ;
echo $appts_pre_break>0 ? "$appts_pre_break RDV avant la pause <br/>" : '' ;
echo $appts_post_break>0 ? "$appts_post_break RDV après la pause <br/>" : '' ;
echo $appts_total >0 ? "$appts_total RDV au total" : 'Pas de RDV pour ce jour' ;  
