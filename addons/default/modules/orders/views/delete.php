
<div  id="order-delete" class="order-form">
    <h2><?php echo lang('orders:order_delete'); ?></h2>
	<?php echo form_open_multipart($this->uri->uri_string(), ''); ?>
		
		<div class="buttons" id="order-button-wrapper">
                    <?php echo form_submit('orderDelete', lang('orders:order_delete'), 'class=""'); ?>
                </div>
        <?php echo form_close(); ?>

</div>
               
