
<div id="doctors-list">
	<h3>{{ helper:lang line="doctor:doctors" }}</h3>
        {{ doctor:search_box inputclass='form-control' submitclass='btn btn-primary'  geoclass='btn btn-default' }} 
        <ul> 
		{{ doctors.entries }}
		<li class="doctor" data-rid="{{id}}" data-town="{{ town }}" data-address="{{ address }}" data-area_name="{{ area_name }}" data-name="{{ name }}">
			<h4>{{ name }}</h4>
			<h5>
                            {{ if doctor_cat:speciality }}{{ doctor_cat:speciality }}{{endif}}
                            {{ if groupe:subset and doctor_cat:speciality }}&bullet;{{endif}}
                            {{ if groupe:subset }}{{ groupe:subset }}{{endif}}
                        </h5>
                        <p><?php 
                                
                            ?>
                        </p>
			<p> 
                            {{ if image:image}}
                                <img src="{{ image:image }}" height="80" style="float:left;margin-right:20px;"/>
                            {{ elseif doctor_cat:speciality  }} 
                                {{ if doctor_cat:speciality == "Médecins généralistes" }} 
                                        <img src="{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg" height="80" style="float:left;margin-right:20px;"/> 
                                {{ elseif doctor_cat:speciality == "Ophtalmologue" }}
                                        <img src="{{ url:site }}files/large/da81bbdd7f739e786f674638e29ba433.jpg" height="80" style="float:left;margin-right:20px;"/> 
                                {{ elseif doctor_cat:speciality == "ORL" }}
                                        <img src="{{ url:site }}files/large/29edb0b1c84e0ed4df17c82fe658d9d5.jpg" height="80" style="float:left;margin-right:20px;"/> 
                                {{ elseif doctor_cat:speciality == "Cardiologue" }}
                                        <img src="{{ url:site }}files/large/f40501b53bd7d3e0f62c5086ea1ecc2b.jpg" height="80" style="float:left;margin-right:20px;"/> 
                                {{ elseif doctor_cat:speciality == "Spécialistes femme" }}
                                        <img src="{{ url:site }}files/large/41f6ec9ed1a988081b7e137dee039c0d.jpg" height="80" style="float:left;margin-right:20px;"/> 
                                {{ elseif doctor_cat:speciality == "Dentiste" }}
                                        <img src="{{ url:site }}files/large/1717f2a8194f53253de0df0c7f5f998c.jpg" height="80" style="float:left;margin-right:20px;"/> 
                                {{ elseif doctor_cat:speciality == "Radiologue" }}
                                        <img src="{{ url:site }}files/large/c9c12e653b087854ac27bf50eac5a6cc.jpg" height="80" style="float:left;margin-right:20px;"/> 
                                {{ elseif doctor_cat:speciality == "Autres médecins" }}
                                        <img src="{{ url:site }}files/large/e6ef08347e274fc655f20c172baad122.jpg" height="80" style="float:left;margin-right:20px;"/> 
                                {{ elseif doctor_cat:speciality == "Etablissements de santé" }}
                                        <img src="{{ url:site }}files/large/056d27356ff595697ce2352501d71633.jpg" height="80" style="float:left;margin-right:20px;"/>  
                                {{ else }} 
                                        <img src="{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg" height="80" style="float:left;margin-right:20px;"/>
                                {{ endif }} 
                            {{ else }} 
                            {{# default image #}}
                                <img src="{{ url:site }}files/large/8b37a2a2cbf9537714125a8f8476e63a.jpg" height="80" style="float:left;margin-right:20px;"/>
                            {{ endif }}
                            
                            
                            {{ if telephone }}<strong>Téléphone:</strong>  {{ telephone }}  <br/>{{ endif }}
                            {{ if mobile }}<strong>Mobile:</strong>  {{ mobile }} <br/>{{ endif }}
                            {{ if mail }}<strong>Email:</strong> {{ mail }} <br/>{{ endif }} 
                            
                            
                            {{ if address }}{{ address }} <br/>{{ endif }} 
                            {{ area_name }} {{ town }} 
                                <br/>
                            <strong>Jours d'ouverture</strong><br/> 
                                {{ days }} 
                                <span data-dayno="{{ key }}" data-dayname="{{ value }}">
                                   {{ value }}
                                </span>
                                {{ /days }}
                                <br/>
                            <strong>Heures d'ouverture:</strong>
                                {{ opens }} {{ closes }} 
			</p>
                        <p>
                                {{ description }}   
			</p>
                        
                        {{ if user:has_cp_permissions }} 
                            <a target="_blank" class="adminlink" href="{{url:site}}admin/doctor/edit/{{id}}">Modifier</a>
                        {{endif}}
		</li>
		{{ /doctors.entries }}
	</ul>
        
</div>