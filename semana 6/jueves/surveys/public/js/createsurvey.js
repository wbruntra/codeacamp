function send_data(data) {
  $.ajax({
     type: "post",
     url: "/create",
     data: data,
     contentType: "application/json",          
     dataType: "json",
     success: updatePage
     });
}

function updatePage(data) {
  json = data;
}

$(document).on('ready',function() {
  $('#add-title').click(function(e) {
    var command = $("#command").val();
    $h2 = $('<h2>');
    $h2.html(command);
    $('#result').append($h2);
    $("#command").val('');
  });
  $('#add-question').click(function(e) {
    var command = $("#command").val();
    $div = $('<div>')
    $div.addClass('question');
    var $h3 = $('<h3>');
    $h3.html(command);
    var $ol = $('<ol>');
    $ol.addClass('active');
    $div.append($h3).append($ol);
    $('#result').append($div);
    $("#command").val('');
  });
  
  $('#add-choice').click(function(e) {
    var command = $("#command").val();
    var $li = $('<li>');
    $li.html(command);
    $('ol.active').append($li);
    $("#command").val('');
  });
  
  $('#save-question').click(function(e) {
    var command = $("#command").val();
    $('ol.active').removeClass('active');
  });
  
  $('#save-survey').click(function(e) {
    var title = $('h2').html();
    var questions = [];
    $('.question').each(function() {
      var qbody = $(this).children('h3').html();
      var choices = [];
      $(this).children('ol').children().each( function() {
        choices.push($(this).html());
      });
      questions.push({'question': qbody,
                     'choices': choices }
                    );
    });
    msg = {'title' : title,
          'questions' : questions}
    console.log(JSON.stringify(msg));
    data = JSON.stringify(msg);
    send_data(data);
  });
});
