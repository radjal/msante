
<?php echo form_open_multipart($this->uri->uri_string(), ''); ?>
    <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title">Souhaitez-vous annuler le RDV du {{date_formatted}} à {{time_formatted}}</h3>
        </div>
        <div class="panel-body"> 

          {{nom}}
        <div class="panel panel-body">
            <div class="col-sm-4 col-xs-4">
                {{ if img_path }}
                                    <img src="{{url:site}}files/large/{{img_path}}" height="80" class="img-circle"/>
                            {{ elseif speciality  }} 
                                {{ if speciality == "Médecins généralistes" }} 
                                        <img src="{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg" height="80" class="img-circle"/> 
                                {{ elseif speciality == "Ophtalmologue" }}
                                        <img src="{{ url:site }}files/large/da81bbdd7f739e786f674638e29ba433.jpg" height="80" class="img-circle"/> 
                                {{ elseif speciality == "ORL" }}
                                        <img src="{{ url:site }}files/large/29edb0b1c84e0ed4df17c82fe658d9d5.jpg" height="80" class="img-circle"/> 
                                {{ elseif speciality == "Cardiologue" }}
                                        <img src="{{ url:site }}files/large/f40501b53bd7d3e0f62c5086ea1ecc2b.jpg" height="80" class="img-circle"/> 
                                {{ elseif speciality == "Spécialistes femme" }}
                                        <img src="{{ url:site }}files/large/41f6ec9ed1a988081b7e137dee039c0d.jpg" height="80" class="img-circle"/> 
                                {{ elseif speciality == "Dentiste" }}
                                        <img src="{{ url:site }}files/large/1717f2a8194f53253de0df0c7f5f998c.jpg" height="80" class="img-circle"/> 
                                {{ elseif speciality == "Radiologue" }}
                                        <img src="{{ url:site }}files/large/c9c12e653b087854ac27bf50eac5a6cc.jpg" height="80" class="img-circle"/> 
                                {{ elseif speciality == "Autres médecins" }}
                                        <img src="{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg" height="80" class="img-circle"/> 
                                {{ elseif speciality == "Etablissements de santé" }}
                                        <img src="{{ url:site }}files/large/056d27356ff595697ce2352501d71633.jpg" height="80" class="img-circle"/>  
                                {{ else }} 
                                        <img src="{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg" height="80" class="img-circle"/>
                                {{ endif }} 
                            {{ else }} 
                            {{# default image #}}
                                <img src="{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg" height="80" class="img-circle"/>
                            {{ endif }}
            </div>
            <div class="col-sm-4">
                <h4>{{name}} 
                </h4>         
                <h5>
                    {{if speciality}}{{speciality}}{{endif}} 
                    {{if speciality and groupe}} &bullet; {{endif}} 
                    {{if subset}}{{subset}}{{endif}} 
                </h5> 
                    {{address}}  
                    {{area_name}}, {{town}} 
            </div> 
            
        </div> 
            </p>
              <?php 
              echo form_submit('appointmentDelete', 'OUI', 'class="btn btn-danger"'); ?> 
          <button class="btn btn-success" type="button" onclick="window.history.back();">NON</button>
        </div>
    </div>
<?php echo form_close(); ?>


<!--

<div  id="appointment-delete" class="appointment-form">
    <h2><?php
    echo lang('appointments:appointment_delete'); ?></h2>
		
		<div class="buttons" id="appointment-button-wrapper">
                    <?php echo form_submit('appointmentDelete', lang('appointments:appointment_delete'), 'class=""'); ?>
                </div>

</div>-->
               
