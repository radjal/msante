<div class="orders-container">

	{{ if items_exist == false }}
		<p>There are no items.</p>
	{{ else }}
		<div class="orders-data">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<th>{{ helper:lang line="orders:name" }}</th>
					<th>{{ helper:lang line="orders:slug" }}</th>
					<th>{{ helper:lang line="orders:order_status" }}</th>
					<th>{{ helper:lang line="orders:total_pretax" }}</th>
					<th>{{ helper:lang line="orders:total_final" }}</th>
					<th>{{ helper:lang line="orders:order_date" }}</th>
					<th>{{ helper:lang line="orders:delivery_date" }}</th>
					<th>{{ helper:lang line="orders:i_name" }}</th>
					<th>{{ helper:lang line="orders:d_name" }}</th>
				</tr>
				<!-- Here we loop through the $items array -->
				{{ items }}
				<tr>
					<td>{{ name }}</td>
					<td>{{ slug }}</td>
					<td>{{ statut }}</td>
					<td>{{ total_pretax }}</td>
					<td>{{ total_final }}</td>
					<td>{{ order_date }}</td>
					<td>{{ delivery_date }}</td>
					<td>{{ i_name }}</td>
					<td>{{ d_name }}</td>
				</tr>
				{{ /items }}
			</table>
		</div>
	
		{{ pagination:links }}
	
	{{ endif }}
	
</div>