<?php $this->load->view('jour-doctor') ?> 

<div class="message_global">{{ data:msg_global }}</div>
<!--<div class="message_jour">{{ data:msg_dujour }}</div>-->
<?php  
    $show=$this->input->get('show');
    $show_am = strtolower($show)=='am' ? true : false ;
    $show_pm = strtolower($show)=='pm' ?  true : false ;
    $show_am_attr = '' ;
    $show_pm_attr = '' ; 
    ?> 

<div id="weekzone-wrapper" class="jour well">
    <div id="weekzone"> 
        <center class="h3">
            {{ jour }} {{journo}}  {{ helper:date format=" m Y" timestamp=jourdate }} 
            <!-- {{jourdate}} {{data:month_name}} {{data:year}}--> 
        </center>

        <center class="h3">
            Choisir votre horaire de RDV
        </center>

        <center class="h3">
            <button id="btn-am" class="btn btn-default <?= $show_am ? 'active' : '' ?>" onclick="periodShow('am')" type="button">Matin</button>
            <button id="btn-pm"class="btn btn-default <?= $show_pm ? 'active' : '' ?>" onclick="periodShow('pm')" type="button">Après midi</button>
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
                                $html .= $periods['dt'];
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
                                    $class .= ' has_appt';
                                    $appts_total += count($periods['appointment']);
                                    $html .= $this->calendar_m->html_caldots($periods['appointment']) ; 
                                } 
                                //output pre render                            
                                if($periods['break'] !== 'true' && !$break_passed) 
                                { 
                                    $html_pre_break .=  '<div class="col-xs-2 col-sm-1" ><button class="btn btn-default break-pre '.$class.'" onclick="setTime('.$periods['dt'].')">'.$html.'</button></div>' ; 
    //                                $html_pre_break .=  '<div class="panel panel-default break-pre '.$class.'"><div class="panel-body">'.$html.'</div></div>' ; 
                                } else if($periods['break'] !== 'true' && $break_passed) {
                                    $html_post_break .=  '<div class="col-xs-2 col-sm-1" ><button class="btn btn-default break-post'.$class.'" onclick="setTime('.$periods['dt'].')">'.$html.'</button></div>' ;
    //                                $html_post_break .=  '<div class="panel panel-default break-post'.$class.'"><div class="panel-body">'.$html.'</div></div>' ;
                                }
                                //final render 
                                //----------
                        }   
//                        echo'</ul>';
                        //post loop output
                        echo "<div class=\"period-am row center-block\" style=\"display:$show_am_attr;\" >$html_pre_break</div>" ; 
                        echo "<div class=\"period-pm row center-block\" style=\"display:$show_pm_attr;\" >$html_post_break</div>" ;
                        $appts_post_break = $appts_total - $appts_pre_break ;
                        echo $appts_pre_break>0 ? "$appts_pre_break RDV avant la pause <br/>" : '' ;
                        echo $appts_post_break>0 ? "$appts_post_break RDV après la pause <br/>" : '' ;
                        echo $appts_total >0 ? "$appts_total RDV au total" : '' ; 
            ?> 

        </div>

    </div>
  </div> 
 
<?php $this->load->view('jour-form') ?> 