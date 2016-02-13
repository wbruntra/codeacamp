$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded)
	// completamente.
	// Esto garantiza que si amarramos(bind) una función a un elemento
	// de HTML este exista ya en la página.
	$('button').on('click', function(e) {
		var q = $(this).parent().attr('id');
		console.log(q);
		$('#'+q).children('.new-answer').show();
        $(this).hide();
	});
});
