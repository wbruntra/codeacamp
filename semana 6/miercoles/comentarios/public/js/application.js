// $(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página. 

// });

function resetForm($form) {
    $form.find('input:text, input:password, input:file, select, textarea').val('');
    $form.find('input:radio, input:checkbox')
         .removeAttr('checked').removeAttr('selected');
}

function sendComment(author,body) {
	data = {'author' : author,
		   'body' : body
	 };
  $.ajax({
     type: "post",
     url: "/comment",
		 data: data,
     dataType: "html",
     success: updatePage
      });
}

function updatePage(data) {
  newElement = $(data);
  newElement.css('display','none');
  $('ul').append(newElement);
  newElement.slideDown(400);
}

// Una manera corta de escribir document.ready
$(function(){
  $('#new_comment_button').click(function(e) {
    $('#new_comment').slideDown(400);
  });
  
  $('#new_comment').submit(function(e) {
    e.preventDefault();
    body = $(this).children('textarea').val();
    author = $('#authorName').val();
    if (!body || !author) {
      $('.error').show();
    }
    else {
      $('.error').hide();
      sendComment(author,body);
      resetForm($(this));
      $(this).slideUp(50);
    }
  });
});
