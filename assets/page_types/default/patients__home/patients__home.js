
/* params for search field input list */
 var towns = [
            "Boffa",
            "Gaoual",
            "Boffa-Centre",
            "Colia",
            "Douprou",
            "Koba-Tatema",
            "Lisso",
            "Mankountan",
            "Tamita",
            "Tougnifili",
            "Boké-Centre",
            "Bintimodiya",
            "Dabiss",
            "Port Kamsar",
            "Kanfarandé",
            "Kolaboui",
            "Malapouyah",
            "Sangarédi",
            "Sansalé",
            "Tanéné",
            "Fria",
            "Gaoual centre",
            "Koumbia",
            "Kakoni",
            "Touba",
            "Foulamory",
            "Wendou M'Bour",
            "Kounsitel",
            "Malanta",
            "Koundara",
            "Conakry-centre",
            "Dixinn",
            "Kaloum",
            "Matam",
            "Ratoma",
            "Dabola-centre",
            "Dogomet",
            "Bissikrima",
            "Banko",
            "Konindou",
            "Kankama",
            "Arfamoussaya",
            "Ndéma",
            "Dinguiraye-Centre",
            "Banora",
            "Diatiféré",
            "Gagnakali",
            "Kalinko",
            "Lansanya",
            "Sélouma",
            "Dialakoro",
            "Faranah-centre",
            "Kissidougou-Centre",
            "Albadaria, Banama",
            "Bardou, Beindou",
            "Fermessadou-Pombo",
            "Firawa",
            "Gbangbadou",
            "Kondiadou",
            "Manfran",
            "Sangardo",
            "Yendé-Millimou",
            "Yombiro",
            "Kankan-centre",
            "Kérouané",
            "Kouroussa",
            "Mandiana-Centre",
            "Balandougouba",
            "Dialakoro",
            "Faralako",
            "Kantoumania",
            "Kiniéran",
            "Koundian",
            "Koundianakoro",
            "Morodou",
            "Niantania",
            "Saladou",
            "Sansando",
            "Siguiri-Centre",
            "Bankon",
            "Doko",
            "Franwalia",
            "Kiniébakoura",
            "Kintinian",
            "Maléa",
            "Naboun",
            "Niagassola",
            "Niandankoro",
            "Norassoba",
            "Siguirini",
            "Coyah",
            "Dubréka",
            "Forécariah",
            "Kindia",
            "Télimélé",
            "Koubia",
            "Labé",
            "Lélouma",
            "Mali",
            "Tougué",
            "Dalaba",
            "Mamou",
            "Pita",
            "Beyla",
            "Gueckedou",
            "Lola",
            "Macenta",
            "Nzérékoré",
            "Yomou", 
]; 
var medicSpecialities = [  
            "Acupuncteur",
            "Addictologue",
            "Algologue",
            "Allergologue",
            "Anesthésiste-réanimateur",
            "Cancérologue",
            "Cardiologue",
            "Dentiste",
            "Dermatologue",
            "Diabétologue",
            "Echographiste",
            "Endocrinologue",
            "Gastro-entérologue",
            "Gériatre",
            "Gynécologue ",
            "Hématologue",
            "Médecin",
            "Médecin diététicien",
            "Médecin nutritionniste",
            "Médecin ostéopathe",
            "Médecin homéopathe",
            "Médecin naturopathe",
            "Médecin du sport",
            "Médecin du travail",
            "Médecin en santé publique et médecine préventive",
            "Médecin généraliste",
            "Médecin hygièniste",
            "Médecin légiste",
            "Médecin spécialiste des maladies infectieuses et tropicales",
            "Médecin spécialiste en néonatologie",
            "Médecin spécialiste en soins palliatifs",
            "Néphrologue",
            "Neurologue",
            "Neuropédiatre",
            "Neuropsychiatre",
            "Odontologue",
            "Ophtalmologiste",
            "ORL",
            "Orthopédiste",
            "Pédiatre",
            "Phlébologue",
            "Pneumologue",
            "Proctologue",
            "Psychiatre",
            "Radiologue",
            "Radiothérapeute",
            "Réanimateur médical",
            "Rhumatologue",
            "Stomatologue",
            "Tabacologue",
            "Urgentiste",
            "Urologue",
            "Chirurgien",
            "Chirurgien dentiste",
            "Chirurgien gynécologue obstétricien",
            "Chirurgien maxillo-faciale",
            "Chirurgien ophtalmologiste",
            "Chirurgien ORL",
            "Chirurgien ORL et cervico-faciale",
            "Chirurgien orthopédique et traumatologique",
            "Chirurgien pédiatrique",
            "Chirurgien plastique, reconstructrice et esthétique",
            "Chirurgien thoracique et cardio-vasculaire",
            "Chirurgien urologique",
            "Chirurgien vasculaire",
            "Chirurgien viscéral et digestif",
            "Neurochirurgien",
            "Pharmacien",
            "Sage-Femme"
];
          
/* public vars */
var doctors = []; 
var mApi = { 
    mapsUrl: "https://maps.googleapis.com/maps/api/js?key=",
    key:"AIzaSyDkUU_ti16t_PBfJ8o2-p_AciVkD8Q_2uo",
    geocodeUrl:"https://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=",
//    centLat:48.62,
//    centLon:2.44, 
    zoom:10
};  
/** based on function from
 * https://stackoverflow.com/questions/6797569/get-city-name-using-geolocation
 * answered Apr 29 '16 at 4:12 Mikhail
 * ********************************************************************************/ 
var returned_address =''; 
function geoGetTown() {
    navigator.geolocation.getCurrentPosition(geoSuccess, geoError);
} 
function geoSuccess(position) {
    //console.log(position.coords.latitude)
    //console.log(position.coords.longitude)

    var geocoder = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + position.coords.latitude + '%2C' + position.coords.longitude + '&language=en&key=' + mApi.key;

    $.getJSON(geocoder).done(function(location) 
    {
//        console.log(location); 
        returned_address=location.results[0].address_components[2].long_name;
        $('#doctor-search input[name=s]').val(returned_address); 
        $('.searchbox-area').addClass('has-success'); 
        $('.searchbox-area input').addClass('set'); 
    });
} 
function geoError(err) {
    console.log(err);
    alert("positioning error");
} 
/********************************************************************************/    
/** empties search box
 * 
 * @returns {undefined}
 */
 function cleanDocSearch()
 {
     console.log('clean');
     $('.searchbox-query').removeClass('has-success'); 
     $('#doctor-search input[name=c]').val('').removeClass('set');
     $('.titre-auto').hide();
    /*UX*/ 
    $('.titre-auto').hide() ;
    $('#categories').show();
 }
 function cleanAreaSearch()
 {
     console.log('clean');
     $('.searchbox-area').removeClass('has-success'); 
     $('#doctor-search input[name=s]').val('').removeClass('set'); 
 } 
/* end params */
$( document ).ready(function() 
{    
        /*geo btn */ 
            $('.searchbox-locate a').removeClass('disabled');  
        /* UIX select all */
        $('.searchbox-query input, .searchbox-area input').on('focus', function(){ this.select(); });
        /* jquery autocomplete */
        $( function() { 
          $( ".searchbox-query input" ).autocomplete({
            source: medicSpecialities 
          });
          $( ".searchbox-area input" ).autocomplete({
            source: towns 
          });
         
        } ); 
    //add functionality to specialities
    $('.specialite').each(function() {
        $( this ).on('click', function _selectType(event) 
        {
                    if(typeof(event)!=='undefined') event.preventDefault();
                    var cat = $(this).attr("data-cat"); 
                    var type = $(this).attr("data-type"); 
                    $('.searchbox-query').addClass('has-success');
                    $('#doctor-search input[name=c]').val(cat).addClass('set');
                    /*UX*/
                    $('#categories').hide();
                    $('.titre-auto').show().text('Choisir votre '+cat.toLowerCase()); 
                    console.log(type); 
        });
    });

});
