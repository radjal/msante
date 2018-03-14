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
        <div class="tabs"></div>
        <ul class="tab-menu">
          <li><a href="#appointment-details"><?php echo lang('appointments:appointment'); ?></a></li>
          <li><a href="#appointment-invoice"><?php echo lang('appointments:appointment_invoice'); ?></a></li>
          <li><a href="#appointment-delivery"><?php echo lang('appointments:appointment_delivery'); ?></a></li>
          <!-- <li><a href="#appointment-cart">Cart</a></li> -->
          <li><a href="#appointment-extra"><?php echo lang('appointments:log'); ?></a></li>
        </ul>
	<div  id="appointment-details">
            <h2><?php echo lang('appointments:appointment_details'); ?></h2>
		<ul>
					<li class="<?php echo alternator('', 'even'); ?>">
                                                                        <?php echo $this->html_m->form_input('name', $appointment->name, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('slug', $appointment->slug, $disabled ); ?>
					</li>
					
					
					<li class="<?php echo alternator('', 'even'); ?>">
							<div class="input">
									<label for="appointment_status"><?php echo lang('appointments:appointment_status'); ?></label>
									<?php
                                                                        echo $this->html_m->form_dropdown_appointment_status($appointment->appointment_status, $disabled); ?>
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

                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <?php echo $this->html_m->form_input('delivery_date', $appointment->delivery_date, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('appointment_date', $appointment->appointment_date, $disabled ); ?>
                                                        </li>		

                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <label for="message"><?php echo lang('appointments:message'); ?></label>
                                                                        <?php echo form_textarea('message', $appointment->message, $disabled ); ?>
                                                        </li>		
		</ul>
	 </div> 
	<div  id="appointment-invoice">
            <h2><?php echo lang('appointments:appointment_invoice'); ?></h2>
							
		<ul>										
                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <?php echo $this->html_m->form_input('i_company', $appointment->i_company, $disabled) ; ?>
                                                                        <?php echo $this->html_m->form_input('i_fullname', $appointment->i_fullname, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('i_mobile', $appointment->i_mobile, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('i_phone', $appointment->i_phone, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('i_mail', $appointment->i_mail, $disabled ); ?>
                                                        </li>		

                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <?php echo $this->html_m->form_input('i_street1', $appointment->i_street1, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('i_street2', $appointment->i_street2, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('i_town', $appointment->i_town, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('i_zipcode', $appointment->i_zipcode, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('i_country', $appointment->i_country, $disabled ); ?>
                                                        </li>	
		</ul>
	 </div> 
	<div  id="appointment-delivery">
            <h2><?php echo lang('appointments:appointment_delivery'); ?></h2>
		<ul>	
                    
                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <?php echo $this->html_m->form_input('d_company', $appointment->d_company, $disabled) ; ?>
                                                                        <?php echo $this->html_m->form_input('d_fullname', $appointment->d_fullname, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('d_mobile', $appointment->d_mobile, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('d_phone', $appointment->d_phone, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('d_mail', $appointment->d_mail, $disabled ); ?>
                                                        </li>	
                                                        
                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <?php echo $this->html_m->form_input('d_street1', $appointment->d_street1, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('d_street2', $appointment->d_street2, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('d_town', $appointment->d_town, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('d_zipcode', $appointment->d_zipcode, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('d_country', $appointment->d_country, $disabled ); ?>
                                                        </li>	
                                                        
                                                        <li>
                                                                        <div id="map"></div>

                                                        </li>
		</ul>
	 </div> 
        <div  id="appointment-extra">
            <h2><?php echo lang('appointments:appointment_log'); ?></h2>
		<ul>										
									
                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <label for="log"><?php echo lang('appointments:log'); ?></label>
                                                                        <?php echo form_textarea('log', $appointment->log, $disabled ); ?>
                                                        </li>		
								
					<?php if(isset($appointment->updated_on)) { ?>
                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                <div class="input">
                                                                        <label for="updated_on"><?php echo lang('appointments:updated_on'); ?></label>
                                                                        <?php if(!empty($appointment->updated_on)) echo $appointment->updated_on ?>
                                                                        <?php echo form_hidden('updated_on', $appointment->updated_on ) ?>
                                                                </div>
                                                        </li>
								<?php } ?>
					<?php if(isset($appointment->created_on)) { ?>
                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                <div class="input">
                                                                            <label for="created_on"><?php echo lang('appointments:created_on'); ?></label>
                                                                            <?php if(!empty($appointment->created_on)) echo $appointment->created_on ?>
                                                                            <?php echo form_hidden('created_on', $appointment->created_on ) ?>
                                                                </div>
                                                        </li>
								<?php } ?>
				</ul>
		
		</div>
        <?php if(!$disabled) :?>
        <div class="buttons" style="clear:both">
			<?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel') )); ?>
        </div>
	<?php endif; ?>

    </div>         		
	<?php if(!$disabled) echo form_close(); ?>

        <!-- appointment-cart -->
        <div id="appointment-cart" class="ajax-cart hidden">
                <table>
                    <thead>
                            <tr>
                                <?php echo $this->html_m->table_header('product_id', false, 'admin/appointments/list/appointment/'.$this->uri->segment(4) ) ?> 
                                <?php // echo $this->html_m->table_header('name', false, 'admin/appointments/list/appointment/'.$this->uri->segment(4) ) ?>              
                                <?php // echo $this->html_m->table_header('product_qty', false, 'admin/appointments/list/appointment/'.$this->uri->segment(4) ) ?>
                                <?php // echo $this->html_m->table_header('line_price', false, 'admin/appointments/list/appointment/'.$this->uri->segment(4) ) ?>
                                <?php // echo $this->html_m->table_header('tax', false, 'admin/appointments/list/appointment/'.$this->uri->segment(4) ) ?>
                                <?php // echo $this->html_m->table_header('final_price', false, 'admin/appointments/list/appointment/'.$this->uri->segment(4) ) ?>
                                <?php // echo $this->html_m->table_header('unit', false, 'admin/appointments/list/appointment/'.$this->uri->segment(4) ) ?>
                                <?php // echo $this->html_m->table_header('origin', false, 'admin/appointments/list/appointment/'.$this->uri->segment(4) ) ?>
                                <?php //echo $this->html_m->table_header('image_filename', false, 'admin/appointments/list/appointment/'.$this->uri->segment(4) ) ?>
                                <th></th>
                            </tr>
                    </thead>
                    <tbody>
                            <?php 
                            $items = 0; // hack for knowing when to show cancel button
                            foreach( $cartlist as $product ): ?>
                                    <?php $items += $product['appointment_qty'] ?>
                                    <tr>                            
                                            <td><?php echo $product['name']; ?></td>                                                  
                                            <td><?php echo $product['input_html']; ?></td>                                  
                                            <td><?php echo $product['price']; ?>&nbsp;€</td>                                       
                                            <td><?php echo $product['tax']; ?>&nbsp;%</td>                                  
                                            <td><?php echo $product['final_price']; ?>&nbsp;€</td>                           
                                            <td><?php echo $product['line_price']; ?>&nbsp;€</td>         
                                            <td><?php echo $product['line_total']; ?>&nbsp;€</td>    
                                            <th></th>
                                    </tr>
                            <?php endforeach; /* */ ?>
                    </tbody>
                    <tfoot>
                            <tr>
                                <td colspan="8">
                                </td>
                            </tr>
                    </tfoot>
                </table>
                <div id="cart-total">
                    <?php // echo $totals['total_price']; ?>€ H.T
                    <?php // echo $totals['total_taxed']; ?>€ T.T.C
                </div>
        </div> 
</section>
