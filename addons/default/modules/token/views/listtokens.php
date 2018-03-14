<div class="token-container">

	{{ if items_exist == false }}
		<p>There are no items.</p>
	{{ else }}
		<div class="token-data">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<th>{{ helper:lang line="token:id" }}</th>
					<th>{{ helper:lang line="token:token" }}</th>
					<th>{{ helper:lang line="token:user_id" }}</th>
					<th>{{ helper:lang line="token:ip" }}</th>
					<th>{{ helper:lang line="token:user_agent" }}</th>
					<th>{{ helper:lang line="token:counter" }}</th>
					<th>{{ helper:lang line="token:timestamp" }}</th>
					<th>{{ helper:lang line="token:alive" }}</th>
				</tr>
				<!-- Here we loop through the $items array -->
				{{ items }}
				<tr>
					<td>{{ id }}</td>
					<td>{{ token }}</td>
					<td>{{ user_id }}</td>
					<td>{{ ip }}</td>
					<td>{{ user_agent }}</td>
					<td>{{ count }}</td>
					<td>{{ timestamp }}</td>
					<td>{{ alive }}</td>
				</tr>
				{{ /items }}
			</table>
		</div>
	
		{{ pagination:links }}
	
	{{ endif }}
	
</div>








