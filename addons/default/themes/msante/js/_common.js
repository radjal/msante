/* generic functions for modules 
 * * move to assets?
 * radja
 */
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
    /*//UIX uses wrapper div with FIELDNAME_ui and anchor buttons with either data attribute or using button/link text as value */
    $('.'+fname+'_ui a').removeClass('active btn-success'); 
    /*//loop button links */
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