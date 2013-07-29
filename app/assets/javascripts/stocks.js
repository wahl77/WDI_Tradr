// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  
   var graph_data = [];
   var keys = [];
   all = $('input[type=checkbox]');
   for(var i = 0; i < all.length; ++i){
     keys.push($(all[i]).val());
     console.log(keys);
   } 
   var get_data = function(){
      var data = "";
      checkd = $('input[type=checkbox]:checked');
      for(var i = 0; i < checkd.length; ++i){
        data += ($(checkd[i]).val())+ ",";
      }  

      var options = {
        url: "/get_data",
        data: {
          ticker: data
        },
        dataType: "json",
        complete: parse_data 
      }
      $.ajax(options);
  };


  var parse_data = function(response){
    var data = $.parseJSON(response.responseText);
    //console.log(data);
    
    some_data = {};
    some_data.time = Date();
    $.each(data, function(key, value){
      some_data[key] = value.price;
    });
    //console.log(some_data);
    
    graph_data.push(some_data);
  }



  var graph = Morris.Line({
    parseTime: false,
    element: 'charts',
    data: graph_data,
    xkey: 'time',
    ymin: 'auto[31]',
    ymax: 'auto',
    ykeys: keys,
    labels: keys
  });
  

  
  var update_data = function(){
    
    get_data();
    if (graph_data.length > 0){
      graph.setData(graph_data);
    }
    
  };



  setInterval(update_data, 1000);
});

