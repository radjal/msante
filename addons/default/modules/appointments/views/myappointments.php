<div class="appointments-container">
		<div class="appointments-data">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<th></th>
                                        <?php echo $this->appointments_m->table_header('delivery_date') ?>
                                        <?php echo $this->appointments_m->table_header('total_pretax') ?>
                                        <?php echo $this->appointments_m->table_header('total_final') ?>
                                        <?php echo $this->appointments_m->table_header('appointment_status') ?>
                                        <?php echo $this->appointments_m->table_header('i_fullname') ?>
                                        <?php echo $this->appointments_m->table_header('d_fullname') ?>
                                        <?php echo $this->appointments_m->table_header('appointment_date') ?>
				</tr>
				<!-- Here we loop through the $items array -->
				{{ appointments }}
				<tr>
                                    <td><a href="{{ url:site }}appointments/view/{{id}}">+</a></td>
					<td>{{ helper:date format="d/m/Y" timestamp=delivery_date }}</td>
					<td>{{ total_pretax }} €</td>
					<td>{{ total_final }} €</td>
					<td>
                                            {{ if appointment_status == "prep" }}
                                                {{ helper:lang line="appointments:status_prep" }}
                                            {{ endif }}
                                            {{ if appointment_status == "delivery" }}
                                                {{ helper:lang line="appointments:status_delivery" }}
                                            {{ endif }}
                                            {{ if appointment_status == "delivered" }}
                                                {{ helper:lang line="appointments:status_delivered" }}
                                            {{ endif }}
                                            {{ if appointment_status == "waiting" }}
                                                {{ helper:lang line="appointments:status_waiting" }}
                                            {{ endif }}
                                        </td>
					<td>{{ i_fullname }}</td>
					<td>{{ d_fullname }}</td>
                                        <td>
                                            {{appointment_date}}
                                            <br/>
                                           <!-- {{ helper:date format="d/m/Y H:i:s" timestamp=appointment_date }}-->
                                        </td>
				</tr>
				{{ /appointments }}
			</table>
                    {{ if count == 1 }} {{ count }} enregistrement{{ endif }}
                    {{ if count > 1 }} {{ count }} enregistrements{{ endif }}
		</div>
	
		{{ pagination:links }}
	
</div>