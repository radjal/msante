<section class="title">
	<h4><?php echo lang('token:item_list'); ?> on <?php echo date('l jS \of F Y h:i:s A'); ?> your IP : <?php echo $_SERVER['REMOTE_ADDR']; ?></h4>
        <?php $this->load->view('admin/search') ?>
</section>

<section class="item">
	<?php echo form_open('admin/token/delete');?>
	
	<?php if (!empty($items)): ?>
	
		<table>
			<thead>
				<tr>
					<th><?php echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all'));?></th>

                                        <?php echo $this->html_m->table_header('id') ?>
                                        <?php echo $this->html_m->table_header('token') ?>
                                        <?php echo $this->html_m->table_header('user_id') ?>
                                        <?php echo $this->html_m->table_header('ip') ?>
                                        <?php echo $this->html_m->table_header('user_agent') ?>
                                        <?php echo $this->html_m->table_header('counter') ?>
                                        <?php echo $this->html_m->table_header('timestamp') ?>
                                        <?php echo $this->html_m->table_header('alive') ?>
                                        <?php echo $this->html_m->table_header('expires') ?>
					<th></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="11">
						<div class="inner"><?php $this->load->view('admin/partials/pagination'); ?></div>
					</td>
				</tr>
			</tfoot>
			<tbody>
				<?php foreach( $items as $item ): ?>
				<tr>
					<td><?php echo form_checkbox('action_to[]', $item->id); ?></td>
					<td>
                                            <a href="/admin/token?searchBtn=Search&id=<?php echo $item->id; ?>">
                                                <?php echo $item->id; ?>
                                                    
                                            </a>
                                        </td>
					<td>
                                            <a href="/admin/token?searchBtn=Search&token=<?php echo $item->token; ?>">
                                                <?php echo $item->token; ?>
                                                    
                                            </a>
                                        </td>
					<td>
                                            <a href="/admin/token?searchBtn=Search&user_id=<?php echo $item->user_id; ?>">
                                                <?php echo $item->user_id; ?>
                                                    
                                            </a>
                                        </td>
					<td>
                                            <a href="/admin/token?searchBtn=Search&ip=<?php echo $item->ip; ?>">
                                                    <?php echo $item->ip; ?>
                                            </a>
                                        </td>
					<td>
                                            <a href="/admin/token?searchBtn=Search&user_agent=<?php echo urlencode( $item->user_agent); ?>">
                                              <?php echo $item->user_agent; ?>
                                            </a>
                                        </td>
					<td>
                                            <a href="/admin/token?searchBtn=Search&counter=<?php echo $item->counter; ?>">
                                                <?php echo $item->counter; ?>
                                                    
                                            </a>
                                        </td>
					<td>
                                            <a href="/admin/token?searchBtn=Search&timestamp=<?php echo $item->timestamp; ?>">
                                                <?php echo $item->timestamp; ?>
                                                    
                                            </a>
                                        </td>
					<td>
                                            <a href="/admin/token?searchBtn=Search&alive=<?php echo $item->alive; ?>">
                                                <?php echo $item->alive; ?>
                                            </a>
                                        </td>
					<td>
                                            <a href="/admin/token?searchBtn=Search&expires=<?php echo $item->expires; ?>">
                                                <?php echo $item->expires; ?>
                                            </a>
                                        </td>
                                                                              
                                        <td class="actions">
						<?php echo
						//anchor('token', lang('token:view'), 'class="button" target="_blank"').' '.
						//anchor('admin/token/edit/'.$item->id, lang('token:edit'), 'class="button"').' '.
						anchor('admin/token/delete/'.$item->id, lang('token:delete'), array('class'=>'button')); ?>
					</td>
				</tr>
				<?php endforeach; ?>
			</tbody>
		</table>
		
		<div class="table_action_buttons">
			<?php $this->load->view('admin/partials/buttons', array('buttons' => array('delete'))); ?>
                    
                    
                    <button formaction="admin/token/update" name="btnActivate" type="submit" value="1" class="button btn blue">
                            Alive = 1
                        </button>

                        <button formaction="admin/token/update" name="btnActivate" type="submit" value="0" class="button btn orange">
                             Alive = 0
                        </button>

		</div>
		
	<?php else: ?>
		<div class="no_data"><?php echo lang('token:no_items'); ?></div>
	<?php endif;?>
	
	<?php echo form_close(); ?>
</section>