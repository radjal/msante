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
                                        <?php echo $this->html_m->table_header('delivery_date') ?> 
                                        
                                        <?php if (empty($this->input->get('view'))) 
                                        { ?>
                                        <?php echo $this->html_m->table_header('name', lang('appointments:name_alt')) ?>
                                        <?php echo $this->html_m->table_header('slug', lang('appointments:slug_alt')) ?>
                                        <?php echo $this->html_m->table_header('user_id') ?>
					<?php echo $this->html_m->table_header('d_company') ?>
                                        <?php echo $this->html_m->table_header('d_fullname') ?>
                                        <?php echo $this->html_m->table_header('total_pretax') ?>
                                        <?php echo $this->html_m->table_header('total_final') ?>
                                        <?php echo $this->html_m->table_header('payment_status') ?>
                                        <?php echo $this->html_m->table_header('payment_type') ?>
                                        <?php echo $this->html_m->table_header('appointment_date') ?>
                                                <th></th>
                                        <?php } ?>
                                        
                                        
                                        <?php if ($this->input->get('view')=='delivery') 
                                        { ?>
                                        <?php echo $this->html_m->table_header('d_company') ?>
                                        <?php echo $this->html_m->table_header('d_fullname') ?>
                                        <?php echo $this->html_m->table_header('d_phone') ?>
                                        <?php echo $this->html_m->table_header('d_mobile') ?>
                                        <?php echo $this->html_m->table_header('d_mail') ?>
                                        <?php echo $this->html_m->table_header('d_street1') ?>
                                        <?php echo $this->html_m->table_header('d_zipcode') ?>
                                        <?php echo $this->html_m->table_header('d_town') ?>
                                        <?php echo $this->html_m->table_header('total_pretax') ?>
                                        <?php echo $this->html_m->table_header('total_final') ?>
                                        <?php } ?>
                                        
                                        <?php if ($this->input->get('view')=='invoice') 
                                        { ?>
                                        <?php echo $this->html_m->table_header('i_company') ?>
                                        <?php echo $this->html_m->table_header('maiden_name') ?>
                                        <?php echo $this->html_m->table_header('phone') ?>
                                        <?php echo $this->html_m->table_header('mobile') ?>
                                        <?php echo $this->html_m->table_header('email') ?>
                                        <?php echo $this->html_m->table_header('address') ?>
                                        <?php echo $this->html_m->table_header('area_name') ?>
                                        <?php echo $this->html_m->table_header('town') ?>
                                        <?php echo $this->html_m->table_header('total_pretax') ?>
                                        <?php echo $this->html_m->table_header('total_final') ?>
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
                                            <a href="/admin/appointments/list?searchBtn=Search&delivery_date=<?php echo $appointment->delivery_date; ?>" class="button">+</a>&nbsp;<a href="/admin/appointments?searchBtn=Search&delivery_date=<?php echo $appointment->delivery_date; ?>"><?php echo format_date($appointment->delivery_date, 'd/m/Y'); ?>
                                            </a>
                                        </td>

				<?php if (empty($this->input->get('view'))) 
				{ ?>               
                                        <td>
                                            <a href="/admin/appointments?searchBtn=Search&name=<?php echo $appointment->name; ?>"><?php echo $appointment->name; ?></a>
                                        </td>           
                                        <td>
                                            <a href="/admin/appointments?searchBtn=Search&slug=<?php echo $appointment->slug; ?>"><?php echo $appointment->slug; ?></a>
                                        </td>           
					<td>
                                            <a href="/admin/users/edit/<?php echo $appointment->user_id; ?>" class="button">+</a> 
                                            <a href="/admin/appointments?searchBtn=Search&user_id=<?php echo $appointment->user_id; ?>"><?php echo str_pad($appointment->user_id, 4); ?>
                                            </a>
                                        </td>
					<td>
                                            <a href="/admin/appointments?searchBtn=Search&d_company=<?php echo $appointment->d_company; ?>"><?php echo $appointment->d_company; ?></a>
                                            <?php //echo $appointment->d_company ; ?>
                                        </td> 
					<td>
                                            <a href="/admin/appointments?searchBtn=Search&d_fullname=<?php echo $appointment->d_fullname; ?>"><?php echo $appointment->d_fullname; ?></a>
                                            <?php //echo $appointment->d_fullname; ?>
                                        </td>         
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
					<td><?php echo format_date($appointment->appointment_date, 'd/m/Y  H:m:s'); ?></td>
					
					<td></td> 
                                        <!-- 
					<td></td> 
                                        -->
				<?php } ?>

				<?php if ($this->input->get('view')=='delivery') 
				{ ?>
					<td>
                                            <a href="/admin/appointments?searchBtn=Search&d_company=<?php echo $appointment->d_company; ?>">
                                                    <?php echo $appointment->d_company; ?>
                                            </a>
                                        </td>         
					<td>
                                            <a href="/admin/appointments?searchBtn=Search&d_fullname=<?php echo $appointment->d_fullname; ?>">
                                                    <?php echo $appointment->d_fullname; ?>
                                            </a>
                                        </td>         
					<td>
                                            <a href="/admin/appointments?searchBtn=Search&d_phone=<?php echo $appointment->d_phone; ?>">
                                                    <?php echo $appointment->d_phone; ?>
                                            </a>
                                        </td>      
					<td>
                                            <a href="/admin/appointments?searchBtn=Search&d_mobile=<?php echo $appointment->d_mobile; ?>">
                                                   <?php echo $appointment->d_mobile; ?>
                                            </a>
                                        </td>            
					<td>
                                            <a href="/admin/appointments?searchBtn=Search&d_mail=<?php echo $appointment->d_mail; ?>">
                                                    <?php echo $appointment->d_mail; ?>
                                            </a>
                                        </td>         
					<td><?php echo $appointment->d_street1; ?></td>         
					<td>
                                            <a href="/admin/appointments?searchBtn=Search&d_zipcode=<?php echo $appointment->d_zipcode; ?>"> 
                                                    <?php echo $appointment->d_zipcode; ?>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="/admin/appointments?searchBtn=Search&d_town=<?php echo $appointment->d_town; ?>"> 
                                                    <?php echo $appointment->d_town; ?>
                                            </a>
                                        </td>
					<td><?php echo $appointment->total_pretax; ?>&nbsp;€</td>
					<td><?php echo $appointment->total_final; ?>&nbsp;€</td>
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