<!--CALENDAR PRO-->  
{{if user:not_logged_in }}
            {{ url:redirect to="users/login" }}
{{else}}  
<!-- appointments --> 
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a data-toggle="collapse" data-parent="#pro-home" href="#collapse1">Mes RDV</a>
                    </h4>
                  </div>
                  <div id="collapse1" class="panel-collapse collapse in">
                    <div class="panel-body">
                        <center class="h3 "> <i class="glyphicon glyphicon-calendar"></i>
                            {{jour}} {{journo}} {{mois_nom}}  {{data:year}} 
                        </center> 
<div class="panel-group calendar-jour {{ if passe }}date-passed {{ endif }}">  
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
//                                $html .= !$appts_pre_break&&$appts_total>0?"<br/>$appts_total&nbsp;RDV avant la pause":'';
                            $appts_pre_break = $appts_total;

                        }
                        // if has appointments
                        if(isset($periods['appointment']) && count($periods['appointment'])>0 )
                        {   
                            $fdt = $this->appointments_m->timestr_format($periods['dt']);
                            $fdtEnd = $this->appointments_m->timestr_format($periods['end']); 
//                            $last_period_end = $this->appointments_m->timestr_format($periods['dt']) ;
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
                                    $html .= " $fdtEnd";
                                } else { $pre_break_last_time ; }
                                if( $break_passed  ) 
                                {
                                    $post_break_last_time = $fdtEnd ; 
                                    $html .=  " $fdtEnd";
                                } else { $post_break_last_time ; }
                                
//                            $html .= $this->calendar_m->html_caldots($periods['appointment']) ;  
                            $html .= " ";
                            //loop through appointments for period, normally there is only one appointment per period, but just in case
                            foreach ( $periods['appointment'] as $aKey => $aVal ) 
                            {
                                        $html .= '<a href="/appointments/view/'.$periods['appointment'][$aKey]['id'] ;  
                                        $html .= '"> &bullet; '; 
                                        $html .= '</a>' ; 
                                        $html .= ' '.$periods['appointment'][$aKey]['first_name'] ;  
                                        $html .= ' '.$periods['appointment'][$aKey]['last_name'] ; 
                            }
                            
                        $html .= "<div style=\"display: inline-block;float:right\"><i class=\"glyphicon glyphicon-eye-open\"></i> </div>"; // for icons
                        } 
                        //output pre render   
                        if($periods['break'] !== 'true' && !$break_passed) 
                        { 
                            $html_pre_break .=   '<div class="Xrow" >'
                                            . '<div class=" break-pre'.$class.'">'.$html.'</div>'
                                            . '</div>';   
                        } else if($periods['break'] !== 'true' && $break_passed) {
                            $html_post_break .=  '<div class="Xrow" ><div class=" break-post '.$class.'">'.$html.'</div></div>' ; 
                        }
                        //final render 
                        //----------
                        
                        $last_period_start =$fdt ;
                        $last_period_end = $fdtEnd ;
                }    
                //post loop output
                echo "<div class=\"period-am row center-block\"><center class=\"h4\">Matin</center>$html_pre_break</div>" ; 
                echo "<div class=\"period-pm row center-block\"><center class=\"h4\">Après midi</center>$html_post_break</div>" ;
                echo '<p class="alert alert-info">';
                    $appts_post_break = $appts_total - $appts_pre_break ;
                    echo $appts_pre_break>0 ? "$appts_pre_break " : '' ;

                    echo  $pre_break_1st_time ?  "RDV avant la pause de $pre_break_1st_time " : '' ;
                    echo  $pre_break_last_time ?  "à $pre_break_last_time <br/>" : '' ;


    //                echo   " last_period_start $last_period_start =  last_period_end $last_period_end  <br>";


                    echo $appts_post_break>0 ? "$appts_post_break " : '' ;
                    echo  $post_break_1st_time ?  "RDV après la pause de $post_break_1st_time " : '' ;
                    echo  $post_break_last_time ?  "à $post_break_last_time <br/>" : '' ;


                    echo $appts_total >0 ? "$appts_total RDV au total" : '' ;  
                    echo $appts_total <=0 ? "Aucun RDV" : '' ;  
                    
                echo '</p>';
    ?> 

    {{#-------------------------------------------------------------------------------------#}}
    {{if  {msante:pro_has_setting name="appointements"} }}



                    </div>
                  </div>
                </div>  
    {{endif}}
</div>
{{endif}}