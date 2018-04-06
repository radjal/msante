<!-- subdomain patients --> 
<!-- 
<div class="text-center">
    <a class="btn btn-primary" href="{{url:site}}rendez-vous/">Afficher les RDV</a> 
</div>--> 
<!--
<ul class="list-group">
        <li class="list-group-item active"><a href="{{url:site}}rendez-vous/rdv-a-venir">RDV à venir</a></li>
        <li class="list-group-item"><a href="{{url:site}}rendez-vous/mes-rdv-a-venir">Mes RDV à venir</a></li>
        <li class="list-group-item"><a href="{{url:site}}rendez-vous/rdv-a-venir-de-mes-proches">RDV à venir de mes proches</a></li>
</ul>
<ul class="list-group">
        <li class="list-group-item active"><a href="{{url:site}}rendez-vous/rdv-passes">RDV passés</a></li>
        <li class="list-group-item"><a href="{{url:site}}rendez-vous/mes-rdv-passes">Mes RDV passés</a></li>
        <li class="list-group-item"><a href="{{url:site}}rendez-vous/rdv-passes-de-mes-proches">RDV passés de mes proches</a></li>
</ul>
 -->
 
<?php
echo '';
//print_r($appointments);
?> 
<div class="panel panel-default panel-success">
		<div class="panel-heading"> 
			<h4>
				Votre RDV du
				 {{appointment:formatted_date}} 
				à  {{appointment:formatted_time}} 
                                {{if for_user == "no" }}
                                    pour {{first_name}} {{last_name}}  
                                {{endif}}  
                                avec {{doctor:name}} 
			</h4>
                    
                         <!--
			 [{{appointment_time}}   - 
			 doc {{doctor_id}} user {{user_id}}]
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
                            <a class="loader btn btn-danger " href="{{url:site}}appointments/delete/{{doc_id}}">Annuler ce RDV</a>			 
                    </center> 		 
		</div>
</div> 
