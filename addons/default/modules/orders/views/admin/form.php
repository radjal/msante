<?php 
$disabled = '';
if($disabled)  $disabled='disabled';
?>
<section class="title">
	<!-- We'll use $this->method to switch between orders.create & orders.edit -->
	<h4><?php echo lang('orders:'.$this->method); ?></h4>
        
	<?php if($disabled) echo '( Modification interdite )'; ?>
        <?php //if(!$disabled) $this->load->view('admin/partials/buttons', array('buttons' => array('save') )); ?>
        
        <a href="<?php base_url() ?>/admin/orders/print_order/<?php echo $this->uri->segment(4) ?>" class="btn gray" target="_blank"><?php echo lang('orders:print') ?></a>
</section>

<section class="item" >

	<?php if(!$disabled) echo form_open_multipart($this->uri->uri_string(), 'class="crud"'); ?>
		
    <div id="form_inputs" style="">
        <div class="tabs"></div>
        <ul class="tab-menu">
          <li><a href="#order-details"><?php echo lang('orders:order'); ?></a></li>
          <li><a href="#order-invoice"><?php echo lang('orders:order_invoice'); ?></a></li>
          <li><a href="#order-delivery"><?php echo lang('orders:order_delivery'); ?></a></li>
          <!-- <li><a href="#order-cart">Cart</a></li> -->
          <li><a href="#order-extra"><?php echo lang('orders:log'); ?></a></li>
        </ul>
	<div  id="order-details">
            <h2><?php echo lang('orders:order_details'); ?></h2>
		<ul>
					<li class="<?php echo alternator('', 'even'); ?>">
                                                                        <?php echo $this->html_m->form_input('name', $order->name, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('slug', $order->slug, $disabled ); ?>
					</li>
					
					
					<li class="<?php echo alternator('', 'even'); ?>">
							<div class="input">
									<label for="order_status"><?php echo lang('orders:order_status'); ?></label>
									<?php echo $this->html_m->form_dropdown_order_status($order->order_status, $disabled); ?>
							</div>
							<div class="input">
									<label for="payment_status"><?php echo lang('orders:payment_status'); ?></label>
									<?php echo $this->html_m->form_radio_payment_status($order->payment_status, $disabled); ?>
							</div>
							<div class="input">
									<label for="payment_type"><?php echo lang('orders:payment_type'); ?></label>
									<?php echo $this->html_m->form_radio_payment_type($order->payment_type, $disabled); ?>
							</div>
					</li>


                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <?php echo $this->html_m->form_input('total_pretax', $order->total_pretax, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('total_final', $order->total_final, $disabled ); ?>
                                                        </li>

                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <?php echo $this->html_m->form_input('delivery_date', $order->delivery_date, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('order_date', $order->order_date, $disabled ); ?>
                                                        </li>		

                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <label for="message"><?php echo lang('orders:message'); ?></label>
                                                                        <?php echo form_textarea('message', $order->message, $disabled ); ?>
                                                        </li>		
		</ul>
	 </div> 
	<div  id="order-invoice">
            <h2><?php echo lang('orders:order_invoice'); ?></h2>
							
		<ul>										
                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <?php echo $this->html_m->form_input('i_company', $order->i_company, $disabled) ; ?>
                                                                        <?php echo $this->html_m->form_input('i_fullname', $order->i_fullname, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('i_mobile', $order->i_mobile, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('i_phone', $order->i_phone, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('i_mail', $order->i_mail, $disabled ); ?>
                                                        </li>		

                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <?php echo $this->html_m->form_input('i_street1', $order->i_street1, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('i_street2', $order->i_street2, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('i_town', $order->i_town, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('i_zipcode', $order->i_zipcode, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('i_country', $order->i_country, $disabled ); ?>
                                                        </li>	
		</ul>
	 </div> 
	<div  id="order-delivery">
            <h2><?php echo lang('orders:order_delivery'); ?></h2>
		<ul>	
                    
                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <?php echo $this->html_m->form_input('d_company', $order->d_company, $disabled) ; ?>
                                                                        <?php echo $this->html_m->form_input('d_fullname', $order->d_fullname, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('d_mobile', $order->d_mobile, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('d_phone', $order->d_phone, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('d_mail', $order->d_mail, $disabled ); ?>
                                                        </li>	
                                                        
                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <?php echo $this->html_m->form_input('d_street1', $order->d_street1, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('d_street2', $order->d_street2, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('d_town', $order->d_town, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('d_zipcode', $order->d_zipcode, $disabled ); ?>
                                                                        <?php echo $this->html_m->form_input('d_country', $order->d_country, $disabled ); ?>
                                                        </li>	
                                                        
                                                        <li>
                                                                        <div id="map"></div>

                                                        </li>
		</ul>
	 </div> 
        <div  id="order-extra">
            <h2><?php echo lang('orders:order_log'); ?></h2>
		<ul>										
									
                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                        <label for="log"><?php echo lang('orders:log'); ?></label>
                                                                        <?php echo form_textarea('log', $order->log, $disabled ); ?>
                                                        </li>		
								
					<?php if(isset($order->updated_on)) { ?>
                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                <div class="input">
                                                                        <label for="updated_on"><?php echo lang('orders:updated_on'); ?></label>
                                                                        <?php if(!empty($order->updated_on)) echo $order->updated_on ?>
                                                                        <?php echo form_hidden('updated_on', $order->updated_on ) ?>
                                                                </div>
                                                        </li>
								<?php } ?>
					<?php if(isset($order->created_on)) { ?>
                                                        <li class="<?php echo alternator('', 'even'); ?>">
                                                                <div class="input">
                                                                            <label for="created_on"><?php echo lang('orders:created_on'); ?></label>
                                                                            <?php if(!empty($order->created_on)) echo $order->created_on ?>
                                                                            <?php echo form_hidden('created_on', $order->created_on ) ?>
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

        <!-- order-cart -->
        <div id="order-cart" class="ajax-cart">
                <table>
                    <thead>
                            <tr>
                                <?php echo $this->html_m->table_header('product_id', false, 'admin/orders/list/order/'.$this->uri->segment(4) ) ?> 
                                <?php echo $this->html_m->table_header('name', false, 'admin/orders/list/order/'.$this->uri->segment(4) ) ?>              
                                <?php echo $this->html_m->table_header('product_qty', false, 'admin/orders/list/order/'.$this->uri->segment(4) ) ?>
                                <?php echo $this->html_m->table_header('line_price', false, 'admin/orders/list/order/'.$this->uri->segment(4) ) ?>
                                <?php echo $this->html_m->table_header('tax', false, 'admin/orders/list/order/'.$this->uri->segment(4) ) ?>
                                <?php echo $this->html_m->table_header('final_price', false, 'admin/orders/list/order/'.$this->uri->segment(4) ) ?>
                                <?php echo $this->html_m->table_header('unit', false, 'admin/orders/list/order/'.$this->uri->segment(4) ) ?>
                                <?php echo $this->html_m->table_header('origin', false, 'admin/orders/list/order/'.$this->uri->segment(4) ) ?>
                                <?php //echo $this->html_m->table_header('image_filename', false, 'admin/orders/list/order/'.$this->uri->segment(4) ) ?>
                                <th></th>
                            </tr>
                    </thead>
                    <tbody>
                            <?php 
                            $items = 0; // hack for knowing when to show cancel button
                            foreach( $cartlist as $product ): ?>
                                    <?php $items += $product['order_qty'] ?>
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
                            <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                            <tr>
                                <td colspan="8">
                                </td>
                            </tr>
                    </tfoot>
                </table>
                <div id="cart-total">
                    <?php echo $totals['total_price']; ?>€ H.T
                    <?php echo $totals['total_taxed']; ?>€ T.T.C
                </div>
        </div> 
</section>
