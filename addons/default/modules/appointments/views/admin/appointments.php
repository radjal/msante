<section class="title">
	<h4><?php echo lang('appointments:details_list') ?></h4>
        <?php $this->load->view('admin/partials/search') ?>
</section>

<section class="item">
	<?php echo form_open('admin/appointments/delete');?>
	
	<?php if (!empty($appointments)): ?>
                <table>
			<thead>
				<tr>
                                    	<th><?php echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all'));?></th>
                                        <?php echo $this->html_m->table_header('id') ?>
                                        <?php echo $this->html_m->table_header('appointment_status') ?> 
                                        <?php echo $this->html_m->table_header('appointment_date') ?> 
                                        <?php echo $this->html_m->table_header('appointment_time') ?> 
                                        
                                        <?php if (empty($this->input->get('view'))) 
                                        { ?>
                                        <?php // echo $this->html_m->table_header('name', lang('appointments:name_alt')) ?>
                                        <?php // echo $this->html_m->table_header('slug', lang('appointments:slug_alt')) ?>
                                        <?php echo $this->html_m->table_header('user_id') ?> 
                                        <?php echo $this->html_m->table_header('doctor_id') ?> 
                                        <?php echo $this->html_m->table_header('first_name') ?> 
                                        <?php echo $this->html_m->table_header('last_name') ?> 
                                        <?php echo $this->html_m->table_header('for_user') ?> 
                                        <?php echo $this->html_m->table_header('address') ?> 
                                        <?php echo $this->html_m->table_header('area_name') ?> 
                                        <?php echo $this->html_m->table_header('town') ?> 
                                        <?php echo $this->html_m->table_header('name') ?> 
                                        <?php // echo $this->html_m->table_header('total_pretax') ?>
                                        <?php // echo $this->html_m->table_header('total_final') ?>
                                        <?php // echo $this->html_m->table_header('payment_status') ?>
                                        <?php // echo $this->html_m->table_header('payment_type') ?> 
                                        <?php } ?> 
                                                <th></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="18">
						<div class="inner"><?php $this->load->view('admin/partials/pagination'); ?><?php echo $total_rows ?> enregistrements</div> 
                                        
					</td>
				</tr>
			</tfoot>
			<tbody>
				<?php foreach( $appointments as $appointment ): ?>
				<tr>
					<td><?php echo form_checkbox('action_to[]', $appointment->id); ?></td>         
					<td>
                                            <a href="/admin/appointments/view/<?php echo $appointment->id; ?>" class="button">
                                                <?php echo str_pad($appointment->id, 4); ?>
                                            </a>
                                        </td>         
					<td>
                                            <a href="/admin/appointments?searchBtn=Search&appointment_status=<?php echo $appointment->appointment_status; ?>">
                                                <?php echo lang('appointments:status_'.$appointment->appointment_status); ?>
                                            </a>
                                        </td>
					<td>
                                <!--        <a href="/admin/appointments/list?searchBtn=Search&appointment_date=<?php echo $appointment->appointment_date; ?>" class="button">+</a>
                                            &nbsp;
                                            -->
                                            <a href="/admin/appointments?searchBtn=Search&appointment_date=<?php echo $appointment->appointment_date; ?>">
                                                    <?php // echo  $appointment->appointment_date ?> 
                                                    <?php  echo $this->appointments_m->datestr_to_day($appointment->appointment_date); ?>
                                            </a>
                                        </td> 
					<td><?php echo  $appointment->appointment_time ; ?></td> 

				<?php if (empty($this->input->get('view'))) 
				{ ?>        
					<td>
                                            <a href="/admin/users/edit/<?php echo $appointment->user_id; ?>" class="button">+</a> 
                                            <a href="/admin/appointments?searchBtn=Search&user_id=<?php echo $appointment->user_id; ?>"><?php echo str_pad($appointment->user_id, 4); ?>
                                            </a>
                                        </td>    
                                        <td>
                                            <a href="/admin/appointments?searchBtn=Search&doctor_id=<?php echo $appointment->doctor_id; ?>"><?php echo str_pad($appointment->doctor_id, 4); ?>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="/admin/appointments?searchBtn=Search&first_name=<?php echo $appointment->first_name ?>"><?php echo $appointment->first_name ?>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="/admin/appointments?searchBtn=Search&last_name=<?php echo $appointment->last_name ?>"><?php echo $appointment->last_name ?>
                                            </a>
                                        </td> 
                                        <td>
                                            <a href="/admin/appointments?searchBtn=Search&for_user=<?php echo $appointment->for_user ?>"><?php echo $appointment->for_user ?>
                                            </a>
                                        </td> 
                                        <td><?php echo $appointment->address; ?></td>
                                        <td><?php echo $appointment->area_name; ?></td>
                                        <td><?php echo $appointment->town; ?></td>
                                        <td><?php 
                                        echo $appointment->name ; ?></td>
                                        <!-- 
                                        <td><?php echo $appointment->total_pretax; ?></td>
					<td><?php echo $appointment->total_final; ?></td>
					<td>
                                            <a href="/admin/appointments?searchBtn=Search&payment_status=<?php echo $appointment->payment_status; ?>">
                                                    <?php echo lang('appointments:po_stat_'.$appointment->payment_status); ?>
                                            </a>
                                        </td> 
					<td>
                                            <a href="/admin/appointments?searchBtn=Search&payment_type=<?php echo $appointment->payment_type; ?>">
                                                    <?php echo lang('appointments:po_'.$appointment->payment_type); ?>
                                            </a>
                                        </td>
					
					<td></td> 
                                        -->
				<?php } ?> 
														
				<?php if ($this->input->get('view')=='invoice') 
				{ ?>
					<td><?php echo $appointment->i_company; ?></td>              
					<td><?php echo $appointment->maiden_name; ?></td>              
					<td><?php echo $appointment->phone; ?></td>      
					<td><?php echo $appointment->mobile; ?></td>            
					<td><?php echo $appointment->email; ?></td>   
					<td><?php echo $appointment->address; ?></td>         
					<td><?php echo $appointment->area_name; ?></td>         
                                        <td><?php echo $appointment->town; ?></td>
					<td><?php echo $appointment->total_pretax; ?>&nbsp;€</td>
					<td><?php echo $appointment->total_final; ?>&nbsp;€</td>
				<?php } ?>
				
                                        
                                        <!-- -->
                    <td class="actions">
						<?php 
						// echo anchor('appointments', lang('appointments:view'), 'class="button" target="_blank"');
						
                                                echo anchor('admin/appointments/edit/'.$appointment->id, lang('appointments:edit'), 'class="button"');
						// echo anchor('admin/appointments/delete/'.$appointment->id, 	lang('appointments:delete'), array('class'=>'button')); 
                                                ?>
					</td>
				</tr>
				<?php endforeach; ?>
			</tbody>
		</table>
    
		
		<div class="table_action_buttons">
			<?php $this->load->view('admin/partials/buttons', array('buttons' => array('delete'))); ?>
                    
                    <?php echo $this->html_m->form_dropdown_appointment_status($this->input->get('appointment_status'), 'style="position:relative;top:12px;"') ?>
                    <button class="btn blue" onclick="modify_list()">
                        <span><?php echo lang('appointments:modify'); ?></span>
                    </button>
                    
		</div>
		
	<?php else: ?>
		<div class="no_data"><?php echo lang('appointments:no_items'); ?></div>
	<?php endif;?>
	
	<?php echo form_close(); ?>
</section>