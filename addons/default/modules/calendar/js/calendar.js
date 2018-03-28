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
function formatTime(time)
{
    time = String(time);
    console.log(time);
    var h = time.substring(0,2);
    var m = time.substring(2); 
    return h+':'+m;
} 
function setField(fname, object)
{
    if(typeof(fname)==='undefined' || fname==='') return; 
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
            $('#appt-patient input').addClass('disabled');  
    } else {
            $('#appt-patient, #appt-gender').show(); 
    }
    $('#other_person').val(value);
} 
function setGender(obj)
{ 
} 

$( document ).ready(function() 
{     
});