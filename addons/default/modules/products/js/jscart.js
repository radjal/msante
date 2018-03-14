function jstotalcalc() 
{
    console.log('jscart products');
    var ht = 0;
    var ttc = 0;
    var count = 0;
    var items = 0;
    $('input.order_product').each(function() {  
            if($(this).val() > 0 ) {
                    count += 1 ;
                    items += Number($(this).val()) ;
                    var amount = $(this).val().replace(',', '.');
                    var dtprice = $(this).attr('data-dtprice');
                    var price = $(this).attr('data-price');
                    ht += ( Number(dtprice)  * Number(amount) )  ;  
                    ttc += ( Number(price)  * Number(amount) )  ;  
                    console.log($(this).val() + ' x '+ price);
            }
//            console.log($(this).attr('data-price'));
//            console.log($(this).attr('data-dtprice'));
    });
    if(count > 1) {
            $('#jscart-total').append(' ('+count+' produits)<br/>');
    }
    
    var detax = ht.toFixed(2);
    var totax = ttc.toFixed(2);
    
    $('input[name=jscalc_totax]').val(totax);
    $('#jscart-total').html('<ul><li>Total HT: '+detax+'€</li><li>Total TTC: '+totax+'€</li><ul>');
    return totax ;
}



$( document ).ready(function() {
  var ht = 0;
  var ttc = 0;
  var html = '<ul id="jscart-total"><li>Total HT</li><li>Total TTC</li></ul><input name="jscalc_totax" type="hidden" />';
    if($('#cart-total').length) $('#cart-total ul').replaceWith(html);
    if($('#jscart-total').length == 0 ) $('#order-button-wrapper').prepend(html)  ;
     
    $('input.order_product').on('keyup keypress blur change', function(){
                var val = $(this).val().replace(',', '.') ;
                $(this).val(val);
                jstotalcalc();
            });
    jstotalcalc();
});