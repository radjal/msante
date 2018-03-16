
var doctors = []; 
var mApi = { 
    mapsUrl: "https://maps.googleapis.com/maps/api/js?key=",
    key:"AIzaSyDkUU_ti16t_PBfJ8o2-p_AciVkD8Q_2uo",
    geocodeUrl:"http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=",
    centLat:48.62,
    centLon:2.44, 
    zoom:10
}; 
    
function doctorsMap() 
{
//    console.log('doctorsMap');
//    console.log(doctors);
    if(typeof doctors === 'undefined') return;
    
    if($("#map_canvas").length == 0) $('#doctors-list').prepend('<div id="map_canvas"></div>');
    
    var map;
    var xadr;
    var xname; 
    
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
        console.log('loop:'+x);
        xadr = doctors[x].address;
        xname = doctors[x].name;
        /* geocode */
        $.getJSON(mApi.geocodeUrl+xadr, null, function (data) 
        { 
            /* exit if has no values */
            if(typeof(data) === 'undefined') return;
            var p = data.results[0].geometry.location;
//            console.log('location:'+p);
//            console.log('data:'+data);
            console.log('loop '+x+' xadr:'+xadr);
            console.log('loop '+x+' xname:'+xname);
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

function loadMap() 
{
//    console.log('loadMap: '+mApi.mapsUrl + mApi.key);
    $.getScript(mApi.mapsUrl + mApi.key, doctorsMap);
    $('#doctors-map-btn').hide();
    $('#doctors-map-btn').after('<div id="map_canvas"></div>')
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
    });
} 
function geoError(err) {
    console.log(err);
    alert("positioning error");
} 
/********************************************************************************/  
/** On document ready, go  */      
$( document ).ready(function() 
{    
        //geo btn
        //remove geo btn if no localisation
        if(navigator.geolocation !== true) 
        {
            $('#doctor-search .input-group-addon a').addClass('disabled');
        } else {
            $('#doctor-search .input-group-addon a').on('click', 'geoGetTown');
        } 
        
        var name;    
        var adr;    
        
        if( $('#doctors-list').length ) // only if doctors listing
        {
            $('#doctors-list li.doctor').each(function()
            {
                    name ='';    
                    adr ='';    
                    // adr = $(this).attr('data-rid');
                    name = $(this).attr('data-name');
                    if($(this).attr('data-address').length)   adr += ' '+ $(this).attr('data-address');
                    if($(this).attr('data-area_name').length)   adr += ' '+ $(this).attr('data-area_name');
                    if($(this).attr('data-town').length)        adr += ' '+ $(this).attr('data-town'); 
                    doctors.push({name:name, address:adr});
                    // console.log({name:name, address:adr}); 
            }); 
            // show map
            loadMap();  
        } 
});

