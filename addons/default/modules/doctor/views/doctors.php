<?php  $docCount = 0; ?>  
<div id="doctors-list">
	<h3>{{ helper:lang line="doctor:doctors" }}</h3>
        {{ doctor:search_box }} 
        {{ if doctors.entries }}
        <div class="listing"> 
		<!-- start doctors entries --> 
                <?php 
                foreach ($doctors['entries']as $docObj => $doc) 
                { // Start foreach loop
                        $docCount +=1; //counter  
                ?>
                <!--
                    <?php // print_r( $doc )?> 
                -->
                 
		<section class="doctor" data-rid="<?php echo $doc['id'] ?>" data-town="<?php echo $doc['town'] ?>" data-address="<?php echo $doc['address'] ?>" data-area_name="<?php echo $doc['area_name'] ?>" data-name="<?php echo $doc['name'] ?>">
                    <h4><a href="doctor/id/<?php echo $doc['id'] ?>"><?php echo $doc['name'] ?></a></h4>
			<h5><?php 
                                if($doc['doctor_cat']['speciality']) echo $doc['doctor_cat']['speciality'];
                                if($doc['doctor_cat']['speciality'] and $doc['groupe']['subset']) echo " &bullet; ";
                                if($doc['groupe']['subset']) echo $doc['groupe']['subset'];
                            ?></h5> 
			<p> 
                            <!-- image --> 
                            <img src="{{ url:site }}files/large/<?php 
                                if($doc['image']['filename'])
                                {
                                    echo $doc['image']['filename'];
                                } 
                                elseif( $doc['doctor_cat']['speciality'] ) { //default image for speciality
                                    switch ( $doc['doctor_cat']['speciality'] ) 
                                    {
                                        case "Médecins généralistes": 
                                            echo 'e6ef08347e274fc655f20c172baad122.jpg';
                                            break; 
                                        case "Ophtalmologue": 
                                            echo 'da81bbdd7f739e786f674638e29ba433.jpg';
                                            break; 
                                        case "ORL": 
                                            echo '29edb0b1c84e0ed4df17c82fe658d9d5.jpg';
                                            break; 
                                        case "Cardiologue": 
                                            echo 'f40501b53bd7d3e0f62c5086ea1ecc2b.jpg';
                                            break; 
                                        case "Spécialistes femme": 
                                            echo '41f6ec9ed1a988081b7e137dee039c0d.jpg';
                                            break; 
                                        case "Dentiste": 
                                            echo '1717f2a8194f53253de0df0c7f5f998c.jpg';
                                            break; 
                                        case "Radiologue": 
                                            echo 'c9c12e653b087854ac27bf50eac5a6cc.jpg';
                                            break; 
                                        case "Autres médecins": 
                                            echo 'e6ef08347e274fc655f20c172baad122.jpg';
                                            break; 
                                        case "Etablissements de santé": 
                                            echo '056d27356ff595697ce2352501d71633.jpg';
                                            break; 
                                        default:
                                            echo '8b37a2a2cbf9537714125a8f8476e63a.jpg';
                                            break;
                                    }
                                } else { //default placeholder
                                    echo '8b37a2a2cbf9537714125a8f8476e63a.jpg';
                                }
                            ?>" height="80" style="float:left;margin-right:20px;"/>
                            
                             
                            <strong>Téléphone:</strong> <?php echo $doc['telephone'] ?><br/>
                            <strong>Mobile:</strong> <?php echo $doc['mobile'] ?><br/>
                            <strong>Email:</strong> <?php echo $doc['email'] ?><br/>
                             
                            <?php echo $doc['address']; ?>  <br/> 
                            <?php echo $doc['area_name'] .', '. $doc['town']; ?> 
                                <br/>
                            <strong>Jours d'ouverture</strong><br/> 
                                <span data-dayno="xxx" data-dayshortname="value">
                                   <?php echo $doc['daysopenstr'] ?>
                                </span> 
                                <br/> 
                            <strong>Heures d'ouverture:</strong>
                                opens - closes 
			</p>
                        <p><?php echo $doc['description'] ?></p>
                        
                        <div class="weekcalendar">
                            <p>
                                <strong>Prochaine disponibilités</strong> Semaine <?php echo $cal_week['week']; ?> 
                            </p>  
                            <?php 
                            $dc = 0;
                            foreach ($cal_week['week_dates_iso']  as $day) 
                            {
                                $dc +=1;
//                                print_r ($day );
                                echo '<a class="btn btn-default '; 
                                    echo !strstr( $doc['daysopenstr'], $cal_week['week_dates_iso'][$dc]['dayname'] ) ? 'disabled ' : '';
                                echo '"';
                                echo ' href="calendar/week/'.$cal_week['week'].'/'.$doc['id'].'" ' ;
                                echo '>';
                                echo $cal_week['week_dates_iso'][$dc]['dayshortname'];
                                echo ' ';
                                echo $cal_week['week_dates_iso'][$dc]['day'];
                                echo '</a> ';
                            } 
                            ?> 
                        </div>
                        
                        {{ if user:has_cp_permissions }} 
                                <a target="_blank" class="adminlink" href="<?php echo site_url() ?>admin/doctor/edit/<?php echo $doc['id'] ?>">Modifier</a>
                        {{endif}}
		</section>
                
                <?php 
                } // end foreach
                ?>
		<!-- end doctors entries -->
                <span class="clearfix"></span>
	</div>
        {{else}}
        <p>
            Pas de résultats
        </p>
        {{endif}}
        
</div> 