<?php 
echo  ''; 
?>
<?php echo form_open_multipart($this->uri->uri_string(), ''); ?>
    <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title">Souhaitez-vous annuler le RDV du {{date_formatted}} à {{time_formatted}} 
              <!--avec {{doctor:name}}--> 
              ?</h3>
        </div>
        <div class="panel-body"> 

          {{nom}}
        <div class="panel panel-body">
            <div class="col-sm-4 col-xs-4">  
                <a href="{{url:site}}doctor/info/{{doc_id}}">
                    <!-- img -->
			 {{ if doctor:img_path }}
                            <img src="{{url:site}}files/large/{{doctor:img_path}}" height="80" style="float:left;margin-right:20px;" class="img-circle"/>
                            {{ elseif doctor:speciality  }}  
                                        <img src="{{ url:site }}files/large/{{ doctor:speciality_img speciality=doctor:speciality  }}" height="80" style="float:left;margin-right:20px;" class="img-circle"/>
                         
                            {{ else }} 
                            {{# default image #}}
                                <img src="{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg" height="80" style="float:left;margin-right:20px;" class="img-circle"/>
                            {{ endif }}
                    <!-- img end  -->  
                </a>
            </div>
            <div class="col-sm-4">
                <h4>{{doctor:name}}</h4>         
                <h5>
                    {{if speciality}}{{speciality}}{{endif}} 
                    {{if speciality and groupe}} &bullet; {{endif}} 
                    {{if subset}}{{subset}}{{endif}} 
                </h5> 
                <p>
                    {{doctor:address}}  
                    {{doctor:area_name}}, {{doctor:town}} 
                </p>

                <p class="for_user_ico">
                {{if for_user == "no" }}
                    <strong>RDV pour: {{first_name}} {{last_name}}</strong>
                {{else}}
                    <i class="glyphicon glyphicon-user"></i>
                {{endif}}
                </p>
                <div class="clearfix"></div>
                
            </div> 
            
        </div>  
          <center>
                <?php echo form_button(array('name' => 'appointmentDelete', 'type' => 'submit'), 'OUI', 'class="loader btn btn-danger"'); ?> 
                <?php // echo form_submit('appointmentDelete', 'OUI', 'class="loader btn btn-danger"'); ?> 
                <button class="loader btn btn-success" type="button" onclick="window.history.back();">NON</button> 
          </center> 
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
               
