
/*load order cart list*/
function load_cart(link) 
{
    console.log('load_cart '+link);
    var uri = window.location.pathname;
    var oid = uri.split('/').pop();
    if(typeof link == 'undefined') var link = SITE_URL + "admin/orders/list/order/"+oid;
    $.ajax({
        url: link,
        cache: false
      }).done(function( html ) {
        $( "#order-cart" ).html( html );
      });
}

function modify_list()
{
    event.preventDefault();
    $('section.item form').attr('action', BASE_URL + 'orders/admin/modify');
    $('section.item form').submit();
}

jQuery(function($)
{
    if($( "input[name=delivery_date]" ).length)
    {

                    // generate a slug when the user types a title in
                    //pyro.generate_slug('input[name="name"]', 'input[name="slug"]');

                    /* visual styling */
                    $( "#form_inputs" ).tabs();

                    /* datepicker widget jQuery UI */
                    $( "input[name=delivery_date]" ).datepicker({
                            dateFormat: 'yy-mm-dd' 
                    });

                    /* datepicker localisation */
                     $.datepicker.regional["fr"] = {
                            clearText: "Effacer", clearStatus: "",
                            closeText: "Fermer", closeStatus: "Fermer sans modifier",
                            prevText: "&lt;Préc", prevStatus: "Voir le mois précédent",
                            nextText: "Suiv&gt;", nextStatus: "Voir le mois suivant",
                            currentText: "Courant", currentStatus: "Voir le mois courant",
                            monthNames: ["Janvier","Février","Mars","Avril","Mai","Juin",
                            "Juillet","Août","Septembre","Octobre","Novembre","Décembre"],
                            monthNamesShort: ["Jan","Fév","Mar","Avr","Mai","Jun",
                            "Jul","Aoû","Sep","Oct","Nov","Déc"],
                            monthStatus: "Voir un autre mois", yearStatus: "Voir un autre année",
                            weekHeader: "Sm", weekStatus: "",
                            dayNames: ["Dimanche","Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi"],
                            dayNamesShort: ["Dim","Lun","Mar","Mer","Jeu","Ven","Sam"],
                            dayNamesMin: ["Di","Lu","Ma","Me","Je","Ve","Sa"],
                            dayStatus: "Utiliser DD comme premier jour de la semaine", dateStatus: "Choisir le DD, MM d",
                            dateFormat: "dd/mm/yy", firstDay: 1, 
                            initStatus: "Choisir la date", isRTL: false
                    };

                    $.datepicker.setDefaults($.datepicker.regional["fr"]);
    }
     if($( "#order-cart.ajax-cart" ).length)
     {
         $('#order-cart table thead tr th a').each(function() {$(this).on('click', 
                function() 
                {
                    event.preventDefault();
                    load_cart($( this ).attr('href'));

                }
            );});
     }
});

