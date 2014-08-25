var ready = function(){

	$('.card').each(function(i, obj) {
    	 $(function() {
    	 	console.log(obj)
    	 	obj.draggable();
    	 });
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);