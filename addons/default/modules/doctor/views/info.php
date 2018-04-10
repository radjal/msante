<section class="doctor" data-rid="{{id}}" data-town="{{town}}" data-address="{{address}}" data-area_name="{{area_name}}" data-name="{{name}}">
    <div class="panel panel-body">
    
            <div class="col-sm-4 col-xs-4"> 
            <!-- image --> 
            <?php 
                    if($image['filename'])
                    {
                        $path = $image['filename'];
                    } 
                    elseif( $doctor_cat['speciality'] ) { //default image for speciality
                        switch ( $doctor_cat['speciality'] ) 
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
                    echo '<img src="'.site_url()."files/large/$path".'" height="80" class="img-circle" />';
                ?>
            </div>    
            <div class="col-sm-4">

                    <h4>{{name}}
                        <!--<a href="doctors/doctor/{{id}}">{{name}}</a>-->
                    </h4>
                    <h5><?php 
                            if($doctor_cat['speciality']) echo $doctor_cat['speciality'];
                            if($doctor_cat['speciality'] and $groupe['subset']) echo " &bullet; ";
                            if($groupe['subset']) echo $groupe['subset'];
                        ?>
                    </h5> 
 
                        <?php echo $address; ?>  
                        <?php echo $area_name .', '. $town; ?>   
            </div> 
			<div class="hidden-xs "><?php echo $description ?></div>
        <span class="clearfix"></span>
    </div> 
 
        {{ if user:has_cp_permissions }} 
                <a target="_blank" class="adminlink" href="<?php echo site_url() ?>admin/doctor/edit/{{id}}">Modifier</a>
        {{endif}} 

        <div class="panel-group" id="doctor-info">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#doctor-info" href="#collapse1">Carte et informations d’accès :</a>
              </h4>
            </div>
            <div id="collapse1" class="panel-collapse collapse in">
              <div class="panel-body"> {{address}} {{district}} {{area_name}} {{town}} </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#doctor-info" href="#collapse2">Présentation du professionnel de santé :</a>
              </h4>
            </div>
            <div id="collapse2" class="panel-collapse collapse">
              <div class="panel-body">{{description}} </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#doctor-info" href="#collapse3">Langues parlées :</a>
              </h4>
            </div>
            <div id="collapse3" class="panel-collapse collapse">
              <div class="panel-body">{{languages}} </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#doctor-info" href="#collapse4">Tarifs et mutuelle :</a>
              </h4>
            </div>
            <div id="collapse4" class="panel-collapse collapse">
              <div class="panel-body">{{fees}} </div>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#doctor-info" href="#collapse5">Moyens de paiement :</a>
              </h4>
            </div>
            <div id="collapse5" class="panel-collapse collapse">
              <div class="panel-body">{{payment}}</div>
            </div>
          </div>
        </div>  
        
</section>
<script>
    /** On document ready, go  */      
$( document ).ready(function() 
{     
    
});


</script>