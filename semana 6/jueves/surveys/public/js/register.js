$(document).ready(function() {
  console.log('register.js loaded');
  $('input[name="confirm"]').blur(function() {
    var password = $(this).siblings('input[name="password"]').val();
    var confirm = $(this).val();
    if (password != confirm) {
      $('.error').show();
    }
    else {
        $('.error').hide();
    }
  });
  $('form').submit(function(e) {
    var password = $(this).children('input[name="password"]').val();
    var confirm = $(this).children('input[name="confirm"]').val();
    if (password != confirm) {
        e.preventDefault();
        console.log('submit prevented');
    }
  });
});
