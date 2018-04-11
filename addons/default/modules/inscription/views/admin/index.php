<section class="title">
	<h4><?php echo lang('inscription:inscriptions'); ?></h4>
</section>

<section class="item">
<div class="content">

	<?php if ($inscriptions['total'] > 0): ?>
	
		<table class="table" cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<th><?php echo lang('inscription:days'); ?></th>
					<th><?php echo lang('inscription:description'); ?></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($inscriptions['entries'] as $inscription): ?>
				<tr>
					<td><?php echo $inscription['days']; ?></td>
					<td><?php 
                                        echo $inscription['description']; ?></td>
					<td class="actions"><?php echo anchor('admin/inscription/edit/' . $inscription['id'], lang('global:edit'), 'class="button edit"'); ?>
                                            <?php echo anchor('admin/inscription/delete/' . $inscription['id'], lang('global:delete'), array('class' => 'confirm button delete')); ?>
                                        </td>
				</tr>
				<?php endforeach; ?>
			</tbody>
		</table>
		
		<?php echo $inscriptions['pagination']; ?>
		
	<?php else: ?>
		<div class="no_data"><?php echo lang('inscription:no_inscriptions'); ?></div>
	<?php endif;?>
	
</div>
</section>