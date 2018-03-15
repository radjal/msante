<section class="title">
	<h4><?php echo lang('calendar:calendars'); ?></h4>
</section>

<section class="item">
<div class="content">

	<?php if ($calendars['total'] > 0): ?>
	
		<table class="table" cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<th><?php echo lang('calendar:days'); ?></th>
					<th><?php echo lang('calendar:description'); ?></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($calendars['entries'] as $calendar): ?>
				<tr>
					<td><?php echo $calendar['days']; ?></td>
					<td><?php 
                                        echo $calendar['description']; ?></td>
					<td class="actions"><?php echo anchor('admin/calendar/edit/' . $calendar['id'], lang('global:edit'), 'class="button edit"'); ?>
                                            <?php echo anchor('admin/calendar/delete/' . $calendar['id'], lang('global:delete'), array('class' => 'confirm button delete')); ?>
                                        </td>
				</tr>
				<?php endforeach; ?>
			</tbody>
		</table>
		
		<?php echo $calendars['pagination']; ?>
		
	<?php else: ?>
		<div class="no_data"><?php echo lang('calendar:no_calendars'); ?></div>
	<?php endif;?>
	
</div>
</section>