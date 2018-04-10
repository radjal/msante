<?php 
echo  ''; 
?>
{{# custom:get_value name="c"#}}
<!--<div class="text-center" id="doc-cat-icon"> 
    {{ msante:doc_cat_img cat={custom:get_value name="c"} }}
</div>-->

{{ doctor:show id=doctor_id }} 
<div id="doctor" class="">  
        <div class="panel panel-body">
            <div class="col-sm-4 col-xs-4"> 
                <a href="{{url:site}}doctor/info/{{doctor_id}}">
                        {{if img_path}}
                                    <img src="{{url:site}}files/large/{{img_path}}" height="80" class="img-circle"/>     
                        {{else}}       
                            {{if speciality  }} 
                                        <img src="{{url:site}}files/large/{{ doctor:speciality_img speciality={speciality} }}" height="80" class="img-circle"/>  
                            {{else}}  
                            {{# default image #}}
                                <img src="{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg" height="80" class="img-circle"/>
                            {{endif}} 
                        {{endif}} 
                </a>
            </div>
            <div class="col-sm-4">
                <h4>{{name}}
                    <!--<a href="doctor/id/{{url:segments segment="4"}}"></a>-->
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
              
    <!--<p>-->                    
<!--
        <strong>Téléphone:</strong>{{telephone}}<br/>
        <strong>Mobile:</strong>{{mobile}}<br/>
        <strong>Email:</strong>{{email}}<br/>-->

<!--            <br/>
        <strong>Jours d'ouverture</strong><br/> 
            <span data-dayno="xxx" data-dayshortname="value">
               {{daysopenstr}} 
            </span> 
            <br/> 
        <strong>Heures d'ouverture:</strong>
            opens - closes -->
    <!--</p>-->
    <!--<p>{{description}}</p>-->
    
    <div style="clear: both;" class="clearfix"></div> 
</div>
{{ /doctor:show }} 