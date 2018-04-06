<section class="doctor" data-rid="{{id}}" data-town="{{town}}" data-address="{{address}}" data-area_name="{{area_name}}" data-name="{{name}}">
    <div class="panel panel-body">
    
            <div class="col-sm-4 col-xs-4"> 
                
                <a href="{{url:site}}doctor/info/{{id}}">
                    <!-- image --> 
                    <?php 
                    if($image['filename'])
                    {
                        $path = $image['filename'];
                    } 
                    elseif( $doctor_cat['speciality'] ) 
                    { //default image for speciality 
                        $path = $this->doctor_m->speciality_img($doctor_cat['speciality']);
                    } else 
                    { //default placeholder
                        $path = '8b37a2a2cbf9537714125a8f8476e63a.jpg';
                    }
                    echo '<img src="'.site_url()."files/large/$path".'" height="80" class="img-circle" />';
                    ?>
                </a>
                    
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


            <!--
                        <strong>Téléphone:</strong> <?php echo $telephone ?><br/>
                        <strong>Mobile:</strong> <?php echo $mobile ?><br/>
                        <strong>Email:</strong> <?php echo $email ?><br/>-->

                        <?php echo $address; ?>  
                        <?php echo $area_name .', '. $town; ?>  
            <!--            
                               <?php echo $daysopenstr ?>
                            -->
            </div> 
			<div class="hidden-xs "><?php echo $description ?></div>
        <span class="clearfix"></span>
    </div> 

            <div class="weekcalendar "> 
                <center class="h4 text-center ">
                   Choisir votre date de RDV  
                     <i class="glyphicon glyphicon-calendar"></i> Semaine {{ cal_week:week }} 
                </center>
                <center class="h5">
                    <a class="btn btn-default next-week" href="{{ url:site }}doctor/view/{{id}}/{{ cal_week:previous_week_no }}"> 
                        <i class="glyphicon glyphicon-chevron-left"></i> Semaine précédente
                    </a>
                    <a class="btn btn-default next-week" href="{{ url:site }}doctor/view/{{id}}/{{ cal_week:next_week_no }}"> 
                        Semaine suivante<i class="glyphicon glyphicon-chevron-right"></i>
                    </a>
                </center>
                  
                <div class="weekdays text-center ">
                    <?php   $this->load->view('micro-calendar' ) ?> 
                </div>
            </div>

        {{ if user:has_cp_permissions }} 
                <a target="_blank" class="adminlink" href="<?php echo site_url() ?>admin/doctor/edit/{{id}}">Modifier</a>
        {{endif}}
</section>
