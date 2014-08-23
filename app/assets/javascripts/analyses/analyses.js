var ready = function(){
	console.log("analyses loaded");
		var currentdate;

		$("#analysis_test").keypress(function(event) {
			if (event.keyCode == 13) {
				currentdate = new Date();
		    	this.value += "\n"+ "time   > " + currentdate.getHours() + ":"  
		    	               + currentdate.getMinutes() + ":" 
		                       + currentdate.getSeconds();
		    	}
		});
		var time = $("#test-duration").val();
		var duration;

		$("#play").click(function(event) {
			console.log("play")
			duration = setInterval(function() {$("#test-duration").val(time++);}, 1000)
		});

		$("#pause").click(function(event) {
			console.log("pause")
			clearInterval(duration);
			$("#test-duration").val(time);
		});

		$("#refresh").click(function(event) {
			clearInterval(duration);
			console.log("refresh")
			time = 0;
			$("#test-duration").val(0);
		});	
};
$(document).ready(ready);
$(document).on('page:load', ready);