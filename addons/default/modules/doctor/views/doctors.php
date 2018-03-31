<?php  $docCount = 0; ?>   
{{# custom:get_value name="c"#}}
<div class="text-center" id="doc-cat-icon"> 
    {{if {custom:get_value name="c"} }}
        {{ msante:doc_cat_img cat={custom:get_value name="c"} }}
    {{else}}
                                 <img src="{{url:site}}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg" height="80" class="img-circle" />
    {{# default placeholder #}}
        
    {{endif}}
</div>
                <center class="h5">
                    Semaine {{ cal_week:week }} 
                    <!--<a class="btn btn-default next-week" href="{{ url:site }}calendar/week/{{ cal_week:next_week_no }}/{{url:segments segment="4"}}">--> 
                    <a class="btn btn-default next-week" href="{{ url:site }}doctor/week/{{ cal_week:next_week_no }}"> 
                        <i class="glyphicon glyphicon-calendar"></i> semaine suivante<i class="glyphicon glyphicon-chevron-right"></i>
                    </a>
                </center>
<div id="doctors-list">
	<!--<h3>{{ helper:lang line="doctor:doctors" }}</h3>-->
	<div class="h4 panel-body text-center" >
            {{if category}}Choisir votre {{category}}{{endif}}{{if search && category}}, {{elseif search && !category}}Choisir un practicien, {{endif}}
            {{if search}}{{search}}
                et prendre votre RDV
            {{endif}}
        </div>
        {{if !doc_count }}
                <p class="alert alert-danger">Aucun résultat, veuiller changer de requete</p>
                {{ doctor:search_box }} 
        {{else}} 
                <p class="alert alert-success"><i class="close">×</i>
                    {{if doc_count == "1"}}{{doc_count}} enregistrement trouvé{{elseif doc_count >"1"}}{{doc_count}} enregistrements trouvés{{endif}}
                </p>
        {{endif}} 
        {{ if doctors.entries }}
        <div class="listing"> 
		<!-- start doctors entries --> 
                <?php 
                foreach ($doctors['entries']as $docObj => $doc) 
                {       
                        // Start foreach loop
                        $docCount +=1; //counter   
//                        $doctors;
//                        $doc;
                        echo '';
                ?> 
                 
		<section class="doctor panel panel-body" data-rid="<?php echo $doc['id'] ?>" data-town="<?= $doc['town'] ?>" data-address="<?= $doc['address'] ?>" data-area_name="<?= $doc['area_name'] ?>" data-name="<?php echo $doc['name'] ?>">
                    <div class="">
                            <div class="col-sm-4 col-xs-4"> 
                                <!-- image --> 
                                <?php 
                                    if($doc['image']['filename'])
                                    {
                                        $path =  $doc['image']['filename'];
                                    } 
                                    elseif( $doc['doctor_cat']['speciality'] ) { //default image for speciality
                                        switch ( $doc['doctor_cat']['speciality'] ) 
                                        {
                                            case "Médecins généralistes": 
                                                $path = 'e6ef08347e274fc655f20c172baad122.jpg';
                                                break; 
                                            case "Ophtalmologue": 
                                                $path = 'da81bbdd7f739e786f674638e29ba433.jpg';
                                                break; 
                                            case "ORL": 
                                                $path = '29edb0b1c84e0ed4df17c82fe658d9d5.jpg';
                                                break; 
                                            case "Cardiologue": 
                                                $path = 'f40501b53bd7d3e0f62c5086ea1ecc2b.jpg';
                                                break; 
                                            case "Spécialistes femme": 
                                                $path = '41f6ec9ed1a988081b7e137dee039c0d.jpg';
                                                break; 
                                            case "Dentiste": 
                                                $path = '1717f2a8194f53253de0df0c7f5f998c.jpg';
                                                break; 
                                            case "Radiologue": 
                                                $path = 'c9c12e653b087854ac27bf50eac5a6cc.jpg';
                                                break; 
                                            case "Autres médecins": 
                                                $path = 'e6ef08347e274fc655f20c172baad122.jpg';
                                                break; 
                                            case "Etablissements de santé": 
                                                $path = '056d27356ff595697ce2352501d71633.jpg';
                                                break; 
                                            default:
                                                $path = '8b37a2a2cbf9537714125a8f8476e63a.jpg';
                                                break;
                                        }
                                    } else { //default placeholder
                                        $path = '8b37a2a2cbf9537714125a8f8476e63a.jpg';
                                    }
                                    echo '<img src="'.site_url()."files/large/$path".'" height="80" class="img-circle" />' ;
                                ?>
                            </div> 
                            <div class="col-sm-4"> 
                                <!--<h4><a href="doctor/view/<?= $doc['id'] ?>"><?= $doc['name'] ?></a>-->
                                <h4>
                                    <!--<a href="doctor/view/<?= $doc['id'] ?>"><?= $doc['name'] ?></a>-->
                                    <?= $doc['name'] ?>
                                <?php  
                                    if($doc['doctor_cat']['speciality']) echo " &bullet; " . $doc['doctor_cat']['speciality'];
                                    if($doc['doctor_cat']['speciality'] and $doc['groupe']['subset']) echo " &bullet;&nbsp;";
                                    if($doc['groupe']['subset']) echo $doc['groupe']['subset'];
                                ?> 
                                </h4> 
                                <div class="">
                                            <?php echo $doc['address']; ?>   
                                            <?php echo $doc['area_name'] .', '. $doc['town']; ?> 
                                <!--                            <p>
                                            <?php echo $doc['address']; ?>  <br/> 
                                            <strong>Téléphone:</strong> <?= $doc['telephone'] ?><br/>
                                            <strong>Mobile:</strong> <?= $doc['mobile'] ?><br/>
                                            <strong>Email:</strong> <?= $doc['email'] ?><br/>

                                                <br/>
                                            <strong>Jours d'ouverture</strong><br/> 
                                                <span data-dayno="xxx" data-dayshortname="value">
                                                   <?php echo $doc['daysopenstr'] ?>
                                                </span> 
                                                <br/> 
                                            <strong>Heures d'ouverture:</strong>  
                                        </p> --> 
                                </div>
                            </div>
                            <div class="col-sm-4 col-xs-4 hidden-xs "><?php echo $doc['description'] ?></div>  
                    </div>
                <span class="clearfix"></span>
                    <div class="weekcalendar">
    <!--                            <p>
                            <strong>Prochaine disponibilités</strong> pour la semaine <?= $cal_week['week']; ?>  
                        </p>   -->
                        
                        <div class="weekdays-nano center-block">
                            <?php $this->load->view('nano-calendar', $doc) ?> 
                        </div>
                    </div>
                        
                        {{ if user:has_cp_permissions }} 
                                <a target="_blank" class="adminlink" href="<?= site_url() ?>admin/doctor/edit/<?= $doc['id'] ?>">Modifier</a>
                        {{endif}}
		</section>
                
                <?php 
                } // end foreach
                ?>
		<!-- end doctors entries -->
	</div>
        {{else}}
<!--        <p>
            Pas de résultats
        </p>-->
        {{endif}}
        
</div> 