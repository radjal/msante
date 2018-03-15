//calendar js
function mobile_calendars()
{
        /*semaine*/
        if($('#blackboard > center.calendar-semaine-titre').length)  
        {
            $('#blackboard div.calendar_titre').each(function() { $( this ).text('+' +  $( this ).html()) } );
            $('#blackboard div.calendar_titre').each(function() {$(this).on('click', 
                function() {
                    event.preventDefault();

                    if($(this).text().indexOf('-') == 0)
                    {
                        $(this).html( $(this).text().replace('-', '+'));
                    }   else {
                        $(this).html( $(this).text().replace('+', '-')); 
                    }
                    $(this).siblings('section').slideToggle();    
                }
            );});
            $('#blackboard div.calendar section').slideUp();
        }
        
        /*jour*/
        if($('#blackboard div.calendarjour').length) 
        {
            $('#blackboard div.calendar_separator').each(function() { $( this ).text('+' +  $( this ).html()) } );
            $('#blackboard div.calendarjour section div.content').slideUp();
            $('#blackboard div.calendar_separator').each(function() {$(this).on('click', 
                function() 
                {
                    event.preventDefault();

                    if($(this).text().indexOf('-') == 0)
                    {
                        $(this).html( $(this).text().replace('-', '+'));
                    }   else {
                        $(this).html( $(this).text().replace('+', '-')); 
                    }
                    $(this).siblings('div.content').slideToggle(); 
                }
            );});
            
            $('#order-details h4, #order-delivery h4').each(function() { $( this ).text('+' +  $( this ).html()) } );
            $('#order-details > section, #order-details p.profile_fields, #order-delivery > div').slideUp();
            
            $('#order-delivery h4').on('click', 
                function() 
                {
                    event.preventDefault();

                    if($(this).text().indexOf('-') == 0)
                    {
                        $(this).html( $(this).text().replace('-', '+'));
                    }   else {
                        $(this).html( $(this).text().replace('+', '-')); 
                    }
                    $(this).siblings('#order-delivery > div').slideToggle(); 
                }
            );
    
            $('#order-details h4').on('click', 
                function() 
                {
                    event.preventDefault();

                    if($(this).text().indexOf('-') == 0)
                    {
                        $(this).html( $(this).text().replace('-', '+'));
                    }   else {
                        $(this).html( $(this).text().replace('+', '-')); 
                    }
                    $(this).siblings('#order-details > section').slideToggle(); 
                    $('#order-details p.profile_fields').slideToggle(); 
                }
            );
        }
                
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
                      location.hash = '#blackboard-wrapper';
                      alert('Sélectionner vos plats. Le total doit être au moins de '+minAmount+'€');
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
                      location.hash = '#blackboard-wrapper';
                      alert('Sélectionner vos plats et renseignez les informations de livraison');
                  }
                  event.preventDefault();
                });
                 */ 
        
    }
                
        
});