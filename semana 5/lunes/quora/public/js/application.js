$.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

function send_answer(question_id,user_id,body) {
	data = {'question_id' : question_id,
					'user_id' : user_id,
					'body' : body
	};
  $.ajax({
     type: "post",
     url: "/answer/"+question_id,
		 data: data,
     dataType: "html",
     success: updatePage
     });
}

function updatePage(data) {
    o = JSON.parse(data);
    question_id = o['question_id'];
    console.log(question_id);
    html = o['html'];
    answer = $.parseHTML(html);
    console.log(typeof(answer));
	question = $('#q-'+question_id);
    console.log(answer);
    question.siblings('.answers').append(html);
}


$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded)
	// completamente.
	// Esto garantiza que si amarramos(bind) una función a un elemento
	// de HTML este exista ya en la página.
	$('button').on('click', function(e) {
		var q = $(this).parent().attr('id');
		console.log(q);
        var form = $('#'+q).children('.new-answer');
        form.show();
        form.find('textarea').focus();
        $(this).hide();
	});
	$('.new-answer form').submit(function(e) {
	   e.preventDefault();
        data = $(this).serializeObject();
        var question_id = $(this).attr('data-question-id');
        console.log(question_id);
        var body = data["body"];
        var user_id = $('p.user-display').attr('data-userid');
        send_answer(question_id,user_id,body);
        $(this).children('textarea').html('');
        $(this).siblings('button').show();
        $(this).hide();
    });
});
