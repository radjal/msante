<fieldset id="filters">
	<legend><?php echo lang('global:filters') ?></legend>

	<?php echo form_open('', '', array('f_module' => $module_details['slug'])) ?>
		<ul>  

                        <li class="">
                                <label for="f_parent_cat">Id parent</label>
                                <?php echo form_input('f_parent_cat', $this->input->post('f_parent_cat'), 'class=""') ?>
                        </li>

                        <li class="">
                                <label for="f_speciality">f_speciality </label>
                                <?php echo form_input('f_speciality', $this->input->post('f_speciality'), 'class=""') ?>
                        </li>

                        <li class=""> 
                            <?php echo form_button(array(name=>'Rechercher', type=>'submit'),'Rechercher', 'onclick="form.submit()" class="btn blue"'); ?>
                                <?php echo anchor(current_url() . '?', 'Re-initialiser', 'class="btn red"') ?>
                        </li>
		</ul>
	<?php echo form_close() ?>
</fieldset>
