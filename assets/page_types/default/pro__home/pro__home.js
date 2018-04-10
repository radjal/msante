function pad(pad, str, padLeft) {
  if (typeof str === 'undefined') 
    return pad;
  if (padLeft) {
    return (pad + str).slice(-pad.length);
  } else {
    return (str + pad).substring(0, pad.length);
  }
}

function showDayAppointments(dateText)
{
    var url = 'calendar/fordate'
    ajaxDiv()
    
}

/* uses date from datpicker for interface 
 * dateText = SQL format YYYY-MM-DD
 */
function setDate(dateText, dpInstance)
{ 
    /* in case of empty date create current day date string */
    if(typeof(dateText)==='undefined') 
    {
        var x = new Date();
        dateText = x.getFullYear()+'-'+pad('00', x.getMonth()+1, 'pad_left')+'-'+pad('00', x.getDate(), 'pad_left') ;  /* SQL format YYYY-MM-DD */
    }
    var d = new Date(dateText);
    var year_no = d.getFullYear(); 
    var month_no = pad('00', d.getMonth()+1, 'pad_left');
    var week_day_no= d.getDay(); /*  Get the weekday as a number (0-6) */
    var day_no  = pad('00', d.getDate(), 'pad_left');   /*  Get the day as a number (1-31) */
    var days_names = $.datepicker.regional['fr']['dayNames']; /* get localized day names from datpicker settings */
    var day_name = days_names[week_day_no];
    week_day_no = week_day_no === 0 ? 7 : week_day_no ; /* correction for sunday=0, change to 7,  do after getting day name  */
    /* string for UI */
    var dateStrUi = day_name+' '+day_no+'/'+month_no+'/'+year_no; 
    dateText = year_no+month_no+day_no; /* reconstruct date string with padded values */
    /* UI */ 
    $('#date-btn a').attr('href', '/calendar/fordate/'+dateText).show();
    $('#date-text').html(dateStrUi);
    $('#date-digest').html('...');
    
    ajaxDiv('#date-digest', url_site+'calendar/fordate_digest/'+dateText);
    
    return dateStrUi ;
}
        
/** On document ready, go  */      
$( document ).ready(function() 
{       /* datepicker localisation */
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
       /* datepicker */
        $( "#datepicker" ).datepicker({  
                    showWeek: true
                    , weekHeader: "S"
                    , dateFormat: 'yy-mm-dd' /* iso format for JS  */
                    , onSelect: function(dateText, inst){ setDate(dateText, inst); } 
        }); 
        /* UI show current day for start */
        setDate();
        $('#date-text').prepend('Ajourd\'hui : '); 
});

 