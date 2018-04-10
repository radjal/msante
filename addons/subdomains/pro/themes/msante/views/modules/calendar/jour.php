<!--CALENDAR PRO-->                <!-- appointments --> 
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
//                                $html .= !$appts_pre_break&&$appts_total>0?"<br/>$appts_total&nbsp;RDV avant la pause":'';
                            $appts_pre_break = $appts_total;

                        }
                        if(isset($periods['appointment']) && count($periods['appointment'])>0 )
                        {   
                            $class .= ' has_appt disabled';
                            $appts_total += count($periods['appointment']);
//                            $html .= $this->calendar_m->html_caldots($periods['appointment']) ;  
                            //loop through appointments for period, normally there is only one appointment per period, but just in case
                            foreach ( $periods['appointment'] as $aKey => $aVal ) {
                                $html .= ' '.$periods['appointment'][$aKey]['first_name'] ;  
                                $html .= ' '.$periods['appointment'][$aKey]['last_name'] ; 
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
                }    
                //post loop output
                echo "<div class=\"period-am row center-block\"><center class=\"h5\">Matin</center>$html_pre_break</div>" ; 
                echo "<div class=\"period-pm row center-block\"><center class=\"h5\">Après midi</center>$html_post_break</div>" ;
                $appts_post_break = $appts_total - $appts_pre_break ;
                echo $appts_pre_break>0 ? "$appts_pre_break RDV avant la pause <br/>" : '' ;
                echo $appts_post_break>0 ? "$appts_post_break RDV après la pause <br/>" : '' ;
                echo $appts_total >0 ? "$appts_total RDV au total" : '' ;  
    ?> 

    {{#-------------------------------------------------------------------------------------#}}
    {{if  {msante:pro_has_setting name="appointements"} }}



                    </div>
                  </div>
                </div>  
    {{endif}}
</div>
   