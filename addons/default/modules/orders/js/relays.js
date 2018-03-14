$( document ).ready(function() 
{       
        var lang = {};
        lang.openBtn = '+ Choisissez un Point Relais pour vous faire livrer';
        lang.closeBtn = '- Cacher les Points Relais';

        var status = $('input[name=order_status]').val();
        var payment = $('input[name=payment_type]').val();
        if(typeof status === 'undefined') status = '';
        if(typeof payment === 'undefined') payment = '';
        
        /* relays */
        if($('#relays-list').length ==0 && status =='' && payment =='') 
        {
            $('#order-delivery > h4').after('<div id="relays-list"></div>')  ;
            $('#order-delivery > h4').after('<a id="jscart-relays" class="btn">'+lang.openBtn+'</a>')  ;

            //binding
            $("a#jscart-relays").click(function(){
                if($('li.relay').length == 0)
                {   /*first time*/
                        //$("a#jscart-relays").hide();
                        $("#relays-list").html(pg_load);
                        $("#relays-list").show();
                        $("#order-details").slideUp();
                        $("#order-cart").hide();
                        $("a#jscart-relays").hide();
                        $.ajax({url: "/relay", success: function(result){
                            $("#relays-list").hide();
                            $("#relays-list").slideDown();
                            $("a#jscart-relays").show().text(lang.closeBtn);
                            $("#relays-list").html(result);
                        }});
                } else {
                    /*already called*/
                    event.preventDefault();
                    $("#relays-list").toggle();
                        if($(this).text().indexOf('-') == 0)
                        {
                            //$(this).html( $(this).text().replace('-', '+'));
                            $("a#jscart-relays").text(lang.openBtn);
                        }   else {
                            //$(this).html( $(this).text().replace('+', '-')); 
                            $("a#jscart-relays").text(lang.closeBtn);
                        }
                    
                    //$("a#jscart-relays-close").show();
                    //$("a#jscart-relays").hide();
                }
          
            });
        };
        
        
});

// if(typeof relay === 'undefined') var relay = [];  
function selectRelay(r)
{
    var lang = {};
    lang.confirm = 'Vous devez payer votre commande à l\'avance par Carte Bleu pour être livré en Point Relais.';
    var choice = confirm(lang.confirm);
    if(!choice) return;
    
    var gsd = show_day;
    var show_day = [];
    var id = r.id.split('-'); id = id[1];
    //console.log(id);
    var rel = relay[id];     
    var output = '';
    for (var dayid in rel.days) {
      show_day[dayid] = Number(dayid) ;
      output += dayid + ': ' + rel.days[dayid]+'; \n';
    }

    
    //action    
    if ($('input[name=payment_type]').length==0) 
    {
        $('#order-button-wrapper').append('<input type="hidden" name="payment_type" value="cc"/>');
    } else {
        $('input[name=payment_type]').val('cc');
    }
    $('input[name=d_company]').fadeOut('fast').val(rel.name).fadeIn('fast').addClass('modified');
    $('input[name=d_street1]').fadeOut('fast').val(rel.address).fadeIn('fast').addClass('modified');
    $('input[name=d_street2]').val('').addClass('modified');
    $('input[name=d_town]').fadeOut('fast').val(rel.town).fadeIn('fast').addClass('modified');
    $('input[name=d_zipcode]').fadeOut('fast').val(rel.postcode).fadeIn('fast').addClass('modified');
   // $('input[name=d_country]').val('');
    
    //styling
    $('.selected_relay').removeClass('selected_relay');
    $('#relay-'+rel.id).addClass('selected_relay');
    $('#delivery-times').html(rel.name +'<br/>'+ rel.hours);
    $('#order-details').show('fast');
    $('#relays-list').slideUp();
    //$('#jscart-relays-close').hide();
    $('a#jscart-relays').hide();
    
    //update datepicker
    change_datepicker(show_day);
    
    console.log('selectRelay : '+rel.name);
    $('input[name=log]').val('selectRelay '+rel.name+'\n'+$('input[name=log]').val());
    //paypalLoad('paypalPay()');
}
 
