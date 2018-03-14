
<div id="doctors-list">
	<h3>{{ helper:lang line="doctor:doctors" }}</h3>
        {{ doctor:search_box }} 
        <ul> 
		{{ doctors.entries }}
		<li class="doctor" data-rid="{{id}}" data-town="{{ town }}" data-address="{{ address }}" data-postcode="{{ postcode }}" data-name="{{ name }}">
			<h4>{{ name }}</h4>
			<p>
                        {{ if image:image}}<img src="{{ image:image }}" height="80" style="float:left;margin-right:20px;"/>{{endif}}
			   {{ if telephone }} Téléphone:  {{ telephone }}  <br/>{{ endif }}
			   {{ if mobile }} Mobile:  {{ mobile }} <br/>{{ endif }}
			   {{ if mail }} Email: {{ mail }} <br/>{{ endif }} 
                            
			   {{ address }}
                           {{ postcode }} {{ town }}
                        </p>
                        
                        <p>
                           <strong>Jours d'ouverture</strong>  <br/>
                        
			{{ days }} 
			<span data-dayno="{{ key }}" data-dayname="{{ value }}">
                           {{ value }}
			</span>
			{{ /days }}
                        </p>
                        <p>
                        <strong>Heures d'ouverture:</strong><br/>
                        {{ helper:nl2br string=hours }} {{# hours #}}<br/>
			{{ description }}
                        
			   {{# doctor_zone:doctor_zone_title #}} 
			</p>
                        
                        {{ if user:has_cp_permissions ==1 }} 
                            <a target="_blank" class="adminlink" href="{{url:site}}admin/doctor/edit/{{id}}">Modifier</a>
                        {{endif}}
		</li>
		{{ /doctors.entries }}
	</ul>
        
</div>