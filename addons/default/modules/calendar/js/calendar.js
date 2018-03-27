 /* for doctor module output */
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
 /* for appointments input */
function setTime(time)
{
    console.log(time);
    $('input[name=appointment_time]').val(time);
    $('.appt-time span').text(time);
    $('#weekday-wrapper').hide(); 
    $('#container-appt').slideDown();
}

function setField(fname, object)
{
    if(typeof(fname)==='undefined' || fname==='') return;
//    if(typeof(object)==='undefined' || object==='') return;   '  
    var value = $(object).attr('data-value'); 
    var usedata = false; 
    if (typeof(value)==='undefined' || value==='')
    {
        value = false;
    } else {
        value = $(object).attr('data-value').toLowerCase();
        usedata = true;
    }
    if (!usedata) {
        value = $(object).text().toLowerCase(); 
    }
    //UIX
    $('.'+fname+'_ui a').removeClass('active btn-success'); 
    //loop button links
    $('.'+fname+'_ui a').filter(function(i)
    { 
        if(usedata) {
            if(value === $(this).attr('data-value').toLowerCase() ) $(this).addClass('active btn-success');
        } else {
            if(value === $(this).text().toLowerCase() ) $(this).addClass('active btn-success');
        } 
    }); 
    $('.'+fname+'_ui input').val(value); 
    return value;
} 

function setOtherPerson(obj)
{
    var value = $(obj).attr('data-value').toLowerCase();
    console.log(value); 
    $('.other_person_ui a').removeClass('active btn-success'); 
    $(obj).addClass('active btn-success'); 
    if(value === 'yes') 
    {  
            $('#appt-patient .input').addClass('disabled'); 
//            $('#appt-patient, #appt-gender').hide(); 
    } else {
            $('#appt-patient, #appt-gender').show(); 
    }
    $('#other_person').val(value);
} 

$( document ).ready(function() 
{    
    if($('input[name=orderSend]').length) 
    {
//            var minAmount = parseFloat( $('#minAllowedAmount').val() ) ;
            
                /* binding checks on stock
                $('input.order_product').on('change', 
                    function() {
                            if($(this).val() > $(this).data('stock')) $(this).val($(this).data('stock'));
                    }
                ); */

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