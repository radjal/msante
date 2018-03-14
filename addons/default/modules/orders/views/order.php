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
<div  id="order-form" class="order-form">
    <div id="order-menu">
            <h3><a href="javascript:void(0)" onclick="$('div.order.section').hide();$('#order-details').toggle('fast')"><?php echo lang('orders:order_details'); ?></a></h3>
            <h3><a href="javascript:void(0)" onclick="$('div.order.section').hide();$('#order-invoice').toggle('fast')"><?php echo lang('orders:order_invoice'); ?></a></h3>
            <h3><a href="javascript:void(0)" onclick="$('div.order.section').hide();$('#order-delivery').toggle('fast')"><?php echo lang('orders:order_delivery'); ?></a></h3>
            <h3><a href="javascript:void(0)" onclick="$('div.order.section').hide();$('#order-cart').toggle('fast')"><?php echo lang('orders:order_cart'); ?></a></h3>
    </div>    
	<?php echo form_open_multipart($this->uri->uri_string() , 'class="crud"'); ?>
                <!-- order-details -->
                <div class="order section" id="order-details">
                <h4><?php echo lang('orders:order_details'); ?></h4>
                    <ul>    
                            
                            <li class="<?php echo alternator('', 'even'); ?>">
                               <span class="input-label"><?php echo lang('orders:order_status'); ?> </span>
                                <?php 
                                    echo form_input('order_status-ui', lang('orders:status_'.$order->order_status) ,'disabled'); 
                                ?>
                            
                                                       
                                <?php 
                                $extra = empty($order->delivery_date) ? 'class="tofill" ' : '';
                                if($editable) {
                                    echo $this->html_m->form_delivery_date($order->delivery_date, $extra.'autocorrect="off"');
                                } elseif($this->method == 'view' AND $editable) {
                                    echo $this->html_m->form_delivery_date($order->delivery_date, $extra.'autocorrect="off"');
                                } else {   
                                    echo $this->html_m->form_delivery_date($order->delivery_date ,$extra.'disabled');
                                }
                                ?> 
                         
                             </li>

                            <li class="<?php echo alternator('', 'even'); ?>">
                                        <?php echo $this->html_m->form_input('total_pretax', $order->total_pretax ,'disabled'); ?>
                                        <?php echo $this->html_m->form_input('total_final', $order->total_final ,'disabled'); ?>
                            </li>	

                            <?php if(false OR $this->method == 'view' AND $order->payment_type == 'cc' ) { ?>
                            <li class="<?php echo alternator('', 'even'); ?>" >
                                
                                    <div class="input" id="payment-type-ui">
                                        <span class="input-label"><?php echo lang('orders:payment_type'); ?> </span>
                                        <?php // hack to show payment paypal only for information purpose
                                            echo form_input('payment_type-ui', lang('orders:po_cc') ,'id="payment_type-ui" disabled');
                                        ?>
                                        <?php 
//                                        if($this->method == 'view') 
//                                        {
//                                            echo $this->html_m->form_radio_payment_type($order->payment_type, 'disabled');
//                                        } else {
//                                            echo $this->html_m->form_radio_payment_type($order->payment_type);
//                                        } 
                                        ?>
                                    </div>
                            <?php //} ?>
                            
                            <?php //if($this->method == 'view' AND $order->payment_status !='' ) { ?>
                                    <div class="input" id="payment-status-ui">
                                        <span class="input-label"><?php echo lang('orders:payment_status'); ?> </span>
                                            <?php echo form_input('payment_status', lang('orders:po_stat_'.$order->payment_status), 'disabled'); ?>
                                            <?php //echo form_input('payment_status', lang('orders:po_stat_').$order->payment_status, 'disabled'); ?>
                                    </div>
                            </li>    
                            <?php } ?>

                            <li class="<?php echo alternator('', 'even'); ?>">
                            <!--
                                    <label for="message"><?php echo lang('orders:message'); ?> </label>
                            -->     <div class="input"><?php 
                                    echo form_textarea('message', set_value('message', $order->message), 'placeholder="'.lang('orders:message').'"'.$disabled); 
                                    ?></div>
                            </li>	
                    </ul>  		
                </div>                 
    
                <!-- order-invoice -->
                <div class="order section" id="order-invoice">
                <h4><?php echo lang('orders:order_invoice'); ?></h4>
                    <ul>
     

                        <li class="<?php echo alternator('', 'even'); ?>">
                                <?php echo $this->html_m->form_input('i_company', $order->i_company, $disabled); ?>
                                <?php echo $this->html_m->form_input('i_fullname', $order->i_fullname, $disabled); ?>
                        </li>		


                        <li class="<?php echo alternator('', 'even'); ?>">
                                 <?php echo $this->html_m->form_input('i_mobile', $order->i_mobile, $disabled ); ?>
                                 <?php echo $this->html_m->form_input('i_phone', $order->i_phone, $disabled ); ?>
                                <?php echo $this->html_m->form_input('i_mail', $order->i_mail, $disabled ); ?>
                        </li>		

                        <li class="<?php echo alternator('', 'even'); ?>">
                                <?php echo lang("orders:address"); ?>
                            <?php echo $this->html_m->form_input('i_street1',  $order->i_street1, $disabled); ?>
                            <?php //echo $this->html_m->form_input('i_street2', $order->i_street2, $disabled); ?>
                            <?php echo $this->html_m->form_input('i_town', $order->i_town, $disabled); ?>
                            <?php echo $this->html_m->form_input('i_zipcode', $order->i_zipcode, $disabled); ?>
                        </li>		

                    </ul>
                </div>
    
                <!-- order-delivery -->
                <div class="order section " id="order-delivery">   
                <h4><?php echo lang('orders:order_delivery'); ?></h4>
                    <ul>

                    <li class="<?php echo alternator('', 'even'); ?>">
                            <?php echo $this->html_m->form_input('d_fullname', $order->d_fullname, $disabled); ?>
                            <?php echo $this->html_m->form_input('d_company', $order->d_company, $disabled); ?>
                    </li>		


                    <li class="<?php echo alternator('', 'even'); ?>">
                             <?php echo $this->html_m->form_input('d_mobile', $order->d_mobile, $disabled ); ?>
                             <?php echo $this->html_m->form_input('d_phone', $order->d_phone, $disabled ); ?>
                             <?php echo $this->html_m->form_input('d_mail', $order->d_mail, $disabled ); ?>
                    </li>		

                    <li class="<?php echo alternator('', 'even'); ?>">
                            <?php echo $this->html_m->form_input('d_street1',  $order->d_street1, $disabled); ?>
                            <?php //echo $this->html_m->form_input('d_street2', $order->d_street2, $disabled); ?>
                            <?php echo $this->html_m->form_input('d_town', $order->d_town, $disabled); ?>
                            <?php echo $this->html_m->form_input('d_zipcode', $order->d_zipcode, $disabled); ?>
                    </li>		


                </ul>
                </div>		
                    
                <!-- order-cart -->
                <div id="order-cart" class="order section cart" >
                    <h4><?php echo lang('orders:order_cart'); ?></h4>
                        <table>
                            <thead>
                                    <tr>
                                        <th><?php echo lang('orders:product_name'); ?></th>
                                        <th><?php echo lang('orders:products_unit'); ?></th>
                                        <th><?php echo lang('orders:products_qty'); ?></th>
                                        <th><?php echo lang('orders:products_price'); ?></th>
                                        <th><?php echo lang('orders:products_tax'); ?></th>
                                        <th><?php echo lang('orders:products_final_price'); ?></th>
                                        <th><?php echo lang('orders:products_line_price'); ?></th>
                                        <th><?php echo lang('orders:products_line_total'); ?></th>
                                        <th></th>

                                    </tr>
                            </thead>
                            <tbody>
                                    <?php 
                                    $items = 0; // hack for knowing when to show cancel button
                                    foreach( $cartlist as $product ): ?>
                                <?php $items += $product['order_qty'] ?>
                                    <tr>
                                            <!--<td><?php echo $product['img_html']; ?></td>   -->                               
                                            <td><?php echo $product['name']; ?></td>                                  
                                            <td><?php echo lang('orders:unit_'.$product['unit']); ?></td>                                  
                                            <td><?php echo $product['input_html']; ?></td>                                  
                                            <td><?php echo $product['price']; ?>&nbsp;€</td>                                       
                                            <td><?php echo $product['tax']; ?>&nbsp;%</td>                                  
                                            <td><?php echo $product['final_price']; ?>&nbsp;€</td>                           
                                            <td><?php echo $product['line_price']; ?>&nbsp;€</td>         
                                            <td><?php echo $product['line_total']; ?>&nbsp;€</td>       
                                            <?php if($this->method != 'view'): ?>
                                            <td><a href="/orders/?remove=<?php echo $product['id']; ?>">X</a></td>                                   
                                            <?php else: ?>
                                            <th></th>
                                            <?php endif; ?>
                                    </tr>
                                    <?php endforeach; ?>
                            </tbody>
                            <tfoot>
                                    <tr>
                                        <td colspan="8" id="cart-total">
                                            <h4>{{ helper:lang line="orders:cart_totals" }}</h4>
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
                
                <!-- order-buttons -->
		<div class="buttons" id="order-button-wrapper">
                    <?php 
                    if($editable)
                    {   
                        if(empty($order->order_status) AND !empty($order->id)) 
                        {
                            
                        echo form_submit('orderSend', lang('orders:order_modify'), 'class="button"'); 
                        } 
                        else {
                            
                            if($items > 0) echo form_submit('orderSend', lang('orders:order_save'), 'class="button"'); 
                        }
                    }
                    
                    if(empty($order->order_status) AND !empty($order->id))
                    { //order saved but not treated so can cancel
                        echo anchor(site_url().'orders/delete/'.$this->uri->segment(3), lang('orders:order_delete'), 'class="delete"');                    
                    } 
                    
                    ?>
                    <?php // cancel button
                    if($items > 0 AND empty($order->id)) : ?>
                        <a href="{{url:site}}orders/cancel_order" id="order-cancel">{{ helper:lang line="orders:cart_cancel" }}</a>
                    <?php endif; ?>
                </div>
                
                <!-- order-extra -->
                <ul>       
                    <?php  
                        
                    echo form_hidden('log', $order->log);
                    echo form_hidden('name', $order->name);
                    echo form_hidden('slug', $order->slug);
                    if(!empty($order->id)) echo form_hidden('id', $order->id);
                    echo form_hidden('payment_type', $order->payment_type);
                    echo form_hidden('payment_status', $order->payment_status);
                    
                        echo "<li>";
                        echo lang('orders:slug') ." ". $order->slug ;
                        echo "<br/>";
                        echo lang('orders:user_id') ." ". $order->user_id ;
                    if(isset($order->order_date)) { 
                        echo "<br/>";
                        echo lang('orders:order_date') ." ". $order->order_date ;
                    }
                    if(isset($order->updated_on)) { 
                        echo "<br/>";
                        echo lang('orders:updated_on') ." ". $order->updated_on ;
                    }
                    if(isset($order->created_on)) {
                        echo "<br/>";
                        echo lang('orders:created_on') ." ". $order->created_on ;
                        } 
                    if(isset($order->ip)) { 
                        echo "<br/>";
                        echo "IP : ".$order->ip ;
                        } 
                    if(isset($order->user_agent)) {
                        echo "<br/>";
                        echo " User agent : ". $order->user_agent;
                        } 
                    ?>
                    </li>
                </ul>

        <?php echo form_close(); ?>

</div>
               
