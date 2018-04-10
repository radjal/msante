{{ custom:disable_theme_if_ajax }} 

<?php 
$appts_total = 0 ; $appts_pre_break = $appts_post_break = false;
$html_pre_break = $html_post_break = '';
$pre_break_1st_time = $pre_break_last_time = $post_break_1st_time = $post_break_last_time = false ;
$last_period_start = $last_period_end = $fdt = $fdtEnd = false ;

$break_passed =false;
foreach ($appointments as $periods ) 
{   
        $html = $class = ''; 
        $html .=  $this->appointments_m->timestr_format($periods['dt'])  ; // format time presentation 
        if($periods['break'] == 'true')
        {
            $break_passed = true;
            $html .= ' En pause';
            $class .= 'pause ';
            $appts_pre_break = $appts_total;

        } 
        // if has appointments
        if(isset($periods['appointment']) && count($periods['appointment'])>0 )
        {   
            $fdt = $this->appointments_m->timestr_format($periods['dt']);
            $fdtEnd = $this->appointments_m->timestr_format($periods['end']);  
            $class .= ' has_appt disabled';
            $appts_total += count($periods['appointment']);
            //1st time
                if(!$break_passed && $pre_break_1st_time  == false) 
                {
                    $pre_break_1st_time = $fdt ; 
                } else { $pre_break_1st_time ; }
                if( $break_passed && $post_break_1st_time  == false ) 
                {
                    $post_break_1st_time =  $fdt ; 
                } else { $post_break_1st_time ; }

            //last time
                if(!$break_passed ) 
                { 
                    $pre_break_last_time = $fdtEnd;  
                } else { $pre_break_last_time ; }
                if( $break_passed  ) 
                {
                    $post_break_last_time = $fdtEnd ;  
                } else { $post_break_last_time ; } 
            $html .= " ";
            //loop through appointments for period, normally there is only one appointment per period, but just in case
            foreach ( $periods['appointment'] as $aKey => $aVal ) {
                $html .= ' '.$periods['appointment'][$aKey]['first_name'] ;  
                $html .= ' '.$periods['appointment'][$aKey]['last_name'] ; 
                $html .= '<a href="/appointments/view/'.$periods['appointment'][$aKey]['id'] ;  
                $html .= '"> <i class="glyphicon glyphicon-eye-open"></i> '.$periods['appointment'][$aKey]['id'] ; 
                $html .= '</a>' ; 
            }
        } 
        //output pre render                            
        if($periods['break'] !== 'true' && !$break_passed) 
        { 
            $html_pre_break .=   '<div class="" >'
                            . '<p class="break-pre '.$class.'">'.$html.'</p>'
                            . '</div>';   
        } else if($periods['break'] !== 'true' && $break_passed) {
            $html_post_break .=  '<div class="" ><p class="break-post '.$class.'">'.$html.'</p></div>' ; 
        }
        //final render 
        //----------

        $last_period_start =$fdt ;
        $last_period_end = $fdtEnd ;
}    
//post loop output

$appts_post_break = $appts_total - $appts_pre_break ;
echo '<span>'; 
echo $appts_total >0 ? "$appts_total RDV au total" : 'Pas de RDV pour ce jour' ;  
echo '</span>'; 
echo '<br/>'; 

echo $appts_pre_break>0 ? "$appts_pre_break RDV   " : '' ;
echo  $pre_break_1st_time ?  "RDV avant pause de $pre_break_1st_time " : '' ;
echo  $pre_break_last_time ?  "à $pre_break_last_time <br/>" : '' ;
  

echo $appts_post_break>0 ? "$appts_post_break  " : '' ;
echo  $post_break_1st_time ?  "RDV après pause de $post_break_1st_time " : '' ;
echo  $post_break_last_time ?  "à $post_break_last_time <br/>" : '' ;
 
//echo $appts_post_break>0 ? "$appts_post_break RDV après la pause <br/>" : '' ;
//echo $appts_total >0 ? "$appts_total RDV au total" : '' ;  




//$appts_post_break = $appts_total - $appts_pre_break ;
//echo $appts_pre_break>0 ? "$appts_pre_break RDV avant la pause <br/>" : '' ;
//echo $appts_post_break>0 ? "$appts_post_break RDV après la pause <br/>" : '' ;
//echo $appts_total >0 ? "$appts_total RDV au total" : 'Pas de RDV pour ce jour' ;  

?>  

