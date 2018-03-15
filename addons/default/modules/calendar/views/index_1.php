<div id="message-sante">
    	{{ variables:message_sante }}
</div>
<div class="post calendarsemaine">

    	
        <div class="message_global">{{ data:msg_global }}</div>
	<div id="texte-choix">Veuillez choisir un jour dans le menu ci desous!</div>


<div id="weekzone-wrapper">
    <div id="weekzone" class="{{ data:dayscount }}-days {{ data:days_oddeven }}" data-nodays="{{ data:dayscount }}" data-oddeven="{{ data:days_oddeven }}">
        
	<center class="calendar-semaine-titre">semaine {{ data:week  }}, du <?php echo format_date($data['week_begin'], "%d %b"); ?> au  <?php echo format_date($data['week_finish'], "%d %B"); ?></center>
			{{ if lundi }}
			<div class="calendar {{ if data:today_no_iso > 1 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/jour/lundi">
						<div class="calendar_titre">{{ data:isodays:1 }}</div>
                                                <section>
                                                <?php
						$xcat = false;	
                                                
						if(!empty($lundi) AND count($lundi) > 0 )
						{					
                                                    foreach($lundi as $p => $p_details)
                                                    {
                                                            if($xcat != $p_details['cat_id']) 
                                                            {
                                                                    $xcat=$p_details['cat_id'];
                                                                    switch($xcat) {
                                                                            case $data['no_cat_entree']:
                                                                                    echo '<div class="calendar_separator">Entrées</div>';
                                                                            break;
                                                                            case $data['no_cat_plat']:
                                                                                    echo '<div class="calendar_separator">Plats</div>';
                                                                            break;
                                                                            case $data['no_cat_dessert']:
                                                                                    echo '<div class="calendar_separator">Desserts</div>';
                                                                            break;

                                                                    }
                                                            }
                                                            echo '<div class="calendar_element entree">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
                                                    }
                                                }
						?>
                                                </section>
					</a>
				</div>
			{{ endif }}
			{{ if mardi }}
			<div class="calendar {{ if data:today_no_iso > 2 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/jour/mardi">
						<div class="calendar_titre">{{ data:isodays:2 }}</div>
                                                <section>
                                                <?php
						$xcat = false;	
						if(!empty($mardi) AND count($mardi) > 0 )
						{					
							foreach($mardi as $p => $p_details)
							{
								if($xcat != $p_details['cat_id']) 
								{
									$xcat=$p_details['cat_id'];
									switch($xcat) {
										case $data['no_cat_entree']:
											echo '<div class="calendar_separator">Entrées</div>';
										break;
										case $data['no_cat_plat']:
											echo '<div class="calendar_separator">Plats</div>';
										break;
										case $data['no_cat_dessert']:
											echo '<div class="calendar_separator">Desserts</div>';
										break;
									}
								}
								echo '<div class="calendar_element entree">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
							}
						}
						?>
                                                </section>
					</a>
				</div>
			{{ endif }}
			{{ if mercredi }}
			<div class="calendar {{ if data:today_no_iso > 3 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/jour/mercredi">
						<div class="calendar_titre">{{ data:isodays:3 }}</div>
						<section><?php
						$xcat = false;	
						if(!empty($mercredi) AND count($mercredi) > 0 )
						{
							foreach($mercredi as $p => $p_details)
							{
								if($xcat != $p_details['cat_id']) 
								{
									$xcat=$p_details['cat_id'];
									switch($xcat) {
										case $data['no_cat_entree']:
											echo '<div class="calendar_separator">Entrées</div>';
										break;
										case $data['no_cat_plat']:
											echo '<div class="calendar_separator">Plats</div>';
										break;
										case $data['no_cat_dessert']:
											echo '<div class="calendar_separator">Desserts</div>';
										break;

									}
								}
								echo '<div class="calendar_element entree">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
							}
						}	
						?>
                                                </section>
					</a>
				</div>
			{{ endif }}
			{{ if jeudi }}
			<div class="calendar {{ if data:today_no_iso > 4 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/jour/jeudi">
						<div class="calendar_titre">{{ data:isodays:4 }}</div>
						<section>
                                                <?php
						$xcat = false;	
						if(!empty($jeudi) AND count($jeudi) > 0 )
						{
							foreach($jeudi as $p => $p_details)
							{
								if($xcat != $p_details['cat_id']) 
								{
									$xcat=$p_details['cat_id'];
									switch($xcat) {
										case $data['no_cat_entree']:
											echo '<div class="calendar_separator">Entrées</div>';
										break;
										case $data['no_cat_plat']:
											echo '<div class="calendar_separator">Plats</div>';
										break;
										case $data['no_cat_dessert']:
											echo '<div class="calendar_separator">Desserts</div>';
										break;

									}
								}
								echo '<div class="calendar_element entree">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
							}
						}
						?>
                                                </section>
					</a>
				</div>
			{{ endif }}
			{{ if vendredi }}
			<div class="calendar {{ if data:today_no_iso > 5 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/jour/vendredi">
						<div class="calendar_titre">{{ data:isodays:5 }}</div> 
						<section><?php
						$xcat = false;	
						
						if(!empty($vendredi) AND count($vendredi) > 0 )
						{
							foreach($vendredi as $p => $p_details)
							{
								if($xcat != $p_details['cat_id']) 
								{
									$xcat=$p_details['cat_id'];
									switch($xcat) {
										case $data['no_cat_entree']:
											echo '<div class="calendar_separator">Entrées</div>';
										break;
										case $data['no_cat_plat']:
											echo '<div class="calendar_separator">Plats</div>';
										break;
										case $data['no_cat_dessert']:
											echo '<div class="calendar_separator">Desserts</div>';
										break;

									}
								}
								echo '<div class="calendar_element entree">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
							}

						}
						?>
                                                </section>
					</a>
				</div>
			{{ endif }}
			{{ if samedi }}
			<div class="calendar {{ if data:today_no_iso > 6 }}date-passed {{ endif }}">
					<a href="{{url:site}}calendar/jour/vendredi">
						<div class="calendar_titre">{{ data:isodays:6 }}</div> 
						<section>
                                                <?php
						$xcat = false;	
						
						if(!empty($samedi) AND count($samedi) > 0 )
						{
							foreach($samedi as $p => $p_details)
							{
								if($xcat != $p_details['cat_id']) 
								{
									$xcat=$p_details['cat_id'];
									switch($xcat) {
										case $data['no_cat_entree']:
											echo '<div class="calendar_separator">Entrées</div>';
										break;
										case $data['no_cat_plat']:
											echo '<div class="calendar_separator">Plats</div>';
										break;
										case $data['no_cat_dessert']:
											echo '<div class="calendar_separator">Desserts</div>';
										break;

									}
								}
								echo '<div class="calendar_element entree">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
							}

						}
						?>
                                                </section>
					</a>
				</div>
			{{ endif }}
			{{ if dimanche }}
			<div class="calendar">
					<a href="{{url:site}}calendar/jour/vendredi">
						<div class="calendar_titre">{{ data:isodays:7 }}</div> 
						<section>
                                                <?php
						$xcat = false;	
						if(!empty($dimanche) AND count($dimanche) > 0 )
						{
							foreach($dimanche as $p => $p_details)
							{
								if($xcat != $p_details['cat_id']) 
								{
									$xcat=$p_details['cat_id'];
									switch($xcat) {
										case $data['no_cat_entree']:
											echo '<div class="calendar_separator">Entrées</div>';
										break;
										case $data['no_cat_plat']:
											echo '<div class="calendar_separator">Plats</div>';
										break;
										case $data['no_cat_dessert']:
											echo '<div class="calendar_separator">Desserts</div>';
										break;

									}
								}
								echo '<div class="calendar_element entree">'.$p_details['name'].'<span class="calendar-prix">'.$p_details['final_price'].' €</span></div>';
							}

						}
						?>
                                                </section>
					</a>
				</div>
			{{ endif }}
	</div>
    </div>
</div>