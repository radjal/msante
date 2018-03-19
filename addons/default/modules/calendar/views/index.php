<div id="message-sante">
    	{{ variables:message_sante }}
</div> 
{{ doctor:show id={url:segments segment="4"} }}
<div id="doctor">
    {{ id }} {{ name }} {{ area_name }} {{ town }}
</div>
{{ /doctor:show }}
<div class="post calendarsemaine">

    	
        <div class="message_global">{{ data:msg_global }}</div>


<div id="weekzone-wrapper">
    <div id="weekzone" class="{{ data:dayscount }}-days {{ data:days_oddeven }}" data-nodays="{{ data:dayscount }}" data-oddeven="{{ data:days_oddeven }}">
        
        <center class="calendar-semaine-titre">Semaine {{ data:week }} <a class="next-week" href="{{ url:site }}calendar/week/{{ data:next_week_no }}/{{url:segments segment="4"}}">semaine suivante</a></center>
        <center class="calendar-semaine-dates">Du {{helper:date timestamp=week_begin format="%A %e %b %Y" }} au {{helper:date timestamp=week_finish format="%A %e %b %Y" }}</center>
			{{ if lundi }}
			<div class="calendar {{ if data:today_no_iso > 1 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/{{day_link_segment}}/lundi">
						<div class="calendar_titre">{{ data:isodays:1 }}</div>
                                                <section>
                                                <?php
						if(!empty($lundi) AND count($lundi) > 0 )
						{		
                                                    echo "$lundi<br />";
//                                                    echo '<div class="calendar_separator">Entrées</div>';
//                                                    foreach($lundi['entrees'] as $p => $p_details)
//                                                    {		
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element entree '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
//                                                    
//                                                    echo '<div class="calendar_separator">Plats</div>';
//                                                    foreach($lundi['plats'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element plats '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
//                                                    
//                                                    echo '<div class="calendar_separator">Desserts</div>';
//                                                    foreach($lundi['desserts'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element desserts '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
                                                }
						?>
                                                </section><div class="calendar-spacer"></div>
					</a>
				</div>
			{{ endif }}
			{{ if mardi }}
			<div class="calendar {{ if data:today_no_iso > 2 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/{{day_link_segment}}/mardi">
						<div class="calendar_titre">{{ data:isodays:2 }}</div>
                                                <section>
                                                <?php
						if(!empty($mardi) AND count($mardi) > 0 )
						{			
                                                    echo "$mardi<br />";
//                                                    echo '<div class="calendar_separator">Entrées</div>';
//                                                    foreach($mardi['entrees'] as $p => $p_details)
//                                                    {   
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element entree '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
//                                                    
//                                                    echo '<div class="calendar_separator">Plats</div>';
//                                                    foreach($mardi['plats'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element plats '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
//                                                    
//                                                    echo '<div class="calendar_separator">Desserts</div>';
//                                                    foreach($mardi['desserts'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element desserts '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
                                                }
						?>
                                                </section><div class="calendar-spacer"></div>
					</a>
				</div>
			{{ endif }}
			{{ if mercredi }}
			<div class="calendar {{ if data:today_no_iso > 3 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/{{day_link_segment}}/mercredi">
						<div class="calendar_titre">{{ data:isodays:3 }}</div>
						<section><?php
							if(!empty($mercredi) AND count($mercredi) > 0 )
						{		
                                                    echo "$mercredi<br />";	
//                                                    echo '<div class="calendar_separator">Entrées</div>';
//                                                    foreach($mercredi['entrees'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element entree '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
//                                                    
//                                                    echo '<div class="calendar_separator">Plats</div>';
//                                                    foreach($mercredi['plats'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element plats '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
//                                                    
//                                                    echo '<div class="calendar_separator">Desserts</div>';
//                                                    foreach($mercredi['desserts'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element desserts '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
                                                }
						?>
                                                </section><div class="calendar-spacer"></div>
					</a>
				</div>
			{{ endif }}
			{{ if jeudi }}
			<div class="calendar {{ if data:today_no_iso > 4 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/{{day_link_segment}}/jeudi">
						<div class="calendar_titre">{{ data:isodays:4 }}</div>
						<section>
                                                <?php
						if(!empty($jeudi) AND count($jeudi) > 0 )
						{		
                                                    echo "$jeudi<br />";	
//                                                    echo '<div class="calendar_separator">Entrées</div>';
//                                                    foreach($jeudi['entrees'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element entree '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
//                                                    
//                                                    echo '<div class="calendar_separator">Plats</div>';
//                                                    foreach($jeudi['plats'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element plats '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
//                                                    
//                                                    echo '<div class="calendar_separator">Desserts</div>';
//                                                    foreach($jeudi['desserts'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element desserts '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
                                                }
						?>
                                                </section><div class="calendar-spacer"></div>
					</a>
				</div>
			{{ endif }}
			{{ if vendredi }}
			<div class="calendar {{ if data:today_no_iso > 5 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/{{day_link_segment}}/vendredi">
						<div class="calendar_titre">{{ data:isodays:5 }}</div> 
						<section><?php
						if(!empty($vendredi) AND count($vendredi) > 0 )
						{			
                                                    echo "$vendredi<br />";
//                                                    echo '<div class="calendar_separator">Entrées</div>';
//                                                    foreach($vendredi['entrees'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element entree '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
//                                                    
//                                                    echo '<div class="calendar_separator">Plats</div>';
//                                                    foreach($vendredi['plats'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element plats '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
//                                                    
//                                                    echo '<div class="calendar_separator">Desserts</div>';
//                                                    foreach($vendredi['desserts'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element desserts '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
                                                }
						?>
                                                </section><div class="calendar-spacer"></div>
					</a>
				</div>
			{{ endif }}
			{{ if samedi }}
			<div class="calendar {{ if data:today_no_iso > 6 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/{{day_link_segment}}/samedi">
						<div class="calendar_titre">{{ data:isodays:6 }}</div> 
						<section>
                                                <?php
						if(!empty($samedi) AND count($samedi) > 0 )
						{		
                                                    echo "$samedi<br />";	
//                                                    echo '<div class="calendar_separator">Entrées</div>';
//                                                    foreach($samedi['entrees'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element entree '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
//                                                    
//                                                    echo '<div class="calendar_separator">Plats</div>';
//                                                    foreach($samedi['plats'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element plats '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
//                                                    
//                                                    echo '<div class="calendar_separator">Desserts</div>';
//                                                    foreach($samedi['desserts'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element desserts '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
                                                }
						?>
                                                </section><div class="calendar-spacer"></div>
					</a>
				</div>
			{{ endif }}
			{{ if dimanche }}
			<div class="calendar">
					<a href="{{url:site}}calendar/{{day_link_segment}}/dimanche">
						<div class="calendar_titre">{{ data:isodays:7 }}</div> 
						<section>
                                                <?php
						if(!empty($dimanche) AND count($dimanche) > 0 )
						{			
                                                    echo "$dimanche<br />";
//                                                    echo '<div class="calendar_separator">Entrées</div>';
//                                                    foreach($dimanche['entrees'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element entree '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
//                                                    
//                                                    echo '<div class="calendar_separator">Plats</div>';
//                                                    foreach($dimanche['plats'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element plats '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
//                                                    
//                                                    echo '<div class="calendar_separator">Desserts</div>';
//                                                    foreach($dimanche['desserts'] as $p => $p_details)
//                                                    {
//                                                            $class = $p_details['stock'] <= 0 ? ' no-stock' : ''; 
//                                                            echo '<div class="calendar_element desserts '.$class.'">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
//                                                    }
                                                }
						?>
                                                </section><div class="calendar-spacer"></div>
					</a>
				</div>
			{{ endif }}
	<center id="calendar-semaine-bas">{{variables:explication_calendar }}</center>
	<center id="calendar-semaine-bas">{{variables:telephone_commande }}</center>
	</div>
    
    </div>
</div>