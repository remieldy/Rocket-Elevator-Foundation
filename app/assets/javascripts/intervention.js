

// -------------------  variable --------------------------
// let customerBox = document.getElementById('customer box')
// let buildingBox = document.getElementById('building box')
// let batteryBox = document.getElementById('battery box')
// let elevatorBox = document.getElementById('elevator box')
// let columnbox = document.getElementById('column box')


// -------------------------------------------------------------------------------------
// customerBox.hidden = false
// buildingBox.hidden = true
// batteryBox.hidden = true
// elevatorBox.hidden = true
// columnbox.hidden = true
// ------------------------------------------------------------------------------------------



// https://fool-dev.com/how-to-create-a-dependent-dropdown-in-ruby-on-rails/
    // site ou comment faire le ajax


// ==============================================================================================
// ==============================================================================================
// ==============================================================================================
// ==============================================================================================


$(document).ready(function(){
$("#customer").on('change', function(){
      var customerId = $("#customer option:selected").val();
      
        $.get( "interventions/get_buildings_from_customer", {customer_id: customerId}, function( data ) {
	      	$("#building").empty();
	      	$("#building").append('<option>Select building</option>');
	      	for(var i = 0; i < data.length; i++){
	      		$("#building").append('<option value="' + data[i]["id"] + '">' +data[i]["id"] + '</option>');
	      	}
	    }
      );
})
});

$("#building").on('change', function(){
      var buildingId = $("#building option:selected").val()
      
        $.get( "interventions/get_battery_from_building", {building_id: buildingId}, function( data ) {
	      	$("#battery").empty();
	      	$("#battery").append('<option>Select battery</option>');
	      	for(var i = 0; i < data.length; i++){
	      		$("#battery").append('<option value="' + data[i]["id"] + '">' +data[i]["id"] + '</option>');
	      	}
	    }
      );
});

$("#battery").on('change', function(){
      var batteryId = $("#battery option:selected").val();
      
        $.get( "interventions/get_column_from_battery", {battery_id: batteryId}, function( data ) {
	      	$("#column").empty();
	      	$("#column").append('<option>Select Column</option>');
	      	for(var i = 0; i < data.length; i++){
	      		$("#column").append('<option value="' + data[i]["id"] + '">' +data[i]["id"] + '</option>');
	      	}
	    }
      );
});

$("#column").on('change', function(){
      var columnId = $("#column option:selected").val();
      
        $.get( "interventions/get_elevator_from_column", {column_id: columnId}, function( data ) {
	      	$("#elevator").empty();
	      	$("#elevator").append('<option>Select elevator</option>');
	      	for(var i = 0; i < data.length; i++){
	      		$("#elevator").append('<option value="' + data[i]["id"] + '">' +data[i]["id"] + '</option>');
	      	}
	    }
      );
});

// ==============================================================================================
// ==============================================================================================
// ==============================================================================================

