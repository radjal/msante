
    var doctors = [];
   //  #doctors-list li.doctor
    var mApi = { 
        mapsUrl: "https://maps.googleapis.com/maps/api/js?key=",
        key:"AIzaSyCVufQ9Hza7YItBIUI2mJ0ycoM5Spk4W5k",
        geocodeUrl:"http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=",
        centLat:48.62,
        centLon:2.44,
        zoom:10
    }; 
    
function loadMaps() 
{
    console.log('loadMaps: '+mApi.mapsUrl + mApi.key);
    $.getScript(mApi.mapsUrl + mApi.key, doctorsMap);
    $('#doctors-map-btn').hide();
    $('#doctors-map-btn').after('<div id="map_canvas"></div>')
    $('#map_canvas').html(pg_load);

}
    
function doctorsMap() 
{
    console.log('doctorsMap '+doctors);
    if(typeof doctors === 'undefined') return;
    
    if($("#map_canvas").length == 0) $('#doctors-list').prepend('<div id="map_canvas"></div>');
    
    var map;
    //var elevator;
    var myOptions = {
        zoom: mApi.zoom,
        center: new google.maps.LatLng(mApi.centLat ,mApi.centLon )/*,
        mapTypeId: 'terrain'*/
    };
    map = new google.maps.Map($("#map_canvas")[0], myOptions);

    var addresses = doctors ;

//    var addresses = [
//	'4 allée Jacques ibert, saint michel sur orge', 'rue d\'aquitaine, ris orangis', 'evry','rue salvador allendé, bretigny'
//	];

    var xadr ='';
    var xname ='';
    for (var x = 0; x < addresses.length; x++) {
        xadr = addresses[x].address;
        xname = addresses[x].name;
        /* exit if has no values */
        if(typeof(data) === 'undefined') return;
        /*geocode*/
        $.getJSON(mApi.geocodeUrl+xadr, null, function (data) {
            var p = data.results[0].geometry.location
            var latlng = new google.maps.LatLng(p.lat, p.lng);
            new google.maps.Marker({
                position: latlng,
                map: map,
                title:xname
            });

        });
    }
    
    /*center and zoom*/
    // map - instance of google Map v3
    // markers - array of Markers
//    var bounds = google.maps.reduce(function(bounds, marker) {
//        return bounds.extend(marker.getPosition());
//    }, new google.maps.LatLngBounds());
//
//    map.setCenter(bounds.getCenter());
//    map.fitBounds(bounds);

}

//load icon @todo move to templates
var pg_load = '<img src="assets/img/loading.gif" />';

/**
 * https://stackoverflow.com/questions/6797569/get-city-name-using-geolocation
 * answered Apr 29 '16 at 4:12 Mikhail
 * ********************************************************************************/
//navigator.geolocation.getCurrentPosition(geoSuccess, geoError);

var returned_address ='';

function geoGetTown() {
    navigator.geolocation.getCurrentPosition(geoSuccess, geoError);
}

function geoSuccess(position) {
    //console.log(position.coords.latitude)
    //console.log(position.coords.longitude)

    var GEOCODING = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + position.coords.latitude + '%2C' + position.coords.longitude + '&language=en&key=AIzaSyCVufQ9Hza7YItBIUI2mJ0ycoM5Spk4W5k';

    $.getJSON(GEOCODING).done(function(location) {
        console.log(location);
        returned_address=location.results[2].postcode_localities[0];
        $('#doctor-search input[name=s]').val(returned_address);
    });
}

function geoError(err) {
    console.log(err);
}

/********************************************************************************/
      
/** On document ready, go  */      
$( document ).ready(function() 
{   
    //$('#doctor-search').after('<a class="btn" id="doctors-map-btn" onclick="loadMaps()">Afficher la carte</a>')
    
    var name ='';    
    var adr ='';    
        $('#doctors-list li.doctor').each(function(){
           // adr = $(this).attr('data-rid');
            name = $(this).attr('data-name');
            adr = ' '+ $(this).attr('data-address');
            adr += ' '+ $(this).attr('data-postcode');
            adr += ' '+ $(this).attr('data-town');
            //$(this).append(name);
            //$(this).append(adr);
            
            doctors.push({name:name, address:adr});
        });
        // show map
        loadMaps();
        //geo btn
        $('#doctor-search button').on('click', geoGetTown);
});

