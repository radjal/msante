
function change_datepicker(show_day) {
    //console.log('change_datepicker'+ show_day);
    if(typeof show_day === 'undefined')  var show_day = [];   
    if(typeof show_day[1] =='undefined') show_day[1] = false;
    if(typeof show_day[2] =='undefined') show_day[2] = false;
    if(typeof show_day[3] =='undefined') show_day[3] = false;
    if(typeof show_day[4] =='undefined') show_day[4] = false;
    if(typeof show_day[5] =='undefined') show_day[5] = false;
    if(typeof show_day[6] =='undefined') show_day[6] = false;
    if(typeof show_day[0] =='undefined') show_day[0] = false;

    $( "input[name=appointment_date]" ).datepicker('destroy');
        $( "input[name=appointment_date]" ).datepicker({
            minDate: 0,
            dateFormat: 'yy-mm-dd' ,
            altFormat: "dd/mm/yy",
            onSelect:function(){$(this).addClass('modified')}, 
            /* no week ends setting below 
            beforeShowDay: $.datepicker.noWeekends */
            /* allow mon, thu, fri */	
            beforeShowDay:
                function(dt)
                    {
                            return [
                            dt.getDay() === show_day[1] 
                            || dt.getDay() === show_day[2]  
                            || dt.getDay() === show_day[3]  
                            || dt.getDay() === show_day[4] 
                            || dt.getDay() === show_day[5] 
                            || dt.getDay() === show_day[6] 
                            || dt.getDay() === show_day[0] ? true : false];
                    }
    });
}   

$( document ).ready(function() 
{   
    if(typeof datepicker !== 'undefined') 
    {
            /* dates and stuff  */    

            var show_day = [];  
            show_day[1] = 1;
            show_day[2] = 2;
            show_day[3] = 3;
            show_day[4] = 4;
            show_day[5] = 5;
            show_day[6] = false;
            show_day[0] = false; 


            /* datepicker widget jQuery UI */
            //$( "#contact_date" ).datepicker();
            /* no weekends */
            // $.datepicker.noWeekends;
            /* no weekends and no past date */
            $( "input[name=appointment_date]" ).datepicker({
                    minDate: 0,
                    dateFormat: 'yy-mm-dd' ,
                    altFormat: "dd/mm/yy",
                    onSelect:function(){$(this).addClass('modified')}, 
                    /* no week ends setting below 
                    beforeShowDay: $.datepicker.noWeekends */
                    beforeShowDay:
                        function(dt)
                            {
                                    return [
                                    dt.getDay() == show_day[1] 
                                    || dt.getDay() == show_day[2]  
                                    || dt.getDay() == show_day[3]  
                                    || dt.getDay() == show_day[4] 
                                    || dt.getDay() == show_day[5] 
                                    || dt.getDay() == show_day[6] 
                                    || dt.getDay() == show_day[0] ? true : false];
                            }
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

            //update datepicker
            change_datepicker(show_day);
        }
});
