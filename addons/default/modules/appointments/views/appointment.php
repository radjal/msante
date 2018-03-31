<?php 
if($doctor['id']>0) $this->load->view('appointment-doctor', $doctor) ;
// for post editable fields
$disabled = $editable ? '' :'disabled' ;
//errors
    if(!empty($message)) 
    {
        echo '<div class="alert alert-danger"> <i class="close">×</i>';
        echo $message;
        echo '</div>';
    }
?>
<div  id="appointment-form" class="appointment-form"> 

<center class="h3 alert alert-success"> <i class="glyphicon glyphicon-calendar"></i>  
    {{formatted_date}}
</center>
            <center class="appt-time alert alert-success h3">
                <a onclick="$('#container-appt, #weekday-wrapper').slideToggle()"><i class="glyphicon glyphicon-remove"></i></a> 
                <i class="glyphicon glyphicon-time"></i> à <span>{{formatted_time}}</span>  
            </center>

	<?=  form_open_multipart($this->uri->uri_string() , 'class="crud"'); ?>
                <!-- appointment-details -->
                <div class="appointment section" id="appointment-details">
                <h4><?=  lang('appointments:appointment_details'); ?></h4> 
                
                            <div class="<?php  //alternator('', 'even'); ?>">
                                <?=  $appointment->appointment_status ?>                         
                             </div>
                            
                            <div class="<?php  //alternator('', 'even'); ?>">
                                <?=  $this->html_m->form_input('appointment_date', $appointment->appointment_date, $disabled.' readonly'.' class="form-control"' ); ?>     
                                <?=  $this->html_m->form_input('appointment_time', $appointment->appointment_time, $disabled.' readonly'.' class="form-control"' ); ?>                         
                             </div> 
                            <div class="<?php  //alternator('', 'even'); ?>">
                                        <?php  //$this->html_m->form_input('total_pretax', $appointment->total_pretax ,'disabled'); ?>
                                        <?php  //$this->html_m->form_input('total_final', $appointment->total_final ,'disabled'); ?>
                            </div>	

                            <?php if(FALSE OR $this->method == 'view' AND $appointment->payment_type == 'cc' ) { ?>
                            <div class="<?php  //alternator('', 'even'); ?>" >
                                
                                    <div class="input" id="payment-type-ui">
                                        <span class="input-label"><?=  lang('appointments:payment_type'); ?> </span>
                                        <?php // hack to show payment paypal only for information purpose
                                            echo form_input('payment_type-ui', lang('appointments:po_cc') ,'id="payment_type-ui" disabled');
                                        ?>
                                        <?php 
//                                        if($this->method == 'view') 
//                                        {
//                                            echo $this->html_m->form_radio_payment_type($appointment->payment_type, 'disabled');
//                                        } else {
//                                            echo $this->html_m->form_radio_payment_type($appointment->payment_type);
//                                        } 
                                        ?>
                                    </div>
                            <?php //} ?>
                            
                            <?php //if($this->method == 'view' AND $appointment->payment_status !='' ) { ?>
                                    <div class="input" id="payment-status-ui">
                                        <span class="input-label"><?=  lang('appointments:payment_status'); ?> </span>
                                            <?=  form_input('payment_status', lang('appointments:po_stat_'.$appointment->payment_status), 'disabled'); ?>
                                            <?php //echo form_input('payment_status', lang('appointments:po_stat_').$appointment->payment_status, 'disabled'); ?>
                                    </div>
                            </div>    
                            <?php } ?>
 	
                </div>                 
    
                <!-- appointment-patient -->
                <div class="appointment section" id="appointment-patient">
                <h4><?=  lang('appointments:appointment_patient'); ?></h4> 
                        <div class="<?php  //alternator('', 'even'); ?>">
                                <?=  $this->html_m->form_input('gender', $appointment->gender, $disabled.' readonly'.' class="form-control"'); ?>
                                <?=  $this->html_m->form_input('birth_date', $appointment->birth_date, $disabled.' readonly'.' class="form-control"'); ?>     
                                <?=  $this->html_m->form_input('first_name', $appointment->first_name, $disabled.' readonly'.' class="form-control"'); ?>
                                <?=  $this->html_m->form_input('last_name', $appointment->last_name, $disabled.' readonly'.' class="form-control"'); ?>
                                <?=  $this->html_m->form_input('maiden_name', $appointment->maiden_name, $disabled.' readonly'.' class="form-control"'); ?>
                        </div>		 
<!--                        <div class="<?php  //alternator('', 'even'); ?>">
                                 <?php // echo $this->html_m->form_input('mobile', $appointment->mobile, $disabled ); ?>
                                 <?php // echo $this->html_m->form_input('phone', $appointment->phone, $disabled ); ?>
                                <?php // echo $this->html_m->form_input('email', $appointment->email, $disabled ); ?>
                        </div>		 -->
                        <div class="<?php  //alternator('', 'even'); ?>"> 
                            <?php // echo $this->html_m->form_input('address',  $appointment->address, $disabled); ?> 
                            <?=  $this->html_m->form_input('district',  $appointment->district, $disabled.' class="form-control"'); ?> 
                            <?=  $this->html_m->form_input('area_name', $appointment->area_name, $disabled.' class="form-control"'); ?>
                            <?=  $this->html_m->form_input('town', $appointment->town, $disabled.' class="form-control"'); ?>
                        </div>		 
                        <div class="<?php  //alternator('', 'even'); ?>"> 
                                    <label for="insurance">Avez-vous une mutuelle santé?</label>
                                        <div class="insurance_ui" >
                                            <a onclick="setField('insurance', this)" 
                                               class="btn btn-primary btn-sm <?= isset($this->current_user->insurance) && strtolower($this->current_user->insurance) == 'oui' ? 'active btn-success' :null ?>">Oui</a>
                                            <a onclick="setField('insurance', this)" 
                                               class="btn btn-primary btn-sm <?= isset($this->current_user->insurance) && strtolower($this->current_user->insurance) == 'non' ? 'active btn-success' :null ?>">Non</a>
                                            <input type="hidden" class="form-control" id="insurance" name="insurance" value="{{ insurance }}">
                                            <?php echo form_hidden('insurance', !empty($appointment->insurance)); ?>  
                                        </div>
                                    <label for="knows_doctor">Avez-vous déjà vu ce médecin ?</label>
                                        <div class="knows_doctor_ui" >
                                            <a onclick="setField('knows_doctor', this)" 
                                               class="btn btn-primary btn-sm">Oui</a>
                                            <a onclick="setField('knows_doctor', this)" 
                                               class="btn btn-primary btn-sm">Non</a>
                                            <input type="hidden" class="form-control" id="knows_doctor" name="knows_doctor" value="{{ knows_doctor }}">
                                            <?php echo form_hidden('knows_doctor', !empty($appointment->knows_doctor)); ?>  
                                        </div> 
                            <?php //  $this->html_m->form_input('insurance',  $appointment->insurance, $disabled.' class="form-control"'); ?> 
                            <?php //  $this->html_m->form_input('knows_doctor', $appointment->knows_doctor, $disabled.' class="form-control"'); ?> 
                        </div>	 
                </div>
    
	
                    <?php if( FALSE ): // keeping this out ?>
                <!-- appointment-cart -->
                <div id="appointment-cart" class="appointment section cart" >
                    <h4><?=  lang('appointments:appointment_cart'); ?></h4>
                        <table>
                            <thead>
                                    <tr>
                                        <th><?=  lang('appointments:product_name'); ?></th>
                                        <th><?=  lang('appointments:products_unit'); ?></th>
                                        <th><?=  lang('appointments:products_qty'); ?></th>
                                        <th><?=  lang('appointments:products_price'); ?></th>
                                        <th><?=  lang('appointments:products_tax'); ?></th>
                                        <th><?=  lang('appointments:products_final_price'); ?></th>
                                        <th><?=  lang('appointments:products_line_price'); ?></th>
                                        <th><?=  lang('appointments:products_line_total'); ?></th>
                                        <th></th>

                                    </tr>
                            </thead>
                            <tbody>
                                    <?php 
                                    $items = 0; // hack for knowing when to show cancel button 
                                    foreach( $cartlist as $product ): ?>
                                <?php // $items += $product['appointment_qty'] ?>
                                    <tr>
                                            <!--<td><?=  $product['img_html']; ?></td>   -->                               
                                            <td><?=  $product['name']; ?></td>                                  
                                            <td><?=  lang('appointments:unit_'.$product['unit']); ?></td>                                  
                                            <td><?=  $product['input_html']; ?></td>                                  
                                            <td><?=  $product['price']; ?>&nbsp;€</td>                                       
                                            <td><?=  $product['tax']; ?>&nbsp;%</td>                                  
                                            <td><?=  $product['final_price']; ?>&nbsp;€</td>                           
                                            <td><?=  $product['line_price']; ?>&nbsp;€</td>         
                                            <td><?=  $product['line_total']; ?>&nbsp;€</td>       
                                            <?php if($this->method != 'view'): ?>
                                            <td><a href="/appointments/?remove=<?=  $product['id']; ?>">X</a></td>                                   
                                            <?php else: ?>
                                            <th></th>
                                            <?php endif; ?>
                                    </tr>
                                    <?php endforeach; ?>
                            </tbody>
                            <tfoot>
                                    <tr>
<!--                                        <td colspan="8" id="cart-total">
                                            <h4>{{ helper:lang line="appointments:cart_totals" }}</h4>
                                                <ul>
                                            {{# carttotal #}} 
                                            <div>   
                                                    Total HT : {{ total_price }} €
                                            </div>  
                                            <div>   
                                                total TTC : {{ total_taxed }} € 
                                            
                                            </div>
                                            {{# /carttotal #}}
                                            </ul>

                                        </td>
                                    </tr>-->
                            </tfoot>
                    </table>
                    </div>  
                    <?php endif; ?>
                
                <!-- appointment-buttons -->
		<div class="buttons" id="appointment-button-wrapper">
                    <?php 
                    $items = !isset($items)?0:$items; // hack for knowing when to show cancel button 
                    if($editable)
                    {   
                        if(empty($appointment->appointment_status) AND !empty($appointment->id)) 
                        {
                            
                        echo form_submit('appointmentSend', lang('appointments:appointment_modify'), 'class="button btn btn-success"'); 
                        } 
                        else {
                            
                            if($items > 0) echo form_submit('appointmentSend', lang('appointments:appointment_save'), 'class="button btn btn-primary"'); 
                        }
                    }
                    
                    if(empty($appointment->appointment_status) AND !empty($appointment->id))
                    { //appointment saved but not treated so can cancel
                        echo anchor(site_url().'appointments/delete/'.$this->uri->segment(3), lang('appointments:appointment_delete'), 'class="delete btn btn-danger"');                    
                    } 
                    
                    ?>
                    <?php // cancel button
                    if($items > 0 AND empty($appointment->id)) : ?>
                        <a href="{{url:site}}appointments/cancel_appointment" id="appointment-cancel">{{ helper:lang line="appointments:cart_cancel" }}</a>
                    <?php endif; ?>
                </div>
                
            <!--  appointment-extra --> 
                    <?php  
                        
//                    echo form_hidden('name', $appointment->name);
//                    echo form_hidden('slug', $appointment->slug);  
                    if(!empty($appointment->log)) echo form_hidden('log', !empty($appointment->log) ? $appointment->log :'');
                    if(!empty($appointment->doctor_id)) echo form_hidden('doctor_id', !empty($appointment->doctor_id) ? $appointment->doctor_id :'');
                    if(!empty($appointment->id)) echo form_hidden('id', !empty($appointment->id) ? $appointment->id :'');
//                    echo form_hidden('payment_type', $appointment->payment_type);
//                    echo form_hidden('payment_status', $appointment->payment_status);
                    echo form_hidden('appointment_status', $appointment->appointment_status);
                    
                        echo '<div class="small text-muted">';
//                        echo lang('appointments:slug') ." ". $appointment->slug ;
//                        echo "<br/>";
                        echo lang('appointments:user_id') ." ". $appointment->user_id ;
                        echo "<br/>";
                        echo lang('appointments:doctor_id') ." ". $appointment->doctor_id ;
                    if(isset($appointment->appointment_date)) { 
                        echo "<br/>";
                        echo lang('appointments:appointment_date') ." ". $appointment->appointment_date ;
                    }
                    if(isset($appointment->updated_on)) { 
                        echo "<br/>";
                        echo lang('appointments:updated_on') ." ". $appointment->updated_on ;
                    }
                    if(isset($appointment->created_on)) {
                        echo "<br/>";
                        echo lang('appointments:created_on') ." ". $appointment->created_on ;
                        } 
                    if(isset($appointment->ip)) { 
                        echo "<br/>";
                        echo "IP : ".$appointment->ip ;
                        } 
                    if(isset($appointment->user_agent)) {
                        echo "<br/>";
                        echo " User agent : ". $appointment->user_agent;
                        } 
                        
                        echo "</div>";
                    ?>  

        <?=  form_close(); ?>

</div>
               
