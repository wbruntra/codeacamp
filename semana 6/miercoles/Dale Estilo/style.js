// Una manera corta de escribir 'document.ready'
$(function(){
  // Aqui va tu código.
  console.log("sirve ya");
  $('form').submit(function(e){
    e.preventDefault();
    var selector = $('#style_editor input[name="selector"]').val();
    var property = $('#style_editor input[name="property"]').val();
    var value = $('#style_editor input[name="value"]').val();
    console.log(selector, property, value);
    $(selector).css(property,value);
  });
});