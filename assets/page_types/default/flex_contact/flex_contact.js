function setSoin(ev, name,  ob)
{
        if(typeof(ev)!=='undefined') ev.preventDefault(); 
		$('#contact-reservation table a').removeClass('active'); //remove any previous
        //console.log(name +' '+ ob.duration +'min '+ob.price+'€' );
        $('input[name=reservation_soin]').val(name +' '+ ob.duration +' minutes '+ob.price+'€');
        $('input[name=reservation_prix]').val( ob.price );
        $('input[name=reservation_duree]').val( ob.duration );
}

/**********
 * ready
 ***********/
$( document ).ready(function() 
{         
    //* datepicker widget jQuery UI */  
        if(typeof('datepicker') !== 'undefined') 
        { 

		/* dates and stuff  */ 
			var show_day = [];  
			show_day[1] = 1; //mon
			show_day[2] = 2; 
			show_day[3] = 3; //wed dayNo=dayNo for 'on'
			show_day[4] = 4;
			show_day[5] = 5;
			show_day[6] = 6;
			show_day[0] = false;  // sunday, false=off
		
		/* datepicker localisation */
			 $.datepicker.regional["fr"] = {
					clearText: "Effacer", 
					clearStatus: "",
					closeText: "Fermer", 
					closeStatus: "Fermer sans modifier",
					prevText: "&lt;Préc", 
					prevStatus: "Voir le mois précédent",
					nextText: "Suiv&gt;", 
					nextStatus: "Voir le mois suivant",
					currentText: "Courant", 
					currentStatus: "Voir le mois courant",
					monthNames: ["Janvier","Février","Mars","Avril","Mai","Juin", "Juillet","Août","Septembre","Octobre","Novembre","Décembre"],
					monthNamesShort: ["Jan","Fév","Mar","Avr","Mai","Jun", "Jul","Aoû","Sep","Oct","Nov","Déc"],
					monthStatus: "Voir un autre mois", yearStatus: "Voir un autre année",
					weekHeader: "Sm", weekStatus: "",
					dayNames: ["Dimanche","Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi"],
					dayNamesShort: ["Dim","Lun","Mar","Mer","Jeu","Ven","Sam"],
					dayNamesMin: ["Di","Lu","Ma","Me","Je","Ve","Sa"],
					dayStatus: "Utiliser DD comme premier jour de la semaine", dateStatus: "Choisir le DD, MM d",
					dateFormat: "yy-mm-dd",
					altFormat: "dd/mm/yy",
					//firstDay: 0, 
					firstDay: 1, 
					initStatus: "Choisir la date", 
					isRTL: false
			};

			$.datepicker.setDefaults($.datepicker.regional["fr"]);
       
        /* timepicker extension */  
        //http://trentrichardson.com/examples/timepicker/
			$.timepicker.regional['fr'] = {
					timeText: 'Heure',
					hourText: 'H',
					minuteText: 'M',
					secondText: 'S',
					timezoneText: 'Zone horaire',
					closeText: 'Fermer',
					currentText: "Mtnt",
					isRTL: false
			};

			/*set timepicker*/
			$.timepicker.setDefaults($.timepicker.regional['fr']);
			$( "input[name=reservation_date]" ).datetimepicker({
				dateFormat: 'yy-mm-dd' ,
				altFormat: "dd/mm/yy",
				altField: "#contact_reservation_heure",
				minDate: '+1',
				timeFormat: "HH:mm",
				controlType: "select",
				oneLine: true,
				stepMinute: 30,
				hourMin: 11,
				hourMax: 19,
				/* dates and stuff  */ 
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
				//addSliderAccess: true,
				//sliderAccessArgs: { touchonly: false }
				//showSecond: "false",
				//  onSelect:function(){$(this).val($(this).val()+':00');} 
			});
		}
        /************** end date time picker **************/
		/* change input */
		$('select[name=reservation_soin]').hide();
		$('select[name=reservation_soin]').parent().append('<input type="text" name="reservation_soin" />');
		$('select[name=reservation_soin]').remove();
		//$('.duree-prix').show();
		//$('#contact-reservation').append('<input type="hidden" name="reservation_soin" />');
                
                /*change prices to links*/
                $('#contact-reservation table > tbody > tr > td').each(function (){
                    var price = $(this).attr('data-price');
                    var duration =  $(this).attr('data-duration'); 
                    if(typeof(price) !=='undefined' && price!=''){
                        $(this).html('<a onclick="setSoin(event, $(this).parent().siblings(\'.soin\').text(),  $(this).parent().data());$(this).addClass(\'active\')" class="btn btn-default btn-xs">'+$(this).text()+'</a>');
                        
                    }
                });
                //FX
                $('.contact-button input').addClass('btn btn-primary');
		
		/* radio btns jQUI */
			//$( "input[type=radio]" ).checkboxradio();
		/* input styling */
			$( "input[type=text], textarea, select" ).addClass('form-control');
		
});

