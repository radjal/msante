$( document ).ready(function() 
{   
    if(paypalSelectedCheck()) paypalLoad('paypalPay()');
//    if(paypalSelectedCheck()) paypalLoad();
        
});

function paypalLoad(callback) 
{
    if(typeof callback === 'undefined') callback ='';
        /* load Paypal */
        $.ajaxSetup({
            cache: true
          });
        $.getScript( "https://js.braintreegateway.com/js/braintree-2.27.0.min.js", 
                function(){ 
                    console.log( "Braintree loaded. callback: " + callback );
                    eval(callback);
        });    
}

function paypalSelectedCheck() 
{
            var choice = $("input[name=payment_type]").val();
            var status = $('input[name=order_status]').val();
            var payment = $('input[name=payment_status]').val();
            
            if(typeof status === 'undefined') status = '';
            var oid = $("input[name=id]").val();
            if(typeof status === 'undefined') status ='';
            if(typeof oid === 'undefined') oid ='';
            if(typeof payment === 'undefined') payment = '';
            
            console.log('paypalCheck oid:'+oid+' payment_type:'+choice+' order_status:'+status+' payment_status:'+payment);
            if(choice == 'cc' && status == '' && oid !=''  && payment =='' ) return true;
            return false;
}

function paypalPay()
{           
            if(paypalSelectedCheck())
            {
                console.log('paypalPay');
                if($('#paypal-container').length == 0 )  $('#payment-type-ui').append('<div id="paypal-container"></div>');
                /*if($('#paypal-container').length == 0 )  $('#payment-type').prepend('<div id="paypal-container"></div>');*/
                
                $('#payment-type').prepend(pg_load);
                
                /* custom vars */
                var oid = $("input[name=id]").val();
                var amount = $('input[name=total_final]').val();
                var slug = $('input[name=slug]').val();
                
                var name = $('input[name=i_fullname]').val();
                var address1 = $('input[name=i_street1]').val();
                var address2 = $('input[name=i_street2]').val();
                var town = $('input[name=i_town]').val();
                var postcode = $('input[name=i_zipcode]').val();
                var region = '';
                var countryCode = 'FR';
                var phone = $('input[name=i_phone]').val();
                var mail = $('input[name=i_mail]').val();
               /* */
               
                // Get token via server
                $.ajaxSetup({
                    cache: false
                  });
                $.getScript( "/orders/paypal/getToken?oid="+oid, 
                        function(){ 
                            console.log( "token received\n" + paypal_token );
                            /*$('input[name=log]').val(paypal_token);*/
                            //$('#payment-type img').remove();
                             
                        /* paypal */
                        var checkout;
                                braintree.setup(paypal_token, 'custom', {
                                    paypal: {
                                      container: 'paypal-container',
                                      singleUse: true, // Required
                                      amount: amount, // Required
                                      currency: 'EUR', // Required
                                      locale: 'fr_fr',
                                     enableShippingAddress: true,
                                     shippingAddressOverride: {
                                       recipientName: name,
                                       streetAddress: address1,
                                       extendedAddress: address2,
                                       locality: town,
                                       countryCodeAlpha2: countryCode,
                                       postalCode: postcode,
                                       region: region,
                                       phone: phone,
                                       editable: false
                                     }
                                    },
                                    onReady:function(){$('#payment-type img').remove();},
                                    onPaymentMethodReceived: function (obj) {
                                       /* client has paid */
                                        $('#paypal-container').hide();
                                        var msg =  'payment receive, nonce: '+obj.nonce+'\ntype: '+obj.type+'\n' ;
                                        console.log(msg);
                                        $('input[name=log]').val(msg+'\n'+$('input[name=log]').val());
                                        /* send nonce to server */
                                        var url = '/orders/paypal/sendNonce?nonce='+obj.nonce+'&oid='+oid+'&amount='+amount+'&slug='+slug;
                                        $.ajax({url: url}).done(function( data ) {
                                                            console.log('server resp:\n'+url+'\n'+data);
                                                            /* save info */
                                                            $('input[name=log]').val('server resp:\n'+data+'\n'+$('input[name=log]').val());
                                                            $("input[name=payment_status]").val('paid');
                                                            //$("#payment-status input[value=paid]").attr('disabled', false);
                                                            //$("#payment-status input[value=paid]").attr('checked', true);
                                                            /* save order again with info */
                                                           $('#order-form form').submit();
                                                });
//                                        $.getScript( url, 
//                                                        /* server responded */
//                                                        function(data){    
//                                                        }
//                                                    );
                                    },
                                    onCancelled: function() {
                                        $("input[name=payment_status]").val('cancelled');
                                        console.log('PayPal unsupported');
                                        $('input[name=log]').val('PayPal cancelled\n'+$('input[name=log]').val());
                                                           $('#order-form form').submit();
									},
                                        onUnsupported: function(type, message) {
                                        //alert('Paypal error');
                                        $("input[name=payment_status]").val('error');
                                        console.log('PayPal unsupported');
                                        $('input[name=log]').val('PayPal unsupported\n'+$('input[name=log]').val());
                                                           $('#order-form form').submit();
									},
                                    onError: function(type, message) {
                                        //alert('Paypal error');
                                        $("input[name=payment_status]").val('error');
                                        console.log('Paypal error\n'+type+'\n'+message);
                                        $('input[name=log]').val('Paypal error\n'+type+'\n'+message+'\n'+$('input[name=log]').val());
                                                           $('#order-form form').submit();
                                        //$.getScript("/orders/paypal/log?oid="+oid);
                                    }
                              });
                });
            } else {
                $('#paypal-container').remove();
                $('#payment-type img').remove();
                $('input[name=log]').val('checkPaypal exited'+'\n'+$('input[name=log]').val());                                        
                console.log('checkPaypal exited');                                        
            }
}