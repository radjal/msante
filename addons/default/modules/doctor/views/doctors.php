<?php  $docCount = 0; ?>    
{{# custom:get_value name="c"#}}
<div class="text-center" id="doc-cat-icon"> 
    {{if {custom:post_value name="c"} }}
        {{ msante:doc_cat_img cat={custom:post_value name="c"} }} 
    {{endif}}
</div>
<center class="h4">
    <i class="glyphicon glyphicon-calendar"></i> Semaine {{ cal_week:week }} 
</center> 
<center class="h5"> 
    <form action="{{ url:site }}doctor/" method="post">
    <input type="hidden" name="c" value="{{custom:post_value name="c"}}" />
    <input type="hidden" name="s" value="{{custom:post_value name="s"}}" /> 
        <button type="submit" class="loader btn btn-default" formaction="{{ url:site }}doctor/week/{{ cal_week:previous_week_no }}"> 
            <i class="glyphicon glyphicon-chevron-left"></i> Semaine précédente
        </button>  
    <input type="hidden" name="c" value="{{custom:post_value name="c"}}" />
    <input type="hidden" name="s" value="{{custom:post_value name="s"}}" />  
        <button type="submit" class="loader btn btn-default" formaction="{{ url:site }}doctor/week/{{ cal_week:next_week_no }}"> 
            Semaine suivante<i class="glyphicon glyphicon-chevron-right"></i>
        </button>
    </form>
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
                <p class="alert alert-danger">
                    Aucun médecin trouvé... 
                </p>
                {{ doctor:search_box }} 
        {{else}} 
                <p class="alert alert-success"><i class="close">×</i>
                    {{if doc_count == "1"}}{{doc_count}} médecin trouvé{{elseif doc_count >"1"}}{{doc_count}} médecins trouvés{{endif}}
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
                        echo '';
                ?> 
                 
		<section class="doctor panel panel-body" data-rid="<?php echo $doc['id'] ?>" data-town="<?= $doc['town'] ?>" data-address="<?= $doc['address'] ?>" data-area_name="<?= $doc['area_name'] ?>" data-name="<?php echo $doc['name'] ?>">
                    <div class="">
                            <div class="col-sm-4 col-xs-4"> 
                                <a href="{{url:site}}doctor/info/<?= $doc['id'] ?>"> 
                                    <!-- image --> 
                                    <?php 
                                        if($doc['image']['filename'])
                                        {
                                            $path =  $doc['image']['filename'];
                                        } elseif( $doc['doctor_cat']['speciality'] ) 
                                        { //default image for speciality 
                                            $path = $this->doctor_m->speciality_img($doc['doctor_cat']['speciality']);
                                        } else
                                        { //default placeholder
                                            $path = '8b37a2a2cbf9537714125a8f8476e63a.jpg';
                                        }
                                        echo '<img src="'.site_url()."files/large/$path".'" height="80" class="img-circle" />' ;
                                    ?> 
                                </a>
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