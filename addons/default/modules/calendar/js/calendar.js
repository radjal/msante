//calendar js
function mobile_calendars()
{
        /*semaine*/
        if($('#weekzone > center.calendar-semaine-titre').length)  
        {
            $('#weekzone div.calendar_titre').each(function() { $( this ).text('+' +  $( this ).html()) } );
            $('#weekzone div.calendar_titre').each(function() {$(this).on('click', 
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
            $('#weekzone div.calendar section').slideUp();
        }
        
        /*jour*/
        if($('#weekzone div.calendarjour').length) 
        {
            $('#weekzone div.calendar_separator').each(function() { $( this ).text('+' +  $( this ).html()) } );
            $('#weekzone div.calendarjour section div.content').slideUp();
            $('#weekzone div.calendar_separator').each(function() {$(this).on('click', 
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
                      location.hash = '#weekzone-wrapper';
                      alert('Sélectionner vos plats et renseignez les informations de livraison');
                  }
                  event.preventDefault();
                });
                 */  
    }      
});