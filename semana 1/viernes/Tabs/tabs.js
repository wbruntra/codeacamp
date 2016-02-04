$(document).ready(function () {
  // Put your JavaScript behavior here
  
  $('#tab1').show();
  
  $('a').click(function() {
    $('.tab').hide();
    $('li').removeClass('active');
    tabNo = $(this).attr('href');
    console.log(tabNo);
    $(this).parent().addClass('active');
    $(tabNo).show();
  });
});