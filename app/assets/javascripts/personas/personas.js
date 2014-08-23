var ready = function(){
		console.log("personas loaded 2");
		$("#btn-persona").click(function() {
			document.getElementById("new-persona").style.visibility="visible";
			window.location.href='#new-persona';
		});
		$("#btn-persona-close").click(function() {
			document.getElementById("new-persona").style.visibility="hidden";
			window.location.href='#';
	});
};
$(document).ready(ready);
$(document).on('page:load', ready);