<section class="title">
	<h4><?php echo lang('products:category_list') ?></h4>
</section>

<section class="item">
	<div class="content">
	
	<?php if ($categories): ?>

		<?php echo form_open('admin/products/categories/delete') ?>

		<table border="0" class="table-list" cellspacing="0">
			<thead>
			<tr>
				<th width="20"><?php echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all')) ?></th>
				<?php echo $this->html_m->table_header('id') ?>
                                <?php //echo $this->html_m->table_header('parent_id') ?>
                                <?php echo $this->html_m->table_header('name') ?>
				<th><?php echo lang('global:slug') ?></th>
				<th></th>
			</tr>
			</thead>
			<tbody>
				<?php foreach ($categories as $category): ?>
				<tr>
					<td><?php echo form_checkbox('action_to[]', $category->id) ?></td>
					<td><?php echo $category->id ?></td>
					<!-- <td><?php echo $category->parent_id ?></td> -->
					<td>
                                            <a href="/admin/products?searchBtn=Search&cat_id=<?php echo $category->id; ?>">
                                            <?php echo $category->name ?>
                                            </a>
                                        </td>
                                        <td><?php echo $category->slug ?></td>
					<td class="align-center buttons buttons-small">
						<?php echo anchor('admin/products/categories/edit/'.$category->id, lang('global:edit'), 'class="button edit"') ?>
						<?php //echo anchor('admin/products/categories/delete/'.$category->id, lang('global:delete'), 'class="confirm button delete"') ;?>
					</td>
				</tr>
				<?php endforeach ?>
			</tbody>
		</table>

		<?php $this->load->view('admin/partials/pagination') ?>

		<div class="table_action_buttons">
		<?php $this->load->view('admin/partials/buttons', array('buttons' => array('delete') )) ?>
		</div>

		<?php echo form_close() ?>

	<?php else: ?>
		<div class="no_data"><?php echo lang('products:no_categories') ?></div>
	<?php endif ?>
	</div>
</section>