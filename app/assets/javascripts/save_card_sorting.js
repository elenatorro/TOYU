var ready = function(){
	$("#save-button").click(function(event) {
		console.log("clicked")
		html2canvas(document.getElementById('test-result'), {
		  onrendered: function(canvas) {
		  	var image = document.body.appendChild(canvas)
		  	image.id = "download-image";
		  	image.style.visibility = "hidden";
		  }
		});
	});

	function downloadCanvas(link, canvasId, filename) {
	    link.href = document.getElementById(canvasId).toDataURL();
	    link.download = filename;
	}

	$("#download-button").click(function(event) {
		downloadCanvas(this, 'download-image', 'test.png');
	});

};

$(document).ready(ready);
$(document).on('page:load', ready);