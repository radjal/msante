<div class="panel panel-danger">
    <div class="panel-heading">
      <h3 class="panel-title">Souhaitez-vous annuler le RDV du ... à ...</h3>
    </div>
    <div class="panel-body">
        <p>
            
      FICHE DOCTEUR ...
        </p>
          <?php echo form_submit('appointmentDelete', 'OUI', 'class="btn btn-danger"'); ?> 
      <button class="btn btn-success" type="button" onclick="window.history.back();">NON</button>
    </div>
</div>


<!--

<div  id="appointment-delete" class="appointment-form">
    <h2><?php echo lang('appointments:appointment_delete'); ?></h2>
	<?php echo form_open_multipart($this->uri->uri_string(), ''); ?>
		
		<div class="buttons" id="appointment-button-wrapper">
                    <?php echo form_submit('appointmentDelete', lang('appointments:appointment_delete'), 'class=""'); ?>
                </div>
        <?php echo form_close(); ?>

</div>-->
               
