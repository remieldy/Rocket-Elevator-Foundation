
// ==============================================================================================
// ==============================================================================================
// ==============================================================================================
// ==============================================================================================
    // take the customer class and do on change function 
    // the variable customerId = a tout les customer avec loption selected
    // the roots between intervation page and buildings from customer 
    // the function data after ca vide le building avec le .empty
    // after it fill with .append avec loption select Building inside input
    // do a  for loop for fill all building class
    
    
$(document).ready(function(){
  $("#building_id").hide();
  $("#battery_id").hide();
  $("#column_id").hide();
  $("#elevator_id").hide();

  $("#customer_id").on('change', function(){
      var customerId = $("#customer_id option:selected").val();
      
$.get( "interventions/get_buildings_from_customer", {customer_id: customerId}, function( data ) {
  $("#building_id").show();  
  $("#building_id").empty();
  	$("#building_id").append('<option>Select Building</option>');
  	for(var i = 0; i < data.length; i++){
  		$("#building_id").append('<option value="' + data[i]["id"] + '">' +data[i]["id"] + '</option>');
	      	}
	    }
      );
})


$("#building_id").on('change', function(){
  var buildingId = $("#building_id option:selected").val()
  
  $.get( "interventions/get_battery_from_building", {building_id: buildingId}, function( data ) {
    $("#battery_id").show();
    $("#battery_id").empty();
    $("#battery_id").append('<option>Select battery</option>');
    for(var i = 0; i < data.length; i++){
      $("#battery_id").append('<option value="' + data[i]["id"] + '">' +data[i]["id"] + '</option>');
    }
  }
  );
});


$("#battery_id").on('change', function(){
  var batteryId = $("#battery_id option:selected").val();
  
  $.get( "interventions/get_column_from_battery", {battery_id: batteryId}, function( data ) {
    $("#column_id").show();
    $("#column_id").empty();
    $("#column_id").append('<option>Select Column</option>');
    for(var i = 0; i < data.length; i++){
      $("#column_id").append('<option value="' + data[i]["id"] + '">' +data[i]["id"] + '</option>');
    }
  }
  );
});


$("#column_id").on('change', function(){
  var columnId = $("#column_id option:selected").val();
  
  $.get( "interventions/get_elevator_from_column", {column_id: columnId}, function( data ) {
    $("#elevator_id").show();
    $("#elevator_id").empty();
    $("#elevator_id").append('<option>Select elevator</option>');
    for(var i = 0; i < data.length; i++){
      $("#elevator_id").append('<option value="' + data[i]["id"] + '">' +data[i]["id"] + '</option>');
    }
  }
  );
});
});


   
// ==============================================================================================
// ==============================================================================================
// ==============================================================================================

