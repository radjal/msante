<section class="title">
	<!-- We'll use $this->method to switch between token.create & token.edit -->
	<h4><?php echo lang('token:'.$this->method); ?></h4>
</section>

<section class="item">

	<?php echo form_open_multipart('admin/token/edit/'.$token->id, 'class="crud"'); ?>
		
		<div class="form_inputs">
	
			<ul>

				<li class="<?php echo alternator('', 'odd'); ?>">
					<label for="id"><?php echo lang('token:id'); ?> <span>*</span></label>
					<div class="input"><?php echo form_input('id', set_value('id', $token->id), 'class="width-15"'); ?></div>
				</li>
							
				<li class="<?php echo alternator('', 'even'); ?>">
					<label for="user_id"><?php echo lang('token:user_id'); ?> <span>*</span></label>
					<div class="input"><?php echo form_input('user_id', set_value('user_id', $token->user_id), 'class="width-15"'); ?></div>
				</li>

				<li class="<?php echo alternator('', 'odd'); ?>">
					<label for="ip"><?php echo lang('token:ip'); ?> <span>*</span></label>
					<div class="input"><?php echo form_input('ip', set_value('ip', $token->ip), 'class="width-15"'); ?></div>
				</li>

				<li class="<?php echo alternator('', 'even'); ?>">
					<label for="alive"><?php echo lang('token:alive'); ?> <span>*</span></label>
					<div class="input"><?php echo form_input('alive', set_value('alive', $token->alive), 'class="width-15"'); ?></div>
				</li>
				
			</ul>
			
		</div>
		
		<div class="buttons">
			<?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel') )); ?>
		</div>
		
	<?php echo form_close(); ?>

</section>
