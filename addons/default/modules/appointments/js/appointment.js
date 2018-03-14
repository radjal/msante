$( document ).ready(function() 
{   
        var lang = {
            choose:'Veuillez choisir une date et vérifiez les informations de livraison avant de commander.\n',
            reload:'<br/><a href="appointments" class="small">Rechargez la page si vous souhaiter recommencer</a>' ,
            profile:'<br/><a href="users/edit" class="small">Modifier les informations qui s\'affichent par défaut dans le formulaire</a>' 
        };
        
        
        /* visual styling */
        $('div.appointment.section').hide();
        $('div.appointment-menu ').show();
        $('#appointment-cart').show('fast');
        $('#appointment-details').show('fast');
        $('#appointment-delivery').show('fast');
        
        /*help*/
        if($('input[name=delivery_date]').val()=='') 
        {
            $("#appointment-details-info").html(lang.choose+lang.reload+lang.profile).fadeIn();
            
        }
        /*binding delivery date */
//        if($('input[name=delivery_date]').length) 
//        {
//            //binding
//            $("input[name=delivery_date]").change(
//                    function(){
//                        if($(this).val() != '') $('#appointment-msg')
//                    });
//            
//        }
});
