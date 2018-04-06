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
    $('input[name=appointment_time]').val(time);
    ftime = formatTime(time);
    ftime =  time<=1200 ?  ftime += ' du matin' : ftime += ' de l\'après midi' ;
    $('.appt-time span').text(ftime);
    $('#weekday-wrapper').hide(); 
    $('#container-appt').slideDown();
    console.log(time); 
    console.log(ftime); 
} 
/* generic */
/* user flow */
function setIsForMe(obj) /* step 1 */
{
    $('#appt-patient').html(userForm);
     
    $('#appt-patient').removeClass('hidden');
    var value = $(obj).attr('data-value').toLowerCase(); 
    console.log(value); 
    $('#appt-info').hide(); 
    $('.for_user_ui a').removeClass('active btn-success'); 
    $(obj).addClass('active btn-success'); 
    if(value === 'yes') 
    {  
            $('#appt-patient .info input').attr('readonly', true); 
            $('#appt-patient, #appt-gender').show(); 
            $('.msgBox span').text('Il est important que le médecin connaisse votre identité, merci de remplir les champs suivants'+' :'); 
            $('.msgBox').slideDown(); 
            $('#appt-gender a').addClass('disabled');
    } else { 
            $('#appt-patient .info input').attr('readonly', false); 
            $('#appt-patient, #appt-gender').show(); 
            $('.msgBox span').text('Il est important que le médecin connaisse l\'identité de votre proche, merci de remplir les champs suivants'+' :'); 
            $('.profile_fields-txt, .msgBox').slideUp(); 
            $('#appt-gender a, .insurance_ui a,.knows_doctor_ui a').removeClass('btn-success active disabled'); 
            
            $('#appt-patient input').val(''); 
            
    }
    
    $('#appt-info').slideDown(); 
    $('input#for_user').val(value);
//    $('.for_user_ui a').addClass('disabled');
} 
function setGender(obj) /* step 2 */
{ 
    var value = $(obj).attr('data-value').toLowerCase(); 
    if(value === 'femme') 
    {   
        // f
        $('.field-mainden_name').slideDown();
        $('.field-mainden_name input').val($('input[name=last_name]').val()); /* family name */
    } else {  
        // h
        $('.field-mainden_name').slideUp();
        $('.field-mainden_name input').val('');
    }
    $('#appt-gender a').removeClass('active btn-success'); 
    $(obj).addClass('active btn-success'); 
} 
var userForm;
$( document ).ready(function() 
{     
    userForm = $('#appt-patient').html();
});