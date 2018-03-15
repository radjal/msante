	<hr/>
	<h3>{{ data:titre }}</h3>
		<h4>week {{ data:week }}</h4>
			<p>year {{ data:year }}</p>
			<p>month_no {{ data:month_no }}</p>
			<p>month_name {{ data:month_name }}</p>
			<p>today {{ data:today }}</p>	
			<p>today_no {{ data:today_no }}</p>
			<p>today_no_iso {{ data:today_no_iso }}</p>
			<p>today_day {{ data:today_day }}</p>
			<p>next_week_no {{ data:next_week_no }}</p>
			<p>previous_week_no {{ data:previous_week_no }}</p>
			<hr/>
			<p>week_begin {{ data:week_begin }}</p>
			<p>week_begin_day {{ data:week_begin_day }}</p>
			<p>week_begin_day_no {{ data:week_begin_day_no }}</p>
			<p>week_begin_day_iso {{ data:week_begin_day_iso }}</p>
			<p>week_begin_day_name {{ data:week_begin_day_name }}</p>
			<hr/>
			<p>week_finish {{ data:week_finish }}</p>
			<p>week_finish_day {{ data:week_finish_day }}</p>
			<p>week_finish_day_no {{ data:week_finish_day_no }}</p>
			<p>week_finish_day_iso {{ data:week_finish_day_iso }}</p>
			<p>week_finish_day_name {{ data:week_finish_day_name }}</p>
			<hr/>
			<p>msg_global {{ data:msg_global }}</p>

        <p>no_cat_entree {{ data:no_cat_entree }} </p>
        <p>no_cat_plat {{ data:no_cat_plat }} </p>
        <p>no_cat_dessert {{ data:no_cat_dessert }} </p>
        <p>no_cat_boissons {{ data:no_cat_boissons }} </p>
        
        <p>cat_lundi {{ data:cat_lundi }} </p>
        <p>cat_mardi {{ data:cat_mardi }} </p>
        <p>cat_mercredi {{ data:cat_mercredi }} </p>
        <p>cat_jeudi {{ data:cat_jeudi }} </p>
        <p>cat_vendredi {{ data:cat_vendredi }} </p>
        <p>cat_samedi {{ data:cat_samedi }} </p>
        <p>cat_dimanche {{ data:cat_dimanche }} </p>			
	<ol> 
		{{##}}
		<li class="calendar">
			<span class="{{# key #}}">, {{# value #}} </span>
		</li>
	</ol>