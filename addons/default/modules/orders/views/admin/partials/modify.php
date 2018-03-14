<?php echo $msg ; ?>
<?php echo form_open_multipart($this->uri->uri_string(), ''); ?>

<div  id="order-modify" class="order-form">
		<div class="buttons" id="order-button-wrapper">
                    <?php echo form_submit('btnAction', lang('orders:order_modify'), 'class=""'); ?>
                </div>
<?php
    echo form_hidden('confirm', 'confirmed');
    echo form_hidden('order_status', $this->input->post('order_status'));
    if(isset($_POST['action_to']) AND is_array($_POST['action_to'])) 
    {
        echo form_hidden('action_to', $this->input->post('action_to'));
        echo implode('<br/>', $this->input->post('action_to'));
    }
?>
</div>
<?php echo form_close(); ?>
               
