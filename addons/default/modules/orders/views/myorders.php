<div class="orders-container">
		<div class="orders-data">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<th></th>
                                        <?php echo $this->orders_m->table_header('delivery_date') ?>
                                        <?php echo $this->orders_m->table_header('total_pretax') ?>
                                        <?php echo $this->orders_m->table_header('total_final') ?>
                                        <?php echo $this->orders_m->table_header('order_status') ?>
                                        <?php echo $this->orders_m->table_header('i_fullname') ?>
                                        <?php echo $this->orders_m->table_header('d_fullname') ?>
                                        <?php echo $this->orders_m->table_header('order_date') ?>
				</tr>
				<!-- Here we loop through the $items array -->
				{{ orders }}
				<tr>
                                    <td><a href="{{ url:site }}orders/view/{{id}}">+</a></td>
					<td>{{ helper:date format="d/m/Y" timestamp=delivery_date }}</td>
					<td>{{ total_pretax }} €</td>
					<td>{{ total_final }} €</td>
					<td>
                                            {{ if order_status == "prep" }}
                                                {{ helper:lang line="orders:status_prep" }}
                                            {{ endif }}
                                            {{ if order_status == "delivery" }}
                                                {{ helper:lang line="orders:status_delivery" }}
                                            {{ endif }}
                                            {{ if order_status == "delivered" }}
                                                {{ helper:lang line="orders:status_delivered" }}
                                            {{ endif }}
                                            {{ if order_status == "waiting" }}
                                                {{ helper:lang line="orders:status_waiting" }}
                                            {{ endif }}
                                        </td>
					<td>{{ i_fullname }}</td>
					<td>{{ d_fullname }}</td>
                                        <td>
                                            {{order_date}}
                                            <br/>
                                           <!-- {{ helper:date format="d/m/Y H:i:s" timestamp=order_date }}-->
                                        </td>
				</tr>
				{{ /orders }}
			</table>
                    {{ if count == 1 }} {{ count }} enregistrement{{ endif }}
                    {{ if count > 1 }} {{ count }} enregistrements{{ endif }}
		</div>
	
		{{ pagination:links }}
	
</div>