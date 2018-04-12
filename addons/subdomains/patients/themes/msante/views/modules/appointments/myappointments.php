<h3>
<?= $this->input->post('searchBtn') ?>
    
</h3>

{{ if count >= 1 }}
        <p class="alert alert-info"> <i class="close">×</i>
                {{ if count == 1 }} {{ count }} RDV trouvé{{ endif }}
                {{ if count > 1 }} {{ count }} RDV trouvés{{ endif }}
        </p>   
{{else}}
        <p class="alert alert-info"> <i class="close">×</i>
            Pas de RDV
        </p>   
{{endif}}
{{ appointments }}

        <div class="panel panel-default {{if !passed }}panel-success{{endif}}">
                        <div class="panel-heading"> 
                                <h4>
                                        Le 
                                        {{date_formatted}} {{month}} 
                                        à  {{time_formatted}} 
                                </h4>

                                 <!--
                                 [{{appointment_time}}   - 
                                 doc {{doctor_id}} user {{user_id}}]
                                  -->
                        </div>
                        <div class="panel-body">    
                            <a href="{{url:site}}doctor/info/{{doc_id}}">
                                    <!-- img -->
                                         {{if doc_img}}
                                                <img src="{{url:site}}files/large/{{doc_img}}" height="80" style="float:left;margin-right:20px;" class="img-circle" />
                                            {{elseif doc_speciality}}  
                                                        <img src="{{url:site}}files/large/{{doctor:speciality_img speciality=doc_speciality}}" 
                                                             height="80" style="float:left;margin-right:20px;"
                                                             class="img-circle" /> 
                                            {{else}} 
                                            {{# default image #}}
                                                <img src="{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg" height="80" style="float:left;margin-right:20px;" class="img-circle" />
                                        {{endif}}
                                    <!-- img end  --> 
                            </a>
                            <p>
                                {{doc_name}} {{if doc_speciality}}&bullet; {{doc_speciality}}{{endif}}
                                 <br /> 
                                {{doc_address}} {{doc_area}} {{doc_town}} 
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
                                 {{if !passed }}
                                
                                        <a class="btn btn-danger loader" href="{{url:site}}appointments/delete/{{id}}">Annuler le RDV</a>	
                                    {{else}}
                                        
                                            <a class="btn btn-info loader"  href="{{url:site}}doctor/view/{{doc_id}}">Reprendre le RDV</a>
                                    {{endif}}
                            </center> 		 
                        </div>
        </div> 


{{ /appointments }}