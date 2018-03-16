<?php 
// for post editable fields
$disabled = $editable ? '' :'disabled' ;
//errors
    if(!empty($message)) 
    {
        echo '<div class="error-box">';
        echo $message;
        echo '</div>';
    }
?>
<div  id="appointment-form" class="appointment-form">
    <div id="appointment-menu">
            <h3><a href="javascript:void(0)" onclick="$('div.appointment.section').hide();$('#appointment-details').toggle('fast')"><?php echo lang('appointments:appointment_details'); ?></a></h3>
            <h3><a href="javascript:void(0)" onclick="$('div.appointment.section').hide();$('#appointment-invoice').toggle('fast')"><?php echo lang('appointments:appointment_invoice'); ?></a></h3>
            <h3><a href="javascript:void(0)" onclick="$('div.appointment.section').hide();$('#appointment-delivery').toggle('fast')"><?php echo lang('appointments:appointment_delivery'); ?></a></h3>
            <h3><a href="javascript:void(0)" onclick="$('div.appointment.section').hide();$('#appointment-cart').toggle('fast')"><?php echo lang('appointments:appointment_cart'); ?></a></h3>
    </div>    
	<?php echo form_open_multipart($this->uri->uri_string() , 'class="crud"'); ?>
                <!-- appointment-details -->
                <div class="appointment section" id="appointment-details">
                <h4><?php echo lang('appointments:appointment_details'); ?></h4>
                    <ul>    
                            
                            <li class="<?php echo alternator('', 'even'); ?>">
                               <span class="input-label"><?php echo lang('appointments:appointment_status'); ?> </span>
                                <?php 
                                    echo form_input('appointment_status-ui', lang('appointments:status_'.$appointment->appointment_status) ,'disabled'); 
                                ?>
                            
                                                       
                                <?php 
                                $extra = empty($appointment->delivery_date) ? 'class="tofill" ' : '';
                                if($editable) {
                                    echo $this->html_m->form_delivery_date($appointment->delivery_date, $extra.'autocorrect="off"');
                                } elseif($this->method == 'view' AND $editable) {
                                    echo $this->html_m->form_delivery_date($appointment->delivery_date, $extra.'autocorrect="off"');
                                } else {   
                                    echo $this->html_m->form_delivery_date($appointment->delivery_date ,$extra.'disabled');
                                }
                                ?> 
                         
                             </li>

                            <li class="<?php echo alternator('', 'even'); ?>">
                                        <?php echo $this->html_m->form_input('total_pretax', $appointment->total_pretax ,'disabled'); ?>
                                        <?php echo $this->html_m->form_input('total_final', $appointment->total_final ,'disabled'); ?>
                            </li>	

                            <?php if(false OR $this->method == 'view' AND $appointment->payment_type == 'cc' ) { ?>
                            <li class="<?php echo alternator('', 'even'); ?>" >
                                
                                    <div class="input" id="payment-type-ui">
                                        <span class="input-label"><?php echo lang('appointments:payment_type'); ?> </span>
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
                                        <span class="input-label"><?php echo lang('appointments:payment_status'); ?> </span>
                                            <?php echo form_input('payment_status', lang('appointments:po_stat_'.$appointment->payment_status), 'disabled'); ?>
                                            <?php //echo form_input('payment_status', lang('appointments:po_stat_').$appointment->payment_status, 'disabled'); ?>
                                    </div>
                            </li>    
                            <?php } ?>

                            <li class="<?php echo alternator('', 'even'); ?>">
                            <!--
                                    <label for="message"><?php echo lang('appointments:message'); ?> </label>
                            -->     <div class="input"><?php 
                                    echo form_textarea('message', set_value('message', $appointment->message), 'placeholder="'.lang('appointments:message').'"'.$disabled); 
                                    ?></div>
                            </li>	
                    </ul>  		
                </div>                 
    
                <!-- appointment-invoice -->
                <div class="appointment section" id="appointment-invoice">
                <h4><?php echo lang('appointments:appointment_invoice'); ?></h4>
                    <ul>
     

                        <li class="<?php echo alternator('', 'even'); ?>">
                                <?php echo $this->html_m->form_input('i_company', $appointment->i_company, $disabled); ?>
                                <?php echo $this->html_m->form_input('maiden_name', $appointment->maiden_name, $disabled); ?>
                        </li>		


                        <li class="<?php echo alternator('', 'even'); ?>">
                                 <?php echo $this->html_m->form_input('mobile', $appointment->mobile, $disabled ); ?>
                                 <?php echo $this->html_m->form_input('phone', $appointment->phone, $disabled ); ?>
                                <?php echo $this->html_m->form_input('email', $appointment->email, $disabled ); ?>
                        </li>		

                        <li class="<?php echo alternator('', 'even'); ?>">
                                <?php echo lang("appointments:address"); ?>
                            <?php echo $this->html_m->form_input('address',  $appointment->address, $disabled); ?>
                            <?php //echo $this->html_m->form_input('i_street2', $appointment->i_street2, $disabled); ?>
                            <?php echo $this->html_m->form_input('town', $appointment->town, $disabled); ?>
                            <?php echo $this->html_m->form_input('area_name', $appointment->area_name, $disabled); ?>
                        </li>		

                    </ul>
                </div>
    
                <!-- appointment-delivery -->
                <div class="appointment section " id="appointment-delivery">   
                <h4><?php echo lang('appointments:appointment_delivery'); ?></h4>
                    <ul>

                    <li class="<?php echo alternator('', 'even'); ?>">
                            <?php echo $this->html_m->form_input('d_fullname', $appointment->d_fullname, $disabled); ?>
                            <?php echo $this->html_m->form_input('d_company', $appointment->d_company, $disabled); ?>
                    </li>		


                    <li class="<?php echo alternator('', 'even'); ?>">
                             <?php echo $this->html_m->form_input('d_mobile', $appointment->d_mobile, $disabled ); ?>
                             <?php echo $this->html_m->form_input('d_phone', $appointment->d_phone, $disabled ); ?>
                             <?php echo $this->html_m->form_input('d_mail', $appointment->d_mail, $disabled ); ?>
                    </li>		

                    <li class="<?php echo alternator('', 'even'); ?>">
                            <?php echo $this->html_m->form_input('d_street1',  $appointment->d_street1, $disabled); ?>
                            <?php //echo $this->html_m->form_input('d_street2', $appointment->d_street2, $disabled); ?>
                            <?php echo $this->html_m->form_input('d_town', $appointment->d_town, $disabled); ?>
                            <?php echo $this->html_m->form_input('d_zipcode', $appointment->d_zipcode, $disabled); ?>
                    </li>		


                </ul>
                </div>		
                    
                <!-- appointment-cart -->
                <div id="appointment-cart" class="appointment section cart" >
                    <h4><?php echo lang('appointments:appointment_cart'); ?></h4>
                        <table>
                            <thead>
                                    <tr>
                                        <th><?php echo lang('appointments:product_name'); ?></th>
                                        <th><?php echo lang('appointments:products_unit'); ?></th>
                                        <th><?php echo lang('appointments:products_qty'); ?></th>
                                        <th><?php echo lang('appointments:products_price'); ?></th>
                                        <th><?php echo lang('appointments:products_tax'); ?></th>
                                        <th><?php echo lang('appointments:products_final_price'); ?></th>
                                        <th><?php echo lang('appointments:products_line_price'); ?></th>
                                        <th><?php echo lang('appointments:products_line_total'); ?></th>
                                        <th></th>

                                    </tr>
                            </thead>
                            <tbody>
                                    <?php 
                                    $items = 0; // hack for knowing when to show cancel button
                                    foreach( $cartlist as $product ): ?>
                                <?php $items += $product['appointment_qty'] ?>
                                    <tr>
                                            <!--<td><?php echo $product['img_html']; ?></td>   -->                               
                                            <td><?php echo $product['name']; ?></td>                                  
                                            <td><?php echo lang('appointments:unit_'.$product['unit']); ?></td>                                  
                                            <td><?php echo $product['input_html']; ?></td>                                  
                                            <td><?php echo $product['price']; ?>&nbsp;€</td>                                       
                                            <td><?php echo $product['tax']; ?>&nbsp;%</td>                                  
                                            <td><?php echo $product['final_price']; ?>&nbsp;€</td>                           
                                            <td><?php echo $product['line_price']; ?>&nbsp;€</td>         
                                            <td><?php echo $product['line_total']; ?>&nbsp;€</td>       
                                            <?php if($this->method != 'view'): ?>
                                            <td><a href="/appointments/?remove=<?php echo $product['id']; ?>">X</a></td>                                   
                                            <?php else: ?>
                                            <th></th>
                                            <?php endif; ?>
                                    </tr>
                                    <?php endforeach; ?>
                            </tbody>
                            <tfoot>
                                    <tr>
                                        <td colspan="8" id="cart-total">
                                            <h4>{{ helper:lang line="appointments:cart_totals" }}</h4>
                                                <ul>
                                            {{ carttotal }} 
                                            <li>   
                                                    Total HT : {{ total_price }} €
                                            </li>  
                                            <li>   
                                                total TTC : {{ total_taxed }} € 
                                            
                                            </li>
                                            {{ /carttotal }}
                                            </ul>

                                        </td>
                                    </tr>
                            </tfoot>
                    </table>
                    </div>  
                
                <!-- appointment-buttons -->
		<div class="buttons" id="appointment-button-wrapper">
                    <?php 
                    if($editable)
                    {   
                        if(empty($appointment->appointment_status) AND !empty($appointment->id)) 
                        {
                            
                        echo form_submit('appointmentSend', lang('appointments:appointment_modify'), 'class="button"'); 
                        } 
                        else {
                            
                            if($items > 0) echo form_submit('appointmentSend', lang('appointments:appointment_save'), 'class="button"'); 
                        }
                    }
                    
                    if(empty($appointment->appointment_status) AND !empty($appointment->id))
                    { //appointment saved but not treated so can cancel
                        echo anchor(site_url().'appointments/delete/'.$this->uri->segment(3), lang('appointments:appointment_delete'), 'class="delete"');                    
                    } 
                    
                    ?>
                    <?php // cancel button
                    if($items > 0 AND empty($appointment->id)) : ?>
                        <a href="{{url:site}}appointments/cancel_appointment" id="appointment-cancel">{{ helper:lang line="appointments:cart_cancel" }}</a>
                    <?php endif; ?>
                </div>
                
                <!-- appointment-extra -->
                <ul>       
                    <?php  
                        
                    echo form_hidden('log', $appointment->log);
                    echo form_hidden('name', $appointment->name);
                    echo form_hidden('slug', $appointment->slug);
                    if(!empty($appointment->id)) echo form_hidden('id', $appointment->id);
                    echo form_hidden('payment_type', $appointment->payment_type);
                    echo form_hidden('payment_status', $appointment->payment_status);
                    
                        echo "<li>";
                        echo lang('appointments:slug') ." ". $appointment->slug ;
                        echo "<br/>";
                        echo lang('appointments:user_id') ." ". $appointment->user_id ;
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
                    ?>
                    </li>
                </ul>

        <?php echo form_close(); ?>

</div>
               
