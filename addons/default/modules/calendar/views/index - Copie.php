<div id="message-sante">
    	{{ variables:message_sante }}
</div> 
<?php $this->load->view('doctor') ?> 
<div class="post calendarsemaine">
        <div class="message_global">{{ data:msg_global }}</div>


<div id="weekzone-wrapper">
    <div id="weekzone" class="{{ data:dayscount }}-days {{ data:days_oddeven }}" data-nodays="{{ data:dayscount }}" data-oddeven="{{ data:days_oddeven }}">
        
        <center class="calendar-semaine-titre h1">Semaine {{ data:week }} <a class="btn btn-default next-week" href="{{ url:site }}calendar/week/{{ data:next_week_no }}/{{url:segments segment="4"}}"> <i class="glyphicon glyphicon-calendar"></i> semaine suivante<i class="glyphicon glyphicon-chevron-right"></i></a></center>
        <center class="calendar-semaine-dates h2">Du {{helper:date timestamp=week_begin format="%A %e %b %Y" }} au {{helper:date timestamp=week_finish format="%A %e %b %Y" }}</center>
			{{ if lundi }}
			<div class="calendar {{ if data:today_no_iso > 1 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/{{day_link_segment}}/lundi">
					</a>
						<div class="calendar_titre">{{ data:isodays:1 }}</div>
                                                <section> 
                                                <?php // $this->calendar_m->html_caldots($appointments['lundi_joined'])   ?>
                                                <?php 
                                                $appts_total = 0 ;
                                                foreach ($appointments['lundi_joined'] as $periods ) 
                                                {  
                                                    echo $periods['dt'];
                                                    echo $periods['break'] == 'true' ? ' En pause': ''; 
                                                    if(isset($periods['appointment']) && count($periods['appointment'])>0 )
                                                    {   
                                                        $appts_total ++;
                                                        echo $this->calendar_m->html_caldots($periods['appointment']) ; 
                                                    } 
                                                    echo '<br/>'; 
                                                }  
                                                echo $appts_total >0?"$appts_total RDV":'';
                                                ?>
                                                </section><div class="calendar-spacer"></div>
				</div>
			{{ endif }}
			{{ if mardi }}
			<div class="calendar {{ if data:today_no_iso > 2 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/{{day_link_segment}}/mardi">
					</a>
						<div class="calendar_titre">{{ data:isodays:2 }}</div>
                                                <section>
                                                <?php foreach ($appointments['mardi_joined'] as $periods ) 
                                                { 
//                                                    print_r($periods);
                                                    echo $periods['dt'];
                                                    echo $periods['break'] == 'true' ? ' En pause': ''; 
                                                    if(isset($periods['appointment']) && count($periods['appointment'])>0 )
                                                    {   
                                                        echo $this->calendar_m->html_caldots($periods['appointment']) ; 
                                                    } 
                                                    echo '<br/>';  
                                                } ;   ?>
                                                </section><div class="calendar-spacer"></div>
				</div>
			{{ endif }}
			{{ if mercredi }}
			<div class="calendar {{ if data:today_no_iso > 3 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/{{day_link_segment}}/mercredi">
					</a>
						<div class="calendar_titre">{{ data:isodays:3 }}</div>
						<section>
                                                <?php foreach ($appointments['mercredi_joined'] as $periods ) 
                                                { 
//                                                    print_r($periods);
                                                    echo $periods['dt'];
                                                    echo $periods['break'] == 'true' ? ' En pause': '';  
                                                    if(isset($periods['appointment']) && count($periods['appointment'])>0 )
                                                    {   
                                                        echo $this->calendar_m->html_caldots($periods['appointment']) ; 
                                                    } 
                                                    echo '<br/>'; 
                                                }    ?>
                                                </section><div class="calendar-spacer"></div>
				</div>
			{{ endif }}
			{{ if jeudi }}
			<div class="calendar {{ if data:today_no_iso > 4 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/{{day_link_segment}}/jeudi">
					</a>
						<div class="calendar_titre">{{ data:isodays:4 }}</div>
						<section>
                                                <?php foreach ($appointments['jeudi_joined'] as $periods ) 
                                                { 
                                                    $has_appts = isset($periods['appointment']) && count($periods['appointment'])>0 ? true : false ;
                                                    echo $periods['dt'];
                                                    echo $periods['break'] == 'true' ? ' En pause': '';
                                                    $periods['has_appts'] = $has_appts ;
                                                    if(isset($periods['appointment']) && count($periods['appointment'])>0 )
                                                    {   
                                                        echo $this->calendar_m->html_caldots($periods['appointment']) ; 
                                                    } 
                                                    echo '<br/>'; 
                                                }    ?>
                                                </section><div class="calendar-spacer"></div>
				</div>
			{{ endif }}
			{{ if vendredi }}
			<div class="calendar {{ if data:today_no_iso > 5 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/{{day_link_segment}}/vendredi">
					</a>
						<div class="calendar_titre">{{ data:isodays:5 }}</div> 
						<section>
                                                <?php foreach ($appointments['vendredi_joined'] as $periods ) 
                                                { 
//                                                    print_r($periods);
                                                    echo $periods['dt'];
                                                    echo $periods['break'] == 'true' ? ' En pause': '';
                                                    if(isset($periods['appointment']) && count($periods['appointment'])>0 )
                                                    {   
                                                        echo $this->calendar_m->html_caldots($periods['appointment']) ; 
                                                    } 
                                                    echo '<br/>'; 
                                                }    ?>
                                                </section><div class="calendar-spacer"></div>
				</div>
			{{ endif }}
			{{ if samedi }}
			<div class="calendar {{ if data:today_no_iso > 6 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/{{day_link_segment}}/samedi">
					</a>
						<div class="calendar_titre">{{ data:isodays:6 }}</div> 
						<section>
                                                <?php foreach ($appointments['samedi_joined'] as $periods ) 
                                                { 
//                                                    print_r($periods);
                                                    echo $periods['dt'];
                                                    echo $periods['break'] == 'true' ? ' En pause': '';   
                                                    if(isset($periods['appointment']) && count($periods['appointment'])>0 )
                                                    {   
                                                        echo $this->calendar_m->html_caldots($periods['appointment']) ; 
                                                    } 
                                                    echo '<br/>'; 
                                                }    ?>
                                                </section><div class="calendar-spacer"></div>
				</div>
			{{ endif }}
			{{ if dimanche }}
			<div class="calendar">
					<a href="{{url:site}}calendar/{{day_link_segment}}/dimanche">
					</a>
						<div class="calendar_titre">{{ data:isodays:7 }}</div> 
						<section>
                                                <?php foreach ($appointments['dimanche_joined'] as $periods ) 
                                                { 
//                                                    print_r($periods);
                                                    echo $periods['dt'];
                                                    echo $periods['break'] == 'true' ? ' En pause': '';   
                                                    if(isset($periods['appointment']) && count($periods['appointment'])>0 )
                                                    {   
                                                        echo $this->calendar_m->html_caldots($periods['appointment']) ; 
                                                    } 
                                                    echo '<br/>'; 
                                                } ;   ?>
                                                </section><div class="calendar-spacer"></div>
				</div>
			{{ endif }}
	<center id="calendar-semaine-bas">{{variables:explication_calendar }}</center>
	<center id="calendar-semaine-bas">{{variables:telephone_commande }}</center>
	</div>
    
    </div>
</div>