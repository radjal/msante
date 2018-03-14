
<div  id="appointment-delete" class="appointment-form">
    <h2><?php echo lang('appointments:appointment_delete'); ?></h2>
	<?php echo form_open_multipart($this->uri->uri_string(), ''); ?>
		
		<div class="buttons" id="appointment-button-wrapper">
                    <?php echo form_submit('appointmentDelete', lang('appointments:appointment_delete'), 'class=""'); ?>
                </div>
        <?php echo form_close(); ?>

</div>
               
