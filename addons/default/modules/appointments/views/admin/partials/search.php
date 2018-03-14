
<a class="btn orange" id="search-btn" onclick="$('#search').slideToggle()">Filter</a>
        <a class="btn gray" href="/admin/appointments"><?php echo lang('appointments:reset') ?></a>
    <?php 
            $gvars = $this->input->get();
            if(isset($gvars['view']))  unset($gvars['view']) ;
            if(count($gvars) <= 0) 
            {
                $url = site_url().uri_string().'?';
            } else 
            {
                $url = site_url().uri_string().'?'.http_build_query($gvars) ;
            }
    ?> 
    <a class="btn <?php echo empty($this->input->get('view')) ?  "green" : "gray";  ?>" href="<?php echo $url ?>"><?php echo lang('appointments:default_view') ?></a>
    <a class="btn <?php echo $this->input->get('view')=='delivery' ?  "green" : "gray";  ?>" href="<?php echo $url ?>&view=delivery" class="button"><?php echo lang('appointments:delivery') ?></a>
    <a class="btn <?php echo $this->input->get('view')=='invoice' ?  "green" : "gray";  ?>" href="<?php echo $url ?>&view=invoice" class="button"><?php echo lang('appointments:invoicing') ?></a>
    <!--
        <a href="admin/appointments?filter=appointment_status&value=prep"><?php echo lang('status_canceled') ?></a>
        <a href="admin/appointments?filter=appointment_status&value=delivery"><?php echo lang('status_delivery') ?></a>
        <a href="admin/appointments?filter=appointment_status&value=delivered"><?php echo lang('status_delivered') ?></a>
        <a href="admin/appointments?filter=appointment_status&value=waiting"><?php echo lang('status_waiting')  ?></a>    
        <a href="admin/appointments?filter=appointment_status&value=cancelled"><?php echo lang('status_canceled') ?></a>        

<div id="views">
</div>   
 -->
<div id="search" style="display: none">
    <form method="get">
        <button class="btn blue" type="submit" name="searchBtn" value="<?php echo lang('appointments:search') ?>" /><?php echo lang('appointments:search') ?></button>
        <a class="btn gray" href="/admin/appointments"><?php echo lang('appointments:reset') ?></a>

    <span class="clearfix"></span>
    
        <div class="appointments-appointment">
            <h2>COMMANDE</h2>
            <?php echo $this->html_m->form_dropdown_appointment_status($this->input->get('appointment_status')) ?>
            <br/>
            <?php echo $this->html_m->form_radio_payment_type($this->input->get('payment_type')) ?>
            <br/>
            <?php echo $this->html_m->form_input('id', $this->input->get('id')) ?>
            <?php echo $this->html_m->form_input('name', $this->input->get('name'),'', lang('appointments:name_alt')) ?>
            <?php echo $this->html_m->form_input('slug', $this->input->get('slug'),'', lang('appointments:slug_alt')) ?>
            <?php echo $this->html_m->form_input('delivery_date', $this->input->get('delivery_date')) ?> 
            <?php echo $this->html_m->form_input('user_id', $this->input->get('user_id')) ?>
            </div>
        <div class="appointments-delivery">
            <h2>LIVRAISON</h2>
            <?php echo $this->html_m->form_input('d_fullname', $this->input->get('d_fullname')) ?>
            <?php echo $this->html_m->form_input('d_company', $this->input->get('d_company')) ?>
            <?php echo $this->html_m->form_input('d_town', $this->input->get('d_town')) ?>
            <?php echo $this->html_m->form_input('d_zipcode', $this->input->get('d_zipcode')) ?>
            <?php echo $this->html_m->form_input('d_mail', $this->input->get('d_mail')) ?>
            <?php echo $this->html_m->form_input('d_mobile', $this->input->get('d_mobile')) ?>
            <?php echo $this->html_m->form_input('d_phone', $this->input->get('d_phone')) ?>
            <?php // echo form_dropdown('payment_type', array('asc' => 'asc', 'desc' => 'desc') , $sortdir); ?>
            <?php //echo $this->html_m->form_sort_fields_dropdown(); ?>
            </div>
    <span class="clearfix"></span>
            <?php echo form_hidden('view', $this->input->get('view')); // keep view ?>
          <button class="btn blue" type="submit" name="searchBtn" value="<?php echo lang('appointments:search') ?>" /><?php echo lang('appointments:search') ?></button>
       <a class="btn gray" href="/admin/appointments"><?php echo lang('appointments:reset') ?></a>
    </form>
</div>
