<?php 
$disabled = '';
if($disabled)  $disabled='disabled';
?><!doctype html>

<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if gt IE 8]> <html class="no-js" lang="en"> 		   <![endif]-->

<head>
	<meta charset="utf-8">

	<!-- You can use .htaccess and remove these lines to avoid edge case issues. -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title><?php echo $appointment->d_company .' '. $appointment->d_fullname .' - '. $appointment->total_final . '€ - ' . $appointment->d_street1.$appointment->d_street2.', '.$appointment->d_town  ?></title>

	<!-- Mobile viewport optimized -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<link href="https://fonts.googleapis.com/css?family=Amita|Delius|Sriracha" rel="stylesheet">
        
<style type="text/css">
/* CSS for print */
    body {
        font-size: 14px;
        color: black;
        font-weight:100;
        max-width: 800px;
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    }
    a {
            font-size: inherit;
            font-weight: inherit;
            color: #38a7e6;
            text-decoration: none;
            -webkit-transition: 200ms linear all;
            -moz-transition: 200ms linear all;
            -o-transition: 200ms linear all;
            transition: 200ms linear all;
    }
    div {}
    label {}
    input {
        background: #fff;
        bappointment: none;
        text-shadow: none;
        box-shadow: none;
        font-size: 14px;
        left: 150px;
        position: absolute;
    }
    textarea {
        background: #fff;
        bappointment: none;
        text-shadow: none;
        box-shadow: none;
        font-size: 20px;
    }
    hr {
        height: 1px;
        bappointment: none;
        background-color: #808080;
    }
    table {
        width: 100%;
        text-align: left;
        max-width: 700px;
    }
    h1, h2, h3, h4, h5, h6 {
        font-size: 18px;
        margin: 6px 0;
    }
    .slogan {
        width:100%;
        text-align: center;
        font-size: 13pt;
        font-family: 'Amita', cursive;
    }
    .footer {
        font-size: 10pt;
        text-align: center;
        bottom: 0px;
        margin-top: 50px;
        width: 100%;
    }
    .btn .gray {
            color: #333333;
            text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
            background-color: #f5f5f5;
            *background-color: #e6e6e6;
            background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
            background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
            background-repeat: repeat-x;
            bappointment-color: #e6e6e6 #e6e6e6 #bfbfbf;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
    }
    .btn.gray:hover {
            color: #333333;
            background-color: #e6e6e6;
    }
    .btn {
            display: inline-block;
            *display: inline;
            padding: 4px 12px;
            margin-top: 5px;
            margin-bottom: 0;
            *margin-left: .3em;
            font-size: 14px;
            line-height: 20px;
            color: #333333;
            text-align: center;
            text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
            vertical-align: middle;
            cursor: pointer;
            background-color: #f5f5f5;
            *background-color: #e6e6e6;
            background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
            background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
            background-repeat: repeat-x;
            bappointment: 1px solid #bbbbbb;
            *bappointment: 0;
            bappointment-color: #e6e6e6 #e6e6e6 #bfbfbf;
            bappointment-bottom-color: #a2a2a2;
            -webkit-bappointment-radius: 4px;
               -moz-bappointment-radius: 4px;
                    bappointment-radius: 4px;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            *zoom: 1;
            -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
               -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
                    box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
    }

    .btn:hover {
            color: #333333;
            text-decoration: none;
            background-position: 0 -15px;
    }

    .btn,
    .btn a,
    a.btn {
            color: #333333;
    }

    .btn:hover,
    .btn a:hover,
    a.btn:hover {
            color: #fff;
            -webkit-transition: 0ms linear all !important;
               -moz-transition: 0ms linear all !important;
                 -o-transition: 0ms linear all !important;
                    transition: 0ms linear all !important;
    }
    #site_title {
            width: 100%;
            font-size: 24px;
            text-align: center;
            margin: 0;
            font-family: 'Amita', cursive;
    }
    #cart-total {
            text-align: right;
            font-size: 14px;
            font-weight: bold;
            padding-right: 10px;
    }
    #appointment-cart,
    #appointment-details,
    #appointment-invoice,
    #appointment-delivery,
    #appointment-extra,
    #appointment-id {
        margin-top: 20px;
    }
    #appointment-cart table thead tr th:nth-child(1) {
        text-align: left;    
    }
    #appointment-cart table tbody tr td:nth-child(1) {
        text-align: left;
    }
    #appointment-cart table tbody tr {
    }
    /* do not print */
    @media only print {
        .noshow {
            display: none;
        }
}
</style>

</head>
<body><a href="javascript:window.print()" class="noshow btn grey"><?php echo lang('appointments:print'); ?></a>

<h1 id="site_title"><?php echo Settings::get('site_name') ?></h1>
<h2 class="slogan"><?php echo Settings::get('site_slogan') ?></h2>

        
    	<!-- appointment-details -->
        <div  id="appointment-details">
                    <?php echo $this->html_m->form_input('delivery_date', $appointment->delivery_date, $disabled ); ?>
                    <?php echo $this->html_m->form_input('appointment_time', $appointment->appointment_time, $disabled ); ?>
                    <label for="payment_type"><?php echo lang('appointments:payment_type'); ?></label>
                    <?php echo form_input('payment_type', lang('appointments:po_'.$appointment->payment_type), $disabled ); ?> 
                    <?php echo $this->html_m->form_input('total_pretax', $appointment->total_pretax.'€', $disabled ); ?>
                    <?php echo $this->html_m->form_input('total_final', $appointment->total_final.'€' , $disabled ); ?>
	 </div> 

        <!-- appointment-cart -->
        <div id="appointment-cart" class="appointment section cart" >
                <table>
                    <thead>
                            <tr>
                                <th><?php echo lang('appointments:product_name'); ?></th>
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
                                    <div id="cart-total">
                                        <?php echo $totals['total_price']; ?>€ H.T
                                        <?php echo $totals['total_taxed']; ?>€ T.T.C
                                    </div>
                                </td>
                            </tr>
                    </tfoot>
                </table>
        </div>  
        
        <!-- appointment-delivery -->
	<div id="appointment-delivery">
                    <?php echo $this->html_m->form_input('i_company', $appointment->d_company, $disabled) ; ?>
                    <?php echo $this->html_m->form_input('d_fullname', $appointment->d_fullname, $disabled ); ?>
                    <?php echo $this->html_m->form_input('d_mobile', $appointment->d_mobile, $disabled ); ?>
                    <?php echo $this->html_m->form_input('d_phone', $appointment->d_phone, $disabled ); ?>
                    <?php echo $this->html_m->form_input('d_mail', $appointment->d_mail, $disabled ); ?>
                    <?php echo $this->html_m->form_input('d_street1', $appointment->d_street1, $disabled ); ?>
                    <?php echo $this->html_m->form_input('d_street2', $appointment->d_street2, $disabled ); ?>
                    <?php echo $this->html_m->form_input('d_town', $appointment->d_town, $disabled ); ?>
                    <?php echo $this->html_m->form_input('d_zipcode', $appointment->d_zipcode, $disabled ); ?>
                    <?php //echo $this->html_m->form_input('d_country', $appointment->d_country, $disabledAttr ); ?>
                    <?php
                    if(!empty($appointment->message)) 
                    {
                        echo '<hr/><div id="message">';
                        echo $appointment->message ;
                        echo '</div><hr/>';
                    }
                    ?>
                    <div id="map"></div>
	 </div>
        
	<div  id="appointment-id">
                    <?php echo $this->html_m->form_input('slug', $appointment->slug, $disabled, 'Identifiant commande'); ?>
                    <?php echo $this->html_m->form_input('appointment_date', $appointment->appointment_date, $disabled ); ?>
	 </div>
        
        <!-- appointment-invoice -->
<!--	<div  id="appointment-invoice">
            <h2><?php echo lang('appointments:appointment_invoice'); ?></h2>
				
                    <?php echo $this->html_m->form_input('i_company', $appointment->i_company, $disabled) ; ?>
                    <?php echo $this->html_m->form_input('i_fullname', $appointment->i_fullname, $disabled ); ?>
                    <?php echo $this->html_m->form_input('i_mobile', $appointment->i_mobile, $disabled ); ?>
                    <?php echo $this->html_m->form_input('i_phone', $appointment->i_phone, $disabled ); ?>
                    <?php echo $this->html_m->form_input('i_mail', $appointment->i_mail, $disabled ); ?>
                    <?php echo $this->html_m->form_input('i_street1', $appointment->i_street1, $disabled ); ?>
                    <?php echo $this->html_m->form_input('i_street2', $appointment->i_street2, $disabled ); ?>
                    <?php echo $this->html_m->form_input('i_town', $appointment->i_town, $disabled ); ?>
                    <?php echo $this->html_m->form_input('i_zipcode', $appointment->i_zipcode, $disabled ); ?>
                    <?php //echo $this->html_m->form_input('i_country', $appointment->i_country, $disabledAttr ); ?>
        </div> 
-->
<p class="footer">
    <?php echo $variables['infos_societe'] ?>
</p>
</body>
</html>