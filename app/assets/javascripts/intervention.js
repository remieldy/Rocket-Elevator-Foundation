

// https://fool-dev.com/how-to-create-a-dependent-dropdown-in-ruby-on-rails/
    // site ou comment faire le ajax

// $.ajax({
//     url: "/tasks",
//     method: "POSt",  
//     dataType: "json",
//     data: {project: project},
//     error: function (xhr, status, error) {
//           console.error('AJAX Error: ' + status + error);
//     },

JavaScript
$("#hour_task_id").prop("disabled", true); // second dropdown is disable while first dropdown is empty
$("#hour_project_id").change(function(){
  	var project = $(this).val();
  	if(project == ''){
  		$("#hour_task_id").prop("disabled", true);
  	}else{
  		$("#hour_task_id").prop("disabled", false);
  	}
  	$.ajax({
	    url: "/tasks",
	    method: "POST",  
	    dataType: "json",
	    data: {project: project},
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var tasks = response["tasks"];
	      	$("#hour_task_id").empty();

	      	$("#hour_task_id").append('<option>Select Task</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#hour_task_id").append('<option value="' + tasks[i]["id"] + '">' +tasks[i]["name"] + '</option>');
	      	}
	    }
  	});
});
$("#hour_task_id").prop("disabled", true); // second dropdown is disable while first dropdown is empty
$("#hour_project_id").change(function(){
  	var project = $(this).val();
  	if(project == ''){
  		$("#hour_task_id").prop("disabled", true);
  	}else{
  		$("#hour_task_id").prop("disabled", false);
  	}
  	$.ajax({
	    url: "/tasks",
	    method: "POST",  
	    dataType: "json",
	    data: {project: project},
	    error: function (xhr, status, error) {
	      	console.error('AJAX Error: ' + status + error);
	    },
	    success: function (response) {
	      	console.log(response);
	      	var tasks = response["tasks"];
	      	$("#hour_task_id").empty();
 
	      	$("#hour_task_id").append('<option>Select Task</option>');
	      	for(var i = 0; i < tasks.length; i++){
	      		$("#hour_task_id").append('<option value="' + tasks[i]["id"] + '">' +tasks[i]["name"] + '</option>');
	      	}
	    }
  	});
});