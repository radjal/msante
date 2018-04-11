<section class="title">
	<h4>Categories</h4>
</section>

<section class="item">
<div class="content">

	<?php if ($total > 0): ?>

            <?php echo $this->load->view('admin/partials/filters-categories') ?>


		<table class="table" cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<th>Id</th>
					<th>Parent</th>
					<th>Spécialité</th> 
					<th>Image</th> 
					<th></th>
				</tr>
			</thead>
			<tbody>
				<?php 
                                foreach ($categories as $cat): ?>
				<tr>
                                    <td>
                                        <a href="<?= site_url() ?>admin/doctor/categories/index?searchBtn=Search&doctor_id=<?= $cat['id']; ?>"><?= $cat['id']; ?></a>
                                    </td> 
                                    <td>
                                        <?= $cat['parent_cat']['id']; ?>
                                        <!--<a href="<?= site_url() ?>admin/doctor/categories/index?searchBtn=Search&f_parent_cat=<?= $cat['parent_cat']['id']; ?>"><?= $cat['parent_cat']['id']; ?></a>-->
                                    </td> 
                                    <td>
                                        <?= $cat['speciality']; ?>
                                        <!--<a href="<?= site_url() ?>admin/doctor/categories/index?searchBtn=Search&f_speciality=<?= $cat['speciality']; ?>"><?= $cat['speciality']; ?></a>-->
                                    </td> 
                                    <td><?= isset($cat['filename']) ? $cat['filename'] : ''; ?> </td> 
                                    <td>
                                        	<?php echo anchor('admin/doctor/categories/categories/edit/' . $cat['id'], lang('global:edit'), 'class="button edit"'); ?>
						<?php echo anchor('admin/doctor/categories/categories/delete/' . $cat['id'], lang('global:delete'), array('class' => 'confirm button delete')); ?>
					</td>
				</tr>
				<?php endforeach; ?>
			</tbody>
		</table>
		
		<?php echo $pagination ?>
		
	<?php else: ?>
		<div class="no_data"><?php echo lang('doctor:no_doctors'); ?></div>
	<?php endif;?>
	
</div>
</section>