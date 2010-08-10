// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
    $('tr').click(function() {
    var name = $(this).attr("title");
    $.fancybox.showActivity(); //show loading/spinner image
    $.getJSON("/get_rating", {name: name}, 
         // alert("JSON Data: " + json.rating + "URL: " + json.url);
       function(data) {
          $.fancybox(
          '<div id="rating"><p><strong>'+name+'</strong></p><p><strong>Eatability Rating: </strong>'+data.rating+'</p><a href="'+data.url+'" target="_blank">Read eatability reviews</a></div>',
	  {

	     'autoDimensions'   : false,
	     'width'     	: 350,
	     'height'        	: 350,
	  })
       });

//      $.get('/get_rating', {name: $(this).attr("title")},//pass in the name of restaurant
//          function(data) {
//              $.fancybox(
//              '<div id="rating"><p><strong>'+name+'</strong></p><p><strong>Rating: </strong>'+data+'</p></div>');
////              alert(data);
////            $("#rating").html('<p>'+data+'</p>');
//          });

//        $.fancybox(
//		    '<div id="rating"><p><strong>'+$(this).attr("title")+'</strong></p><h2>Loading Results ...</h2></div>',
//		    {
//            	'autoDimensions'	: false,
//			    'width'         		: 350,
//			    'height'        		: 350,
//			    'transitionIn'      :'fade'
//		    });
//		    
//		$("#rating").html("<p><strong>"+$(this).attr("title")+"</strong></p>")
		
      //alert($(this).attr("title"));
    })
});

