<!-- subdomain patients --> 
<div class="appointments-container"> 
  
    <div class="appointments-data">
        {{ appointments }}              
            <div class="panel panel-default panel-success">
                    <div class="panel-heading"> 
                            <h4>
                                    Le
                                     {{date_formatted}} {{month}}
                                    à {{time_formatted}}
                            </h4> 
                    </div>
                    <div class="panel-body">    
                            IMAGE 				
                                    {{doc_name}}{{if doc_speciality}} &bullet; {{doc_speciality}}{{endif}}				 <br> 
                                    1ADRESSE <br>    

                            <div class="center-block"> 
                                    <a class="btn btn-danger " href="{{url:site}}appointments/delete/{{id}}">Annuler ce RDV</a>			 
                            </div> 		 		 
                    </div>
            </div> 
        {{ /appointments }}
        {{ if count == 1 }} {{ count }} enregistrement{{ endif }}
        {{ if count > 1 }} {{ count }} enregistrements{{ endif }}
    </div>

    {{ pagination:links }}
	
</div>