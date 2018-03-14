<section class="title">
	<h4><?php echo lang('carte:cartes'); ?></h4>
</section>

<section class="item">
<div class="content">

	<?php if ($cartes['total'] > 0): ?>
	
		<table class="table" cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<th><?php echo lang('carte:days'); ?></th>
					<th><?php echo lang('carte:description'); ?></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($cartes['entries'] as $carte): ?>
				<tr>
					<td><?php echo $carte['days']; ?></td>
					<td><?php 
                                        echo $carte['description']; ?></td>
					<td class="actions"><?php echo anchor('admin/carte/edit/' . $carte['id'], lang('global:edit'), 'class="button edit"'); ?>
                                            <?php echo anchor('admin/carte/delete/' . $carte['id'], lang('global:delete'), array('class' => 'confirm button delete')); ?>
                                        </td>
				</tr>
				<?php endforeach; ?>
			</tbody>
		</table>
		
		<?php echo $cartes['pagination']; ?>
		
	<?php else: ?>
		<div class="no_data"><?php echo lang('carte:no_cartes'); ?></div>
	<?php endif;?>
	
</div>
</section>