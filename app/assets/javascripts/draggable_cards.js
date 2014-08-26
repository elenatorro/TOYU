var ready = function(){
	$(function() {
		$('.card').draggable();
		$('#canvas').droppable({ accept: ".card", 
                       activeClass: 'droppable-active', 
                       hoverClass: 'droppable-hover', 
                       drop: function(ev, ui) { 
                           console.log("hello");
                       }
		});
	});


};

$(document).ready(ready);
$(document).on('page:load', ready);