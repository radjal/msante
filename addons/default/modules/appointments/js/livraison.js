$( document ).ready(function() 
{   
        /* livraisons */
        if($('input[name=d_zipcode]').length || $('input[name=d_town]').length)
        { // form inputs exist
            var postcode = $('input[name=d_zipcode]').val();
            var town = $('input[name=d_town]').val();
            console.log('livraison for '+postcode+' : '+town);
            
            /* binding */
            $("input[name=d_town] ").on('change', function(){
                    loadDays('', $(this).val());
            });
            $("input[name=d_zipcode] ").on('change', function(){
                    loadDays($(this).val(), '');
            });
         
            /* load once */
            if($('input[name=appointment_date]').val() == '') loadDays(postcode, town);
        }
});

function loadDays(postcode, town)
{
        console.log('loadDays for '+postcode+' : '+town);
        if(postcode.length > 2 ) {
            var url = "/livraison/voir/codepostal/"+postcode ;
        } else if(town.length > 2 ) {
            var url = "/livraison/voir/ville/"+town ;
        }           
        
        if(typeof url !== 'undefined')
        {
            $("#delivery-times").html( pg_load ); 
            //$("input[name=appointment_date]").val('');
            //$("input[name=appointment_date]").removeClass('modified');
            
             $.ajax({url: url, success: function(result){
                   //$("input[name=appointment_date]").val('');
                   $("#delivery-times").html( result ); 
                   console.log('loadDays got '+url+'\n'+ livraison);
                   selectLivraison(livraison);
               }});
        }
        
}

//if(typeof show_day === 'undefined') var show_day=[];
function selectLivraison(r)
{
    if(typeof r.days === 'undefined') return false;

    var days = r.days;    
    var show_day = []; 
    var output = '';
    for (var id in days) {
      show_day[id] = Number(id) ;
      output += '\n'+id + ': ' + days[id]+';';
    }

   console.log('livraison days : '+output);
    if(typeof r.postcode === 'undefined' && typeof r.town === 'undefined') return;
    //action
    if ($('input[name=d_town]').val() != r.town || r.town !='' )
    {
        $('input[name=d_town]').val(r.town);
        $('input[name=d_town]').addClass('modified');
    } 
    if($('input[name=d_zipcode]').val() != r.postcode  || r.postcode !='')
    {
        $('input[name=d_zipcode]').val(r.postcode);
        $('input[name=d_zipcode]').addClass('modified');
    }
    //update datepicker
    change_datepicker(show_day);
    $('input[name=log]').val('selectLivraison '+output+'\n'+$('input[name=log]').val());
}
 

 
