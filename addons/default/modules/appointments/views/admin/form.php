<?php 
$disabled = '';
if($disabled)  $disabled='disabled';
?>
<section class="title">
	<!-- We'll use $this->method to switch between appointments.create & appointments.edit -->
	<h4><?php echo lang('appointments:'.$this->method); ?></h4>
        
	<?php if($disabled) echo '( Modification interdite )'; ?>
        <?php //if(!$disabled) $this->load->view('admin/partials/buttons', array('buttons' => array('save') )); ?>
        
        <a href="<?php base_url() ?>/admin/appointments/print_appointment/<?php echo $this->uri->segment(4) ?>" class="btn gray" target="_blank"><?php echo lang('appointments:print') ?></a>
</section>

<section class="item" >

	<?php if(!$disabled) echo form_open_multipart($this->uri->uri_string(), 'class="crud"'); ?>
		
    <div id="form_inputs" style="">
<!--        <div class="tabs"></div>
        <ul class="tab-menu">
          <li><a href="#appointment-details"><?php echo lang('appointments:appointment'); ?></a></li>
          <li><a href="#appointment-patient"><?php echo lang('appointments:appointment_patient'); ?></a></li>   
        </ul>
-->

	<div  id="appointment-details">
            <h2><?php echo lang('appointments:appointment_details'); ?></h2>
		<ul>
<!--                            <li class="<?php echo alternator('', 'even'); ?>">
                                        <?php // echo $this->html_m->form_input('name', $appointment->name, $disabled ); ?>
                                        <?php // echo $this->html_m->form_input('slug', $appointment->slug, $disabled ); ?>
                            </li> 
                            -->
                            <li class="<?php echo alternator('', 'even'); ?>">
                                        <?php echo $this->html_m->form_input('user_id', $appointment->user_id, $disabled ); ?>
                                        <?php echo $this->html_m->form_input('doctor_id', $appointment->doctor_id, $disabled ); ?>
                            </li> 

                            <li class="<?php echo alternator('', 'even'); ?>">
                                        <?php echo $this->html_m->form_input('appointment_date', $appointment->appointment_date, $disabled ); ?>
                                        <?php echo $this->html_m->form_input('appointment_time', $appointment->appointment_time, $disabled ); ?>
                            </li>		

                            <li class="<?php echo alternator('', 'even'); ?>">
                                        <?php echo $this->html_m->form_input('for_user', $appointment->for_user, $disabled ); ?> 
                            </li>		
                            
                            <li class="<?php echo alternator('', 'even'); ?>">
                                        <label for="message"><?php echo lang('appointments:message'); ?></label>
                                        <?php echo form_textarea('message', $appointment->message, $disabled ); ?>
                            </li>		
<!--                                    
                            <li class="<?php echo alternator('', 'even'); ?>">
                                <div class="input">
                                        <label for="appointment_status"><?php echo lang('appointments:appointment_status'); ?></label>
                                        <?php echo $this->html_m->form_dropdown_appointment_status($appointment->appointment_status, $disabled); ?>
                                </div>
                                <div class="input">
                                        <label for="payment_status"><?php echo lang('appointments:payment_status'); ?></label>
                                        <?php echo $this->html_m->form_radio_payment_status($appointment->payment_status, $disabled); ?>
                                </div>
                                <div class="input">
                                        <label for="payment_type"><?php echo lang('appointments:payment_type'); ?></label>
                                        <?php echo $this->html_m->form_radio_payment_type($appointment->payment_type, $disabled); ?>
                                </div>
                            </li>
                            <li class="<?php echo alternator('', 'even'); ?>">
                                        <?php echo $this->html_m->form_input('total_pretax', $appointment->total_pretax, $disabled ); ?>
                                        <?php echo $this->html_m->form_input('total_final', $appointment->total_final, $disabled ); ?>
                            </li>
                            -->
		</ul>
	 </div> 
	<div  id="appointment-patient">
            <h2><?php echo lang('appointments:appointment_patient'); ?></h2> 
		<ul>										
                            <li class="<?php echo alternator('', 'even'); ?>"> 
                                    <?php echo $this->html_m->form_input('first_name', $appointment->first_name, $disabled ); ?>
                                    <?php echo $this->html_m->form_input('last_name', $appointment->last_name, $disabled ); ?>
                                    <?php echo $this->html_m->form_input('maiden_name', $appointment->maiden_name, $disabled ); ?>
                                    <?php echo $this->html_m->form_input('mobile', $appointment->mobile, $disabled ); ?>
                                    <?php echo $this->html_m->form_input('phone', $appointment->phone, $disabled ); ?>
                                    <?php echo $this->html_m->form_input('email', $appointment->email, $disabled ); ?>
                            </li>
                            <li class="<?php echo alternator('', 'even'); ?>">
                                    <?php echo $this->html_m->form_input('address', $appointment->address, $disabled ); ?> 
                                    <?php echo $this->html_m->form_input('town', $appointment->town, $disabled ); ?>
                                    <?php echo $this->html_m->form_input('area_name', $appointment->area_name, $disabled ); ?> 
                            </li>
		</ul>
	 </div>  
        
                <?php $this->load->view('admin/partials/doctor')  ?>
        <?php if(!$disabled) :?>
        <div class="buttons" style="clear:both">
			<?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel') )); ?>
        </div>
	<?php endif; ?>

    </div>         		
	<?php if(!$disabled) echo form_close(); ?>
 
</section>
