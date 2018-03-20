<div class="appointments-container"> 
    <div class="appointments-appointment">
        <form method="post">
            <h2>Rendez vous</h2>  
            <?php // echo date('Ymd', time()) ?> 
            <?php // echo $this->html_m->form_input('id', $this->input->get('id')) ?> 
            <?php echo $this->html_m->form_input('appointment_date', $this->input->post('appointment_date')) ?> 
            <?php // echo $this->html_m->form_input('user_id', $this->input->get('user_id')) ?>
            <?php // echo $this->html_m->form_input('first_name', $this->input->get('first_name')) ?>
            <?php // echo $this->html_m->form_input('last_name', $this->input->get('last_name')) ?>
            <?php echo $this->html_m->form_input('other_person', $this->input->post('other_person')) ?>
            <?php echo $this->html_m->form_input('futur_past', $this->input->post('futur_past')) ?>
                <button class="btn blue" type="submit" name="searchBtn" value="<?php echo lang('appointments:search') ?>" /><?php echo lang('appointments:search') ?></button>
                <a class="btn gray" href="/appointments/listing"><?php echo lang('appointments:reset') ?></a>
        </form>
    </div> 
		<div class="appointments-data">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<th></th>
                                        <?php echo $this->html_m->table_header('appointment_date') ?>
                                        <?php // echo $this->html_m->table_header('total_pretax') ?>
                                        <?php // echo $this->html_m->table_header('total_final') ?>
                                        <?php echo $this->html_m->table_header('appointment_status') ?>
                                        <?php echo $this->html_m->table_header('first_name') ?>
                                        <?php echo $this->html_m->table_header('last_name') ?>
                                        <?php echo $this->html_m->table_header('maiden_name') ?> 
				</tr>
				<!-- Here we loop through the $items array -->
				{{ appointments }}
				<tr>
                                    <td><a href="{{ url:site }}appointments/view/{{id}}">+</a></td>
					<!--<td>{{ helper:date format="d/m/Y" timestamp=appointment_date }}</td>-->
					<td>{{short_dayname}}</td>
<!--					<td>{{ total_pretax }} €</td>
					<td>{{ total_final }} €</td>-->
					<td>
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
                                        </td>
					<td>{{ first_name }}</td>
					<td>{{ last_name }}</td>
					<td>{{ maiden_name }}</td>
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