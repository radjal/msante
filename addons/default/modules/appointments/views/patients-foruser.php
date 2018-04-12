<div class="patients-foruser">   
	<?php // print_r($patients); ?>
    {{patients}} 
        
            <div>
                <form action="appointments/listing" method="post">
                    <button name="searchBtn" value="{{first_name}} {{last_name}}" class="loader btn btn-default btn-block">
                            {{first_name}} {{last_name}}
                    </button>
                    <input name="first_name" type="hidden" value="{{first_name}}"/>
                    <input name="last_name" type="hidden" value="{{last_name}}"/>
                     
                </form>
            </div>
    
    
        <br/>
        
        
        
        
        
        
    {{/patients}}
</div>