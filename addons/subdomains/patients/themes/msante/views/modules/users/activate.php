<div class="col-lg-4 col-lg-offset-4 col-sm-6 col-sm-offset-3 well" style="margin-top: 5%">

    <style>
    #activate-user > ul > li { list-style: none;}    
    #activate-user > ul { padding: 0;}    
    </style>

    <h2 class="page-title" id="page_title"><?php echo lang('user:register_header') ?></h2>

    <div class="workflow_steps">
            <span id="active_step"><?php echo lang('user:register_step1') ?></span> &gt;
            <span><?php echo lang('user:register_step2') ?></span>
    </div>

    <?php if(!empty($error_string)): ?>
    <div class="error-box">
            <?php echo $error_string ?>
    </div>
    <?php endif;?>
    <?php echo form_open('users/activate', 'id="activate-user"') ?>
    <ul>
            <li>
                    <label for="email"><?php echo lang('global:email') ?></label>
                    <?php echo form_input('email', isset($_user['email']) ? escape_tags($_user['email']) : '', 'maxlength="40"');?>
            </li>

            <li>
                    <label for="activation_code"><?php echo lang('user:activation_code') ?></label>
                    <?php echo form_input('activation_code', '', 'maxlength="40"');?>
            </li>

            <li>
                    <?php echo form_submit('btnSubmit', lang('user:activate_btn'), 'class="btn btn-primary" style="margin-top:10px"') ?>
            </li>
    </ul>
    <?php echo form_close() ?>

</div>
<script>
	jQuery('#activate-user input[type=text], #activate-user input[type=password]').addClass('form-control');
	
</script>