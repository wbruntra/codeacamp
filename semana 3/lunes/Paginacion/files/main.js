function attachanchors() {
  $('a').click(function(e) {
    e.preventDefault();
    var filename = $(this).attr('href');
    console.log(filename);
    getpage(filename);
  });
}

function highlight() {
  $('a.active').parent().css('background-color','#acacac');
}

function getpage(filename) {
  $.ajax({
     url: filename,
     dataType: "html",
     success: loadpage
     });
}

function loadpage(content) {
  var elements = $.parseHTML(content);
  var found = $('div.content',elements);
  var pagination = $('div.pagination',elements);
  $('div.content').html(found);
  $('div.pagination').html(pagination);
  attachanchors();
  highlight();
}


attachanchors();
highlight();
