<!-- pro subdomain --> 
<div class="simple-header">
        <h3>
{{ user:display_name }}
        </h3>
                                                <!-- DEBUG
                                                
                                                -->
                                                pro_doctor_id:{{ msante:pro_doctor_id }}
                                                pro_has_no_doctor_id:{{msante:pro_has_no_doctor_id}}
                                                pro_has_no_setting:{{msante:pro_has_no_setting}}
</div>  
<section id="login">
    <div class="row-fluid">
        <?php if (validation_errors()): ?>      
            <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                            &times;
                    </button>
            <?php echo validation_errors(); ?>
            </div>
        <?php endif; ?>
        <div class="container">
            <?php echo form_open_multipart('', array('id'=>'user_edit', 'class' => 'crud_form')); ?>
                    <div class="span10 offset1 form-horizontal well">
                            <fieldset> 
                            <ul class="nav nav-tabs">
                                    <li class="active"><a href="#A" data-toggle="tab"><?php echo lang('user:details_section') ?></a></li>
                                    <li><a href="#B" data-toggle="tab"><?php echo lang('global:email') ?></a></li> 
                                    <li><a href="#C" data-toggle="tab">Coordonnées</a></li>  
                                    <li><a href="#D" data-toggle="tab">Réglages</a></li>  
                            </ul>
                            <div class="tabbable">
                                    <div class="tab-content">
                                            <div class="tab-pane active" id="A">
                                                    <div class="control-group">
                                                                    <label class="control-label" for="display_name"><?php echo lang('profile_display_name'); ?></label>
                                                        <div class="controls">
                                                            <?php echo form_input(array('name' => 'display_name', 'id' => 'display_name', 'value' => set_value('display_name', $display_name))); ?>
                                                        </div>
                                                    </div>  
                                                    <?php //display user fields for editing
                                                            // space separated field_slugs to display
                                                            $print = explode(' ', 'gender first_name last_name maiden_name birth_date'); 
                                                            foreach($print as $keep):  
                                                                //extract only wanted fields in order 
                                                                foreach($profile_fields as $field): 
                                                                    if($keep == $field['field_slug']) $print_fields[] = $field;
                                                                endforeach;
                                                            endforeach; 
                                                            //then loop HTML output 
                                                            foreach($print_fields as $field): 
                                                            $display = false;
                                                            if(in_array($field['field_slug'], $print))
                                                            {
                                                                $display = true;
                                                            }
                                                            if($field['input'] and $display): ?>
                                                                <div class="control-group">
                                                                                <label class="control-label" for="<?php echo $field['field_slug']; ?>"><?php echo (lang($field['field_name'])) ? lang($field['field_name']) : $field['field_name'];  ?><?php if ($field['required']) echo '<span>*</span>'; ?></label>
                                                                    <div class="controls">
                                                                        <?php echo $field['input']; ?>
                                                                        <p class="help-block"><?php if($field['instructions']) echo '<p class="instructions">'.$field['instructions'].'</p>'; ?></p>
                                                                    </div>
                                                                </div>		
                                                            <?php endif; ?>
                                                    <?php endforeach; ?>  
                                            </div>
                                            <div class="tab-pane" id="B"> 
                                                    <div class="control-group">
                                                        <label class="control-label" for="email"><?php echo lang('global:email') ?></label>
                                                        <div class="controls">
                                                            <?php echo form_input('email', $_user->email); ?>
                                                        </div>
                                                    </div>
                                                    <div class="control-group">
                                                        <label class="control-label" for="password"><?php echo lang('global:password') ?></label>
                                                        <div class="controls">
                                                                <?php echo form_password('password', '', 'autocomplete="off"'); ?>
                                                        </div>
                                                    </div> 
                                            </div>  
                                            <div class="tab-pane" id="C">   
                                                    <?php  
                                                            // space separated field_slugs to display
                                                            $print = explode(' ', 'district area_name town'); 
                                                            foreach($print as $keep):  
                                                                //extract only wanted fields in order 
                                                                foreach($profile_fields as $field): 
                                                                    if($keep == $field['field_slug']) $print_fields[] = $field;
                                                                endforeach;
                                                            endforeach; 
                                                            //then loop HTML output 
                                                            foreach($print_fields as $field): 
                                                            $display = false;
                                                            if(in_array($field['field_slug'], $print))
                                                            {
                                                                $display = true;
                                                            }
                                                            if($field['input'] and $display): ?>
                                                                <div class="control-group">
                                                                                <label class="control-label" for="<?php echo $field['field_slug']; ?>"><?php echo (lang($field['field_name'])) ? lang($field['field_name']) : $field['field_name'];  ?><?php if ($field['required']) echo '<span>*</span>'; ?></label>
                                                                    <div class="controls">
                                                                        <?php echo $field['input']; ?>
                                                                        <p class="help-block"><?php if($field['instructions']) echo '<p class="instructions">'.$field['instructions'].'</p>'; ?></p>
                                                                    </div>
                                                                </div>		
                                                            <?php endif; ?>
                                                    <?php endforeach; ?>   
                                                    <?php //************************************/ ?>   
                                                    <?php  
                                                            // space separated field_slugs to display
                                                            $print = explode(' ', 'mobile phone insurance'); 
                                                            foreach($print as $keep):  
                                                                //extract only wanted fields in order 
                                                                foreach($profile_fields as $field): 
                                                                    if($keep == $field['field_slug']) $print_fields[] = $field;
                                                                endforeach;
                                                            endforeach; 
                                                            //then loop HTML output 
                                                            foreach($print_fields as $field): 
                                                            $display = false;
                                                            if(in_array($field['field_slug'], $print))
                                                            {
                                                                $display = true;
                                                            }
                                                            if($field['input'] and $display): ?>
                                                                <div class="control-group">
                                                                                <label class="control-label" for="<?php echo $field['field_slug']; ?>"><?php echo (lang($field['field_name'])) ? lang($field['field_name']) : $field['field_name'];  ?><?php if ($field['required']) echo '<span>*</span>'; ?></label>
                                                                    <div class="controls">
                                                                        <?php echo $field['input']; ?>
                                                                        <p class="help-block"><?php if($field['instructions']) echo '<p class="instructions">'.$field['instructions'].'</p>'; ?></p>
                                                                    </div>
                                                                </div>		
                                                            <?php endif; ?>
                                                    <?php endforeach; ?> 
                                            </div>  
                                            <div class="tab-pane" id="D">    
                                                    <?php  
                                                            // space separated field_slugs to display
                                                            $print = explode(' ', 'settings_pro'); 
                                                            foreach($print as $keep):  
                                                                //extract only wanted fields in order 
                                                                foreach($profile_fields as $field): 
                                                                    if($keep == $field['field_slug']) $print_fields[] = $field;
                                                                endforeach;
                                                            endforeach; 
                                                            //then loop HTML output 
                                                            foreach($print_fields as $field): 
                                                            $display = false;
                                                            if(in_array($field['field_slug'], $print))
                                                            {
                                                                $display = true;
                                                            }
                                                            if($field['input'] and $display): ?>
                                                                <div class="control-group">
                                                                                <label class="control-label" for="<?php echo $field['field_slug']; ?>"><?php echo (lang($field['field_name'])) ? lang($field['field_name']) : $field['field_name'];  ?><?php if ($field['required']) echo '<span>*</span>'; ?></label>
                                                                    <div class="controls">
                                                                        <?php echo $field['input']; ?>
                                                                        <p class="help-block"><?php if($field['instructions']) echo '<p class="instructions">'.$field['instructions'].'</p>'; ?></p>
                                                                    </div>
                                                                </div>		
                                                            <?php endif; ?>
                                                    <?php endforeach; ?>  
                                            </div>  
                                    </div>
                            </div> <!-- /tabbable -->
                            <div style="margin-top: 5%" class="form-actions">


                            <?php // echo form_submit('btnSubmit', lang('profile_save_btn'), 'class="btn btn-primary"'); ?>
                            <?php echo form_submit('btnSubmit', 'Enregistrer mon profil', 'class="btn btn-primary"'); ?>
                            </div>
                    </fieldset>
                    </div>
            <?php echo form_close(); ?>
        </div>
    </div>
</section>
<script>
	jQuery('#user_edit input, #user_edit textarea, #user_edit select').addClass('form-control');
	jQuery('#user_edit input[type=radio]').removeClass('form-control');
	
</script>