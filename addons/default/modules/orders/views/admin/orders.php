<section class="title">
	<h4><?php echo lang('orders:details_list') ?></h4>
        <?php $this->load->view('admin/partials/search') ?>
</section>

<section class="item">
	<?php echo form_open('admin/orders/delete');?>
	
	<?php if (!empty($orders)): ?>
                <table>
			<thead>
				<tr>
                                    	<th><?php echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all'));?></th>
                                        <?php echo $this->html_m->table_header('id') ?>
                                        <?php echo $this->html_m->table_header('order_status') ?> 
                                        <?php echo $this->html_m->table_header('delivery_date') ?> 
                                        
                                        <?php if (empty($this->input->get('view'))) 
                                        { ?>
                                        <?php echo $this->html_m->table_header('name', lang('orders:name_alt')) ?>
                                        <?php echo $this->html_m->table_header('slug', lang('orders:slug_alt')) ?>
                                        <?php echo $this->html_m->table_header('user_id') ?>
					<?php echo $this->html_m->table_header('d_company') ?>
                                        <?php echo $this->html_m->table_header('d_fullname') ?>
                                        <?php echo $this->html_m->table_header('total_pretax') ?>
                                        <?php echo $this->html_m->table_header('total_final') ?>
                                        <?php echo $this->html_m->table_header('payment_status') ?>
                                        <?php echo $this->html_m->table_header('payment_type') ?>
                                        <?php echo $this->html_m->table_header('order_date') ?>
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
                                        <?php echo $this->html_m->table_header('i_fullname') ?>
                                        <?php echo $this->html_m->table_header('i_phone') ?>
                                        <?php echo $this->html_m->table_header('i_mobile') ?>
                                        <?php echo $this->html_m->table_header('i_mail') ?>
                                        <?php echo $this->html_m->table_header('i_street1') ?>
                                        <?php echo $this->html_m->table_header('i_zipcode') ?>
                                        <?php echo $this->html_m->table_header('i_town') ?>
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
				<?php foreach( $orders as $order ): ?>
				<tr>
					<td><?php echo form_checkbox('action_to[]', $order->id); ?></td>         
					<td>
                                            <a href="/admin/orders/view/<?php echo $order->id; ?>" class="button">
                                                <?php echo str_pad($order->id, 4); ?>
                                            </a>
                                        </td>         
					<td>
                                            <a href="/admin/orders?searchBtn=Search&order_status=<?php echo $order->order_status; ?>">
                                                <?php echo lang('orders:status_'.$order->order_status); ?>
                                            </a>
                                        </td>
					<td>
                                            <a href="/admin/orders/list?searchBtn=Search&delivery_date=<?php echo $order->delivery_date; ?>" class="button">+</a>&nbsp;<a href="/admin/orders?searchBtn=Search&delivery_date=<?php echo $order->delivery_date; ?>"><?php echo format_date($order->delivery_date, 'd/m/Y'); ?>
                                            </a>
                                        </td>

				<?php if (empty($this->input->get('view'))) 
				{ ?>               
                                        <td>
                                            <a href="/admin/orders?searchBtn=Search&name=<?php echo $order->name; ?>"><?php echo $order->name; ?></a>
                                        </td>           
                                        <td>
                                            <a href="/admin/orders?searchBtn=Search&slug=<?php echo $order->slug; ?>"><?php echo $order->slug; ?></a>
                                        </td>           
					<td>
                                            <a href="/admin/users/edit/<?php echo $order->user_id; ?>" class="button">+</a> 
                                            <a href="/admin/orders?searchBtn=Search&user_id=<?php echo $order->user_id; ?>"><?php echo str_pad($order->user_id, 4); ?>
                                            </a>
                                        </td>
					<td>
                                            <a href="/admin/orders?searchBtn=Search&d_company=<?php echo $order->d_company; ?>"><?php echo $order->d_company; ?></a>
                                            <?php //echo $order->d_company ; ?>
                                        </td> 
					<td>
                                            <a href="/admin/orders?searchBtn=Search&d_fullname=<?php echo $order->d_fullname; ?>"><?php echo $order->d_fullname; ?></a>
                                            <?php //echo $order->d_fullname; ?>
                                        </td>         
                                        <td><?php echo $order->total_pretax; ?></td>
					<td><?php echo $order->total_final; ?></td>
					<td>
                                            <a href="/admin/orders?searchBtn=Search&payment_status=<?php echo $order->payment_status; ?>">
                                                    <?php echo lang('orders:po_stat_'.$order->payment_status); ?>
                                            </a>
                                        </td> 
					<td>
                                            <a href="/admin/orders?searchBtn=Search&payment_type=<?php echo $order->payment_type; ?>">
                                                    <?php echo lang('orders:po_'.$order->payment_type); ?>
                                            </a>
                                        </td>
					<td><?php echo format_date($order->order_date, 'd/m/Y  H:m:s'); ?></td>
					
					<td></td> 
                                        <!-- 
					<td></td> 
                                        -->
				<?php } ?>

				<?php if ($this->input->get('view')=='delivery') 
				{ ?>
					<td>
                                            <a href="/admin/orders?searchBtn=Search&d_company=<?php echo $order->d_company; ?>">
                                                    <?php echo $order->d_company; ?>
                                            </a>
                                        </td>         
					<td>
                                            <a href="/admin/orders?searchBtn=Search&d_fullname=<?php echo $order->d_fullname; ?>">
                                                    <?php echo $order->d_fullname; ?>
                                            </a>
                                        </td>         
					<td>
                                            <a href="/admin/orders?searchBtn=Search&d_phone=<?php echo $order->d_phone; ?>">
                                                    <?php echo $order->d_phone; ?>
                                            </a>
                                        </td>      
					<td>
                                            <a href="/admin/orders?searchBtn=Search&d_mobile=<?php echo $order->d_mobile; ?>">
                                                   <?php echo $order->d_mobile; ?>
                                            </a>
                                        </td>            
					<td>
                                            <a href="/admin/orders?searchBtn=Search&d_mail=<?php echo $order->d_mail; ?>">
                                                    <?php echo $order->d_mail; ?>
                                            </a>
                                        </td>         
					<td><?php echo $order->d_street1; ?></td>         
					<td>
                                            <a href="/admin/orders?searchBtn=Search&d_zipcode=<?php echo $order->d_zipcode; ?>"> 
                                                    <?php echo $order->d_zipcode; ?>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="/admin/orders?searchBtn=Search&d_town=<?php echo $order->d_town; ?>"> 
                                                    <?php echo $order->d_town; ?>
                                            </a>
                                        </td>
					<td><?php echo $order->total_pretax; ?>&nbsp;€</td>
					<td><?php echo $order->total_final; ?>&nbsp;€</td>
				<?php } ?>
														
				<?php if ($this->input->get('view')=='invoice') 
				{ ?>
					<td><?php echo $order->i_company; ?></td>              
					<td><?php echo $order->i_fullname; ?></td>              
					<td><?php echo $order->i_phone; ?></td>      
					<td><?php echo $order->i_mobile; ?></td>            
					<td><?php echo $order->i_mail; ?></td>   
					<td><?php echo $order->i_street1; ?></td>         
					<td><?php echo $order->i_zipcode; ?></td>         
                                        <td><?php echo $order->i_town; ?></td>
					<td><?php echo $order->total_pretax; ?>&nbsp;€</td>
					<td><?php echo $order->total_final; ?>&nbsp;€</td>
				<?php } ?>
				
                                        
                                        <!-- -->
                    <td class="actions">
						<?php 
						// echo anchor('orders', lang('orders:view'), 'class="button" target="_blank"');
						echo anchor('admin/orders/edit/'.$order->id, lang('orders:edit'), 'class="button"');
						// echo anchor('admin/orders/delete/'.$order->id, 	lang('orders:delete'), array('class'=>'button')); 
                                                ?>
					</td>
				</tr>
				<?php endforeach; ?>
			</tbody>
		</table>
		
		<div class="table_action_buttons">
			<?php $this->load->view('admin/partials/buttons', array('buttons' => array('delete'))); ?>
                    
                    <?php echo $this->html_m->form_dropdown_order_status($this->input->get('order_status'), 'style="position:relative;top:12px;"') ?>
                    <button class="btn blue" onclick="modify_list()">
                        <span><?php echo lang('orders:modify'); ?></span>
                    </button>
                    
		</div>
		
	<?php else: ?>
		<div class="no_data"><?php echo lang('orders:no_items'); ?></div>
	<?php endif;?>
	
	<?php echo form_close(); ?>
</section>