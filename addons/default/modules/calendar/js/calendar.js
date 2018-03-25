 /* for doctor */
function periodShow(period)
{
    if(typeof(period)!=='undefined' && period.toLowerCase(period) == 'am')
    {
        $('.period-pm').slideUp();
        $('.period-am').slideDown();
        $('#btn-am').addClass('active');
        $('#btn-pm').removeClass('active');
        
    }
    if(typeof(period)!=='undefined' && period.toLowerCase(period) == 'pm')
    {
        $('.period-am').slideUp();
        $('.period-pm').slideDown();
        $('#btn-pm').addClass('active');
        $('#btn-am').removeClass('active');
    }
}

function setTime(time)
{
    console.log(time);
    $('input[name=appointment_time]').val(time);
    $('#container-appt').show();
    $('#weekzone-wrapper').hide();
    
}

$( document ).ready(function() 
{   
    if($('input[name=orderSend]').length) 
    {
            var minAmount = parseFloat( $('#minAllowedAmount').val() ) ;
            
                /* binding checks on stock */
                $('input.order_product').on('change', 
                    function() {
                            if($(this).val() > $(this).data('stock')) $(this).val($(this).data('stock'));
                    }
                );

                /* pre submit checks 
                 *                
                $( "div.content form" ).submit(function( event ) {
                  if($('input[name=jscalc_totax]').val() <= minAmount )
                  {
                      location.hash = '#weekzone-wrapper';
                      alert('Sélectionner ...');
                  } 
                  else if($('input[name=payment_type]:checked').val() === undefined ) 
                  {
                      alert('Choisissez un mode de règlement');
                      location.hash = '#order-details';
                  } 
                  else if($('input[name=jscalc_totax]').val() > minAmount )
                  {
                        $( "#order-form-container" ).slideUp();
                        return;
                  } 
                  else 
                  {
                      location.hash = '#weekzone-wrapper';
                      alert('Sélectionner vos plats et renseignez les informations de livraison');
                  }
                  event.preventDefault();
                });
                 */  
    }      
});