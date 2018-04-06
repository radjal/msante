<?php   
if($doctor_id>0) $this->load->view('jour-doctor') ;
//morning or afternoon
$show = !empty($this->uri->segment(5)) ? $this->uri->segment(5) : false; 
//$show=$this->input->get('show');
$show_am = strtolower($show)=='am' ? true : false ;
$show_pm = strtolower($show)=='pm' ?  true : false ;
//style display attribute
$show_am_attr = $show_am && !$show_pm ? 'block' : 'none' ; 
$show_pm_attr =   !$show_am && $show_pm ? 'block' : 'none' ; 
?> 
<div class="message_global">{{ data:msg_global }}</div>
<!--<div class="message_jour">{{ data:msg_dujour }}</div>-->

<center class="h3 alert alert-success"> <i class="glyphicon glyphicon-calendar"></i>
    {{jour}} {{journo}} {{mois_nom}}  {{data:year}}
    {{# helper:date format="m Y" timestamp=jourdate #}} 
    <!--  {{ jour }} {{journo}}  {{jourdate}} {{data:month_name}} {{data:year}}--> 
</center>
{{if datenumero <= data:today_number }}
<h3 class="alert alert-danger text-center">
    Cette date est passée
</h3>
{{else}}
<div id="weekday-wrapper" class="jour ">
    <div id="weekday"> 

        <center class="h3">
            Choisir votre horaire de RDV
        </center>

        <center class="h3">
            <button id="btn-am" class="btn btn-default <?= $show_am ? 'active' : '' ?>" onclick="periodShow('am')" type="button">
                Matin
            </button>
            <button id="btn-pm"class="btn btn-default <?= $show_pm ? 'active' : '' ?>" onclick="periodShow('pm')" type="button">
                Après midi
            </button>
        </center>

        <div class="calendar-jour {{ if passe }}date-passed {{ endif }}">  
            <?php
//            $no_periods = count($appointments); 
//            $x = round($no_periods/3, 0)  ;
            $appts_total = 0 ; $appts_pre_break = $appts_post_break = false;
            $html_pre_break = $html_post_break = '';

    //                        echo'<ul>'; 
                        //loop periods
                        $break_passed =false;
                        foreach ($appointments as $periods ) 
                        {   
                                $html = $class = ''; 
                                $html .= substr($periods['dt'], 0, 2) .':'. substr($periods['dt'], 2 ) ; // format time presentation
//                                $html .= $periods['dt']; // 4 digit time
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
                                    $html .= $this->calendar_m->html_caldots($periods['appointment']) ; 
                                } 
                                //output pre render                            
                                if($periods['break'] !== 'true' && !$break_passed) 
                                { 
                                    $html_pre_break .=   '<div class="col-xs-4 cols-sm-1" >'
                                                    . '<button class="break-pre btn btn-default '.$class.'" onclick="setTime('.$periods['dt'].');$(\'.calendar-jour button\').removeClass(\'active\');$(this).addClass(\'active\');">'.$html.'</button>'
                                            . '</div>';   
                                } else if($periods['break'] !== 'true' && $break_passed) {
                                    $html_post_break .=  '<div class="col-xs-4 cols-sm-1" ><button class="break-post btn btn-default '.$class.'" onclick="setTime('.$periods['dt'].');$(\'.calendar-jour button\').removeClass(\'active\');$(this).addClass(\'active\');">'.$html.'</button></div>' ; 
                                }
                                //final render 
                                //----------
                        }   
//                        echo'</ul>';
                        //post loop output
                        echo "<div class=\"period-am row center-block\" style=\"display:$show_am_attr;\" ><center class=\"h5\">Matin</center>$html_pre_break</div>" ; 
                        echo "<div class=\"period-pm row center-block\" style=\"display:$show_pm_attr;\" ><center class=\"h5\">Après midi</center>$html_post_break</div>" ;
                        $appts_post_break = $appts_total - $appts_pre_break ;
                        echo '<!-- ';
                        echo $appts_pre_break>0 ? "$appts_pre_break RDV avant la pause <br/>" : '' ;
                        echo $appts_post_break>0 ? "$appts_post_break RDV après la pause <br/>" : '' ;
                        echo $appts_total >0 ? "$appts_total RDV au total" : '' ; 
                        echo ' --> ';
            ?> 

        </div>

    </div>
  </div> 
 
<?php $this->load->view('jour-form') ?> 

{{endif}}