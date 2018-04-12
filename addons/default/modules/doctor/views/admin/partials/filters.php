<fieldset id="filters">
	<legend><?php echo lang('global:filters') ?></legend>

	<?php echo form_open('', '', array('f_module' => $module_details['slug'])) ?>
		<ul>
<!--			<li class="">
                            <label for="f_status"><?php echo lang('doctor:status_label') ?></label>
                            <?php echo form_dropdown('f_', array(0 => lang('global:select-all'), 'draft'=>lang('doctor:draft_label'), 'live'=>lang('doctor:live_label'))) ?>
                        </li> -->

                        <li class="">
                                <label for="f_id">ID</label>
                                <?php echo form_input('f_id', '', 'class=""') ?>
                        </li>

                        <li class="">
                                <label for="f_name">Nom</label>
                                <?php echo form_input('f_name', '', 'class=""') ?>
                        </li>

                        <li class="">
                                <label for="f_town">Ville</label>
                                <?php echo form_input('f_town', '', 'class=""') ?>
                        </li>

                        <li class="">
                                <label for="f_validated">f_validated yes/no</label>
                                <?php echo form_input('f_validated', '', 'class=""') ?>
                        </li>

                        <li class="">
                            <?php // echo form_submit('Rechercher','Rechercher', 'class="btn red"'); ?>
                            <?php echo form_button('Rechercher','Rechercher', 'onclick="form.submit()" class="btn blue"'); ?>
                                <?php echo anchor(current_url() . '?', 'Re-initialiser', 'class="btn red"') ?>
                        </li>
		</ul>
	<?php echo form_close() ?>
</fieldset>
