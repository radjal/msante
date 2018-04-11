<pre>
<?php
//print_r($data);
?>
    
</pre>
<!-- categories --> 
<div id="categories"> 
            <div class="text-center h3 titre-rdv"> 
                Prenez rendez vous avec votre professionnel de sant&eacute; 
            </div>
    {{data}}  
 

                            <div class="specialite" data-cat="{{speciality}}" data-type="rdv">
                                    <img src="{{ url:site }}files/thumb/{{filename}}" alt="{{speciality}}"/> 
                                    <p>{{speciality}}</p>
                            </div>  
 
    {{/data}}
</div>
 