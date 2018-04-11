function cas1_check()
{
     $.ajax({
     type: "GET",
     url: "https://rngps.net/verification/cas1/cas1_1",
//     url: "http://rngps.localhost/verification/cas1/cas1_1",
     cache: false,
     data: {  },
     dataType: "json", 
     error: function (xhr, status, error) { 
         console.log(xhr);
         alert('success');
     
     },
     success: function (json) { 
         console.log(xhr);
     }
 }); 
}

$( document ).ready(function() 
{      
    
});