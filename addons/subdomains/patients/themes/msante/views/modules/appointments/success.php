<!-- subdomain patients --> 
<?php
echo '';
//print_r($appointments);
?> 
<div class="panel panel-default panel-success">
		<div class="panel-heading"> 
			<center>
                            Votre RDV du 
                            <h4>{{formatted_date}}
				à  {{formatted_time}}  
                            </h4>
                                {{if for_user == "no" }}
                                    pour {{first_name}} {{last_name}}  
                                {{endif}}  
                                avec {{doctor:name}}  
                                <h4>est confirmé</h4>
			</center>
                    
                         <!--
			 [ appointment_time: {{appointment_time}}   -  doctor_id: {{doctor_id}} user_id: {{user_id}} ]
                          -->
		</div>
		<div class="panel-body">    
                    <a href="{{url:site}}doctor/info/{{doc_id}}">
                    <!-- img -->
                    {{img_path}}
			 {{ if doctor:img_path }}
                                <img src="{{url:site}}files/large/{{doctor:img_path}}" height="80" style="float:left;margin-right:20px;" class="img-circle" />
                            {{ elseif speciality  }}  
                                        <img src="{{ url:site }}files/large/{{ speciality_img speciality=speciality  }}" 
                                             height="80" style="float:left;margin-right:20px;"
                                             class="img-circle" /> 
                            {{ else }} 
                            {{# default image #}}
                                <img src="{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg" height="80" style="float:left;margin-right:20px;" class="img-circle" />
                            {{ endif }}
                    <!-- img end  --> 
                    </a>
                    <p>
                        {{doctor:name}} {{if speciality}}&bullet; {{speciality}}{{endif}}
                         <br /> 
                        {{doctor:address}} {{doctor:area}} {{doctor:town}} 
                    </p>		
                        
                    <p class="for_user_ico">
                    {{if for_user == "no" }}
                        RDV pour: {{first_name}} {{last_name}}
                    {{else}}
                        <i class="glyphicon glyphicon-user"></i>
                    {{endif}}
                    </p>
                    <div class="clearfix"></div>
                    
                    <center class=""> 
                            <a class="loader btn btn-danger " href="{{url:site}}appointments/delete/{{id}}">Annuler ce RDV</a>			 
                    </center> 		 
		</div>
</div> 
