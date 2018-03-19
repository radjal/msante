<section class="title">
	<h4><?php echo lang('appointments:products_list') ?></h4>
            <a class="btn orange" id="search-btn" onclick="$('#search').slideToggle()">Filter</a>

            <div id="search" style="display: none">
                <form method="get">
                        <button class="btn blue" type="submit" name="searchBtn" value="<?php echo lang('appointments:search') ?>" /><?php echo lang('appointments:search') ?></button>
                    <a class="btn gray" href="/admin/appointments/list"><?php echo lang('appointments:reset') ?></a>
                        <br/>
                        <?php echo $this->html_m->form_dropdown_appointment_status($this->input->get('appointment_status')) ?>
                        <br/>
                        <?php echo $this->html_m->form_radio_payment_type($this->input->get('payment_type')) ?>
                        <br/>
                        <?php echo $this->html_m->form_input('id', $this->input->get('id')) ?>
                        <?php echo $this->html_m->form_input('name', $this->input->get('name'),'', lang('appointments:name_alt')) ?>
                        <?php echo $this->html_m->form_input('slug', $this->input->get('slug'),'', lang('appointments:slug_alt')) ?>
                        <?php echo $this->html_m->form_input('appointment_date', $this->input->get('appointment_date')) ?> 
                        <?php echo $this->html_m->form_input('user_id', $this->input->get('user_id')) ?>
                        <?php echo $this->html_m->form_input('d_fullname', $this->input->get('d_fullname')) ?>
                        <?php echo $this->html_m->form_input('d_company', $this->input->get('d_company')) ?>
                        <?php echo $this->html_m->form_input('d_town', $this->input->get('d_town')) ?>
                        <?php echo $this->html_m->form_input('d_mail', $this->input->get('d_mail')) ?>
                        <?php echo $this->html_m->form_input('d_mobile', $this->input->get('d_mobile')) ?>
                        <?php echo $this->html_m->form_input('d_phone', $this->input->get('d_phone')) ?>
                        <?php // echo form_dropdown('payment_type', array('asc' => 'asc', 'desc' => 'desc') , $sortdir); ?>
                        <?php //echo $this->html_m->form_sort_fields_dropdown(); ?>
                        <?php echo form_hidden('view', $this->input->get('view')); // keep view ?>
                        <button class="btn blue" type="submit" name="searchBtn" value="<?php echo lang('appointments:search') ?>" /><?php echo lang('appointments:search') ?></button>
                    <a class="btn gray" href="/admin/appointments/list"><?php echo lang('appointments:reset') ?></a>
                </form>
            </div>
</section>

<section class="item">
	<div class="content">
	
	<?php if ($appointments): ?>

		<?php echo form_open('admin/appointments/list/delete') ?>

		<table bappointment="0" class="table-list" cellspacing="0">
			<thead>
			<tr>
				<!--<th width="20"><?php echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all')) ?></th>-->
				<?php echo $this->html_m->table_header('appointment_id') ?>
				<?php echo $this->html_m->table_header('slug') ?>
				<?php echo $this->html_m->table_header('appointment_date') ?>
				<?php echo $this->html_m->table_header('appointment_status') ?>                 
				<?php //echo $this->html_m->table_header('product_id') ?> 
				<?php echo $this->html_m->table_header('name') ?>              
				<?php echo $this->html_m->table_header('product_qty') ?>
				<?php echo $this->html_m->table_header('line_price') ?>
				<?php // echo $this->html_m->table_header('tax') ?>
				<?php // echo $this->html_m->table_header('final_price') ?>
				<?php echo $this->html_m->table_header('d_fullname') ?>
				<?php echo $this->html_m->table_header('maiden_name') ?>
				<?php echo $this->html_m->table_header('unit') ?>
				<?php echo $this->html_m->table_header('origin') ?>
				<?php // echo $this->html_m->table_header('image_filename') ?>
				<!--
                                <th></th>
                                -->
			</tr>
			</thead>			
                        <tfoot>
				<tr>
					<td colspan="11">
						<div class="inner"><?php $this->load->view('admin/partials/pagination'); ?><?php echo $total_rows ?> enregistrements</div> 
                                        
					</td>
				</tr>
			</tfoot>
			<tbody>
				<?php foreach ($appointments as $details): ?>
				<tr>
					<!--<td><?php echo form_checkbox('action_to[]', $details->id) ?></td>-->
                                               
                                        <td>
                                            <a href="/admin/appointments/list?searchBtn=Search&id=<?php echo $details->appointment_id; ?>">
                                                <?php echo $details->appointment_id; ?>
                                            </a>
                                        </td>             
					<td>
                                            <a href="/admin/appointments/list?searchBtn=Search&slug=<?php echo $details->slug; ?>">
                                                    <?php echo $details->slug ?>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="/admin/appointments/list?searchBtn=Search&appointment_date=<?php echo $details->appointment_date; ?>">
                                                    <?php echo format_date($details->appointment_date, 'd/m/Y'); ?>
                                            </a>
                                        </td>
					<td>
                                            <a href="/admin/appointments/list?searchBtn=Search&appointment_status=<?php echo $details->appointment_status; ?>">
                                                    <?php echo lang('appointments:status_'.$details->appointment_status) ?>
                                            </a>
                                        </td>
					<!--<td><?php echo $details->product_id ?></td>-->
					<td><?php echo $details->name ?></td>
					<td><?php echo $details->product_qty ?></td>
					<td><?php echo $details->line_price ?>&nbsp;€</td>
					<!--<td><?php echo $details->tax ?>&nbsp;%</td>
					<td><?php echo $details->final_price ?>&nbsp;€</td>-->
					<td>
                                            <a href="/admin/appointments/list?searchBtn=Search&d_fullname=<?php echo $details->d_fullname; ?>">
                                                    <?php echo $details->d_fullname ?>
                                            </a>
                                        </td>
					<td><?php echo $details->maiden_name ?></td>
					<td>
                                            <a href="/admin/appointments/list?searchBtn=Search&unit=<?php echo $details->unit; ?>">
                                                    <?php echo lang('appointments:unit_'.$details->unit) ?>
                                            </a>
                                        </td>
					<td><?php echo $details->origin ?></td>
                                        
                                        <!--
                                        <td>
                                        <img src="<?php echo site_url().UPLOAD_PATH.'products/'. $details->image_filename ?>" height="40px"/>
                                        </td>
                                        -->
                                        <!--
					<td class="align-center buttons buttons-small">
						<?php // echo anchor('admin/appointments/list/edit/'.$details->id, lang('global:edit'), 'class="button edit"') ?>
						<?php // echo anchor('admin/appointments/list/delete/'.$details->id, lang('global:delete'), 'class="confirm button delete"') ;?>
					</td> -->
				</tr>
				<?php endforeach ?>
			</tbody>
		</table>

		<?php // $this->load->view('admin/partials/pagination') ?>

		<div class="table_action_buttons">
		<?php // $this->load->view('admin/partials/buttons', array('buttons' => array('delete') )) ?>
		</div>

		<?php echo form_close() ?>

	<?php else: ?>
		<div class="no_data"><?php echo lang('appointments:no_list') ?></div>
	<?php endif ?>
	</div>
</section>