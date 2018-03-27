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
/* doctor module functions */
/** builds locations map of doctors
 *  gets data from HTML5 data attributes in doctor's list
 * @returns {undefined}
 */
function doctorsMap() 
{
//    console.log('doctorsMap');
//    console.log(doctors);
    if(typeof doctors === 'undefined') return;
    
    
    var map;
    
    //var elevator;
    var myOptions = {
        zoom: mApi.zoom,
        center: new google.maps.LatLng(mApi.centLat ,mApi.centLon )
        /*,
        mapTypeId: 'terrain'*/
    };
    
    map = new google.maps.Map($("#map_canvas")[0], myOptions); 
 
    for (var x = 0; x < doctors.length; x++) 
    {  
//        var xadr;
//        var xname; 
        console.log('loop:'+x);
        xadr = doctors[x].address;
        xname = doctors[x].name;
        /* geocode */
        $.getJSON(mApi.geocodeUrl+xadr, null, function (data) 
        { 
            /* exit if has no values */
            if(typeof(data) === 'undefined') return;
//            console.log('data:'+data);
            console.log('name:'+data.results[0].formatted_address);
            var p = data.results[0].geometry.location;
//            console.log('location:'+p);
            var latlng = new google.maps.LatLng(p.lat, p.lng);
            console.log('loop '+x+' lat long:'+latlng);
            new google.maps.Marker({
                position: latlng,
                map: map,
                title: xname
            }); 
        });
    }
    /* center and zoom */
    // map - instance of google Map v3
    // markers - array of Markers
    /*
    var bounds = google.maps.reduce(function(bounds, marker) {
        return bounds.extend(marker.getPosition());
    }, new google.maps.LatLngBounds());

    map.setCenter(bounds.getCenter());
    map.fitBounds(bounds);
*/
}
/**
 *  gets Google API JS and runs doctorMap on complete
 * @returns {undefined}
 */
function loadMap() 
{
    if($("#map_canvas").length == 0) $('#doctors-list').prepend('<div id="map_canvas"></div>');
    /* correct height for small screens */
//    if($( window ).height() < 400)
//    {
//        $('#map_canvas').css('heigth', 240);
//    } 
//    console.log('loadMap: '+mApi.mapsUrl + mApi.key);
    //geocode first address for map center
            /* geocode */
            xadr = $('.doctor').attr('data-id');
        $.getJSON(mApi.geocodeUrl+xadr, null, function (data) 
        { 
            /* exit if has no values */
            if(typeof(data) === 'undefined') return;
            console.log('data:'+data);
            console.log('name:'+data.results[0].formatted_address);
            var p = data.results[0].geometry.location;
            console.log('location:'+p);
            var latlng = new google.maps.LatLng(p.lat, p.lng);
            console.log('loop '+x+' lat long:'+latlng); 
        });
    
    //
    $.getScript(mApi.mapsUrl + mApi.key, doctorsMap);
    $('#doctors-map-btn').hide();
    $('#doctors-map-btn').after('<div id="map_canvas"></div>');
    $('#map_canvas').html(pg_load);
}
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
 {{if false }}
function myPosition(position) {
    var infopos = "Position déterminée :\n";
    infopos += "Latitude : "+position.coords.latitude +"\n";
    infopos += "Longitude: "+position.coords.longitude+"\n";
    infopos += "Altitude : "+position.coords.altitude +"\n";
    return infopos;
}
{{endif}}
{{# load doctor module JS #}}
{{# doctor:js #}}

/** empties search box
 * 
 * @returns {undefined}
 */
 function cleanDocSearch()
 {
     console.log('clean');
     $('.searchbox-query').removeClass('has-success'); 
     $('#doctor-search input[name=c]').val('').removeClass('set');
    /*UX*/
    
    $('#categories').show();
 }
 function cleanAreaSearch()
 {
     console.log('clean');
     $('.searchbox-area').removeClass('has-success'); 
     $('#doctor-search input[name=s]').val('').removeClass('set');
    /*UX*/ 
//    $('.titre-auto').hide() ;
 }
 
 
$( document ).ready(function() 
{    
        /*geo btn */
        /* remove geo btn if no localisation */
//        if(navigator.geolocation !== true) 
//        {
//            $('.searchbox-locate .input-group-addon a').addClass('disabled');
//        } else {
            $('.searchbox-locate a').removeClass('disabled'); 
//        }  
        /* UIX select all */
        $('.searchbox-query input, .searchbox-area input').on('focus', function(){ this.select(); });
        /* jquery autocomplete */
        $( function() {
          var medicSpecialities = [
                  "Dentiste",
                  "Généraliste",
                  "Chirurgien dentiste",
                  "Médecin généraliste",
                  "Pédiatre",
                  "Gynécologue obstétrique ou médical",
                  "Ophtalmologue",
                  "Dermatologue",
                  "Ostéopathe",
                  "Kinésithérapeute",
                  "Pédicure – Podologue",
                  "Sage – femme",
                  "ORL",
                  "Allergologue",
                  "Urologue",
                  "Rhumatologue",
                  "Endocrinologue",
                  "Stomatologue",
                  "Orthopédiste",
                  "Diététicien",
                  "Psychologue",
                  "Neurologue",
                  "Psychiatre",
                  "Radiologue",
                  "Cardiologue",
                  "Gastro-entérologue et hépatologue"
          ];
          $( ".searchbox-query input" ).autocomplete({
            source: medicSpecialities
          });
        } ); 
    //add functionality to specialities
    $('.ico-grp .specialite').each(function() {
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
            
//            $('.titre-'+type).slideDown();
            console.log(type);
            
            
//            /* https://www.taniarascia.com/smooth-scroll-to-id-with-jquery/ */
//            $('html, body').animate({
//                    scrollTop: $('div.searchbox-query').offset().top
//            }, 500, 'linear');
        });
    });

});
