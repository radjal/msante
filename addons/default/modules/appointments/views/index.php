<div class="appointments-container">

	{{ if items_exist == false }}
		<p>There are no items.</p>
	{{ else }}
		<div class="appointments-data">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<th>{{ helper:lang line="appointments:name" }}</th>
					<th>{{ helper:lang line="appointments:slug" }}</th>
					<th>{{ helper:lang line="appointments:appointment_status" }}</th>
					<th>{{ helper:lang line="appointments:total_pretax" }}</th>
					<th>{{ helper:lang line="appointments:total_final" }}</th>
					<th>{{ helper:lang line="appointments:appointment_date" }}</th>
					<th>{{ helper:lang line="appointments:appointment_date" }}</th>
					<th>{{ helper:lang line="appointments:i_name" }}</th>
					<th>{{ helper:lang line="appointments:d_name" }}</th>
				</tr>
				<!-- Here we loop through the $items array -->
				{{ items }}
				<tr>
					<td>{{ name }}</td>
					<td>{{ slug }}</td>
					<td>{{ statut }}</td>
					<td>{{ total_pretax }}</td>
					<td>{{ total_final }}</td>
					<td>{{ appointment_date }}</td>
					<td>{{ appointment_date }}</td>
					<td>{{ i_name }}</td>
					<td>{{ d_name }}</td>
				</tr>
				{{ /items }}
			</table>
		</div>
	
		{{ pagination:links }}
	
	{{ endif }}
	
</div>