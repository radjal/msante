<div id="message-sante">
    	{{ variables:message_sante }}
</div> 
<?php $this->load->view('doctor') ?> 
<div class="post calendarsemaine">
        <div class="message_global">{{ data:msg_global }}</div>


<div id="weekzone-wrapper">
    <div id="weekzone" class="{{ data:dayscount }}-days {{ data:days_oddeven }}" data-nodays="{{ data:dayscount }}" data-oddeven="{{ data:days_oddeven }}">
        
        <center class="calendar-semaine-titre h1">
            Semaine {{ data:week }} 
            <a class="btn btn-default next-week" href="{{ url:site }}calendar/week/{{ data:next_week_no }}/{{url:segments segment="4"}}"> 
                <i class="glyphicon glyphicon-calendar"></i> semaine suivante<i class="glyphicon glyphicon-chevron-right"></i></a>
        </center>
        <center class="calendar-semaine-dates h2">Du {{helper:date timestamp=week_begin format="%A %e %b %Y" }} au {{helper:date timestamp=week_finish format="%A %e %b %Y" }}</center>
		 <?php 
                 $days = array(1=>'lundi',2=>'mardi',3=>'mercredi',4=>'jeudi',5=>'vendredi',6=>'samedi',7=>'dimanche');
                 for($d=1;$d<=7;$d++): 
                    $day = $days[$d]; 
                    $calendar_titre=$data['week_dates_iso'][$d]['dayname'].' '.$data['week_dates_iso'][$d]['day'] ;
                    ?>
			<div class="calendar {{ if data:today_no_iso > 1 }}date-passed {{ endif }}">
                                <a href="{{url:site}}calendar/day/<?= $data['week_dates_iso'][$d]['dayname'].'/'.$data['week'] ?>/">
                                    <div class="calendar_titre"><?= $calendar_titre ?></div>
                                </a> 
                                    <div class="calendar-day">  
                                            <?php 
                                            $appts_total = 0 ; $appts_pre_break = $appts_post_break = false;
                                            $prds_count = $prds_pre_break = $prds_post_break = 0;
                                            foreach ($appointments[$day.'_joined'] as $periods ) 
                                            {   
        //                                        echo $periods['break']=='false'?'<br/>'.$periods['dt']:'';  
                                                echo $periods['dt'];
                                                echo " ({$periods['end']})";
                                                $prds_count = $periods['break'] == 'false' ? $prds_count+1 : $prds_count;
                                                if($periods['break'] == 'true')
                                                {
                                                    echo ' En pause';
//                                                    echo !$appts_pre_break&&$appts_total>0?"<br/>$appts_total&nbsp;RDV avant la pause":'';
                                                    $appts_pre_break = $appts_total;
                                                    $prds_pre_break = $prds_count;
//                                                    $prds_count = 0;
                                                }
                                                if(isset($periods['appointment']) && count($periods['appointment'])>0 )
                                                {   
                                                    $appts_total += count($periods['appointment']);
                                                    echo $this->calendar_m->html_caldots($periods['appointment']) ; 
                                                } 
                                                echo '<br/>'; 
                                            }   
                                            //post loop
                                            $appts_post_break = $appts_total - $appts_pre_break ;
                                            $prds_post_break = $prds_count - $prds_pre_break;
                                            echo '<br/>'; 
                                            echo "periods_pre_break: $prds_pre_break periods_post_break: $prds_post_break<br/>" ;
                                            echo $appts_pre_break>0?"$appts_pre_break RDV avant la pause <br/>":'';
                                            echo $appts_post_break>0?"$appts_post_break RDV après la pause <br/>":'';
                                            echo $appts_total >0?"$appts_total RDV au total":''; 
                                            ?>
                                    </div>
                                    <div class="calendar-spacer"></div>
                        </div>
                    <?php 
                    endfor; 
                ?>

                         
	<center id="calendar-semaine-bas">{{variables:explication_calendar }}</center>
	<center id="calendar-semaine-bas">{{variables:telephone_commande }}</center>
	</div>
    
    </div>
</div>