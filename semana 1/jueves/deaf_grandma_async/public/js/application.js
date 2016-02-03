$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded)
	// completamente.
	// Esto garantiza que si amarramos(bind) una función a un elemento
	// de HTML este exista ya en la página.
	function send_message(data) {
		$.ajax({
		  type: "POST",
		  url: '/abuelita',
		  data: data,
		  success: granny_speak,
			dataType: 'html'
		});
	}

	function granny_speak(d) {
		$('#response').html(d);
	}

	$('form').submit(function(e){
		e.preventDefault();
		$inputs = $(this).serializeArray();
		send_message($inputs);
	});
});
