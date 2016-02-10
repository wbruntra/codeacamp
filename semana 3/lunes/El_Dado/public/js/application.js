$(document).ready(function() {
	// Este código corre despues de que `document` fue cargado(loaded)
	// completamente.
	// Esto garantiza que si amarramos(bind) una función a un elemento
	// de HTML este exista ya en la página.
  $('form').submit(function(e) {
    e.preventDefault();
    get_roll();
  });
});

function get_roll() {
  $.ajax({
     type: "post",
     url: "/rolls",
     dataType: "html",
     success: loadRoll
     });
}

function loadRoll(response) {
  $('#die').html(response);
}
