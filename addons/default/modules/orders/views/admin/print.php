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

	<title><?php echo $order->d_company .' '. $order->d_fullname .' - '. $order->total_final . '€ - ' . $order->d_street1.$order->d_street2.', '.$order->d_town  ?></title>

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
        border: none;
        text-shadow: none;
        box-shadow: none;
        font-size: 14px;
        left: 150px;
        position: absolute;
    }
    textarea {
        background: #fff;
        border: none;
        text-shadow: none;
        box-shadow: none;
        font-size: 20px;
    }
    hr {
        height: 1px;
        border: none;
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
            border-color: #e6e6e6 #e6e6e6 #bfbfbf;
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
            border: 1px solid #bbbbbb;
            *border: 0;
            border-color: #e6e6e6 #e6e6e6 #bfbfbf;
            border-bottom-color: #a2a2a2;
            -webkit-border-radius: 4px;
               -moz-border-radius: 4px;
                    border-radius: 4px;
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
    #order-cart,
    #order-details,
    #order-invoice,
    #order-delivery,
    #order-extra,
    #order-id {
        margin-top: 20px;
    }
    #order-cart table thead tr th:nth-child(1) {
        text-align: left;    
    }
    #order-cart table tbody tr td:nth-child(1) {
        text-align: left;
    }
    #order-cart table tbody tr {
    }
    /* do not print */
    @media only print {
        .noshow {
            display: none;
        }
}
</style>

</head>
<body><a href="javascript:window.print()" class="noshow btn grey"><?php echo lang('orders:print'); ?></a>

<h1 id="site_title"><?php echo Settings::get('site_name') ?></h1>
<h2 class="slogan"><?php echo Settings::get('site_slogan') ?></h2>

        
    	<!-- order-details -->
        <div  id="order-details">
                    <?php echo $this->html_m->form_input('delivery_date', $order->delivery_date, $disabled ); ?>
                    <?php echo $this->html_m->form_input('delivery_time', $order->delivery_time, $disabled ); ?>
                    <label for="payment_type"><?php echo lang('orders:payment_type'); ?></label>
                    <?php echo form_input('payment_type', lang('orders:po_'.$order->payment_type), $disabled ); ?> 
                    <?php echo $this->html_m->form_input('total_pretax', $order->total_pretax.'€', $disabled ); ?>
                    <?php echo $this->html_m->form_input('total_final', $order->total_final.'€' , $disabled ); ?>
	 </div> 

        <!-- order-cart -->
        <div id="order-cart" class="order section cart" >
                <table>
                    <thead>
                            <tr>
                                <th><?php echo lang('orders:product_name'); ?></th>
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
        
        <!-- order-delivery -->
	<div id="order-delivery">
                    <?php echo $this->html_m->form_input('i_company', $order->d_company, $disabled) ; ?>
                    <?php echo $this->html_m->form_input('d_fullname', $order->d_fullname, $disabled ); ?>
                    <?php echo $this->html_m->form_input('d_mobile', $order->d_mobile, $disabled ); ?>
                    <?php echo $this->html_m->form_input('d_phone', $order->d_phone, $disabled ); ?>
                    <?php echo $this->html_m->form_input('d_mail', $order->d_mail, $disabled ); ?>
                    <?php echo $this->html_m->form_input('d_street1', $order->d_street1, $disabled ); ?>
                    <?php echo $this->html_m->form_input('d_street2', $order->d_street2, $disabled ); ?>
                    <?php echo $this->html_m->form_input('d_town', $order->d_town, $disabled ); ?>
                    <?php echo $this->html_m->form_input('d_zipcode', $order->d_zipcode, $disabled ); ?>
                    <?php //echo $this->html_m->form_input('d_country', $order->d_country, $disabledAttr ); ?>
                    <?php
                    if(!empty($order->message)) 
                    {
                        echo '<hr/><div id="message">';
                        echo $order->message ;
                        echo '</div><hr/>';
                    }
                    ?>
                    <div id="map"></div>
	 </div>
        
	<div  id="order-id">
                    <?php echo $this->html_m->form_input('slug', $order->slug, $disabled, 'Identifiant commande'); ?>
                    <?php echo $this->html_m->form_input('order_date', $order->order_date, $disabled ); ?>
	 </div>
        
        <!-- order-invoice -->
<!--	<div  id="order-invoice">
            <h2><?php echo lang('orders:order_invoice'); ?></h2>
				
                    <?php echo $this->html_m->form_input('i_company', $order->i_company, $disabled) ; ?>
                    <?php echo $this->html_m->form_input('i_fullname', $order->i_fullname, $disabled ); ?>
                    <?php echo $this->html_m->form_input('i_mobile', $order->i_mobile, $disabled ); ?>
                    <?php echo $this->html_m->form_input('i_phone', $order->i_phone, $disabled ); ?>
                    <?php echo $this->html_m->form_input('i_mail', $order->i_mail, $disabled ); ?>
                    <?php echo $this->html_m->form_input('i_street1', $order->i_street1, $disabled ); ?>
                    <?php echo $this->html_m->form_input('i_street2', $order->i_street2, $disabled ); ?>
                    <?php echo $this->html_m->form_input('i_town', $order->i_town, $disabled ); ?>
                    <?php echo $this->html_m->form_input('i_zipcode', $order->i_zipcode, $disabled ); ?>
                    <?php //echo $this->html_m->form_input('i_country', $order->i_country, $disabledAttr ); ?>
        </div> 
-->
<p class="footer">
    <?php echo $variables['infos_societe'] ?>
</p>
</body>
</html>