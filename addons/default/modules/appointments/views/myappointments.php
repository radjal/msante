<div class="appointments-container"> 
    <div class="appointments-appointment">
        <form method="post" class="appointments-search">
            <h2>Rendez vous</h2>  
            <?php // echo date('Ymd', time()) ?> 
            <?php // echo $this->html_m->form_input('id', $this->input->get('id')) ?> 
            <?= $this->html_m->form_input('appointment_date', $this->input->post('appointment_date'), ' class="form-control" placeholder="Date au format AAAAMMJJ en commencant par la gauche"') ?> 
            <?php // echo $this->html_m->form_input('user_id', $this->input->get('user_id')) ?>
            <?php // echo $this->html_m->form_input('first_name', $this->input->get('first_name')) ?>
            <?php
echo '';            
// echo $this->html_m->form_input('last_name', $this->input->get('last_name')) ?>
            <?php // $this->html_m->form_input('for_user', $this->input->post('for_user'), ' class="form-control"') ?>
                                    <label for="for_user">Pour l'utilisateur</label>
                                        <div class="for_user_ui" >
                                            <a onclick="setField('for_user', this)" 
                                               class="btn btn-primary btn-sm">Oui</a>
                                            <a onclick="setField('for_user', this)" 
                                               class="btn btn-primary btn-sm">Non</a> 
                                                <?php // $this->html_m->form_input('for_user', $this->input->post('for_user'), ' class="form-control"') ?>  
                                                <?php echo form_hidden('for_user', $this->input->post('for_user') ) ?>  
                                        </div> 
            <?= $this->html_m->form_input('doctor_id', $this->input->post('doctor_id'), ' class="form-control"') ?>
            
                                    <label for="futur_past">Futurs ou passés</label>
                                        <div class="futur_past_ui" >
                                            <a onclick="setField('futur_past', this)" 
                                               class="btn btn-primary btn-sm"
                                               data-value="futur">Future</a>
                                            <a onclick="setField('futur_past', this)" 
                                               class="btn btn-primary btn-sm"
                                               data-value="past">Passé</a> 
                                                <?php $this->html_m->form_input('futur_past', $this->input->post('futur_past'), ' class="form-control"') ?> 
                                                <?php echo form_hidden('futur_past', $this->input->post('futur_past') ) ?> 
                                        </div> 
            
                <button class="btn btn-primary" type="submit" name="searchBtn" value="<?= lang('appointments:search') ?>" /><?= lang('appointments:search') ?></button>
        
                <a class="btn btn-default" href="/appointments/listing"><?= lang('appointments:reset') ?></a>
        </form>
    </div> 
		<div class="appointments-data">
                        <table cellpadding="0" cellspacing="0" class="table table-striped table-hover ">
				<tr>
					<th></th>
                                        <?= $this->html_m->table_header('appointment_date') ?> 
                                        <?= $this->html_m->table_header('appointment_time') ?> 
                                        <?= $this->html_m->table_header('for_user') ?>
                                        <?= $this->html_m->table_header('first_name') ?>
                                        <?= $this->html_m->table_header('last_name') ?>
                                        <?= $this->html_m->table_header('name') ?>
                                        <?php
echo '';                                        
//$this->html_m->table_header('maiden_name') ?> 
				</tr>
				<!-- Here we loop through the $items array -->
				{{ appointments }}
				<tr><?php
echo '';                                       ?> 
                                    <td><a href="{{ url:site }}appointments/view/{{id}}" class=""><i class="glyphicon glyphicon-plus-sign"></i></a></td>
					<!--<td>{{ helper:date format="d/m/Y" timestamp=appointment_date }}</td>-->
					<td>{{short_dayname}} {{month}} </td>
					<td>{{time_formatted}}</td>
					<td>{{for_user}}</td>
					<td>{{ first_name }}</td>
					<td>{{ last_name }}</td>
					<td>{{ doc_name }} {{if doc_speciality}} &bullet; {{doc_speciality}}{{endif}}</td>
<!--					<td>{{ total_pretax }} €</td>
					<td>{{ total_final }} €</td>-->
<!--					<td>
                                            {{ if appointment_status == "prep" }}
                                                {{ helper:lang line="appointments:status_prep" }}
                                            {{ endif }}
                                            {{ if appointment_status == "delivery" }}
                                                {{ helper:lang line="appointments:status_seeing" }}
                                            {{ endif }}
                                            {{ if appointment_status == "delivered" }}
                                                {{ helper:lang line="appointments:status_seen" }}
                                            {{ endif }}
                                            {{ if appointment_status == "waiting" }}
                                                {{ helper:lang line="appointments:status_waiting" }}
                                            {{ endif }}
                                        </td>-->
<!--					<td>{{ maiden_name }}</td>
					<td>{{ area_name }}</td>
					<td>{{ district }}</td>
					<td>{{ town }}</td>-->
<!--                                        <td>
                                            {{appointment_date}} 
                                            {{ helper:date format="d/m/Y H:i:s" timestamp=appointment_date }}
                                        </td>-->
				</tr>
				{{ /appointments }}
			</table>
                    {{ if count == 1 }} {{ count }} enregistrement{{ endif }}
                    {{ if count > 1 }} {{ count }} enregistrements{{ endif }}
		</div>
	
		{{ pagination:links }}
	
</div>