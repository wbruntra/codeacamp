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
     dataType: "json",
     success: updatePage
     });
}

function send_vote(votetype,value,candidate_id,user_id) {
  candidate = votetype +'_id'
	data = { candidate : candidate_id,
            'user_id' : user_id,
            'value' : value
	};
  console.log(data)
   $.ajax({
      type: "post",
      url: "/vote/"+votetype,
	 	 data: data,
      dataType: "html",
      success: function(data) {
        console.log(data);
        },
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
    $('.vote').on('click',function(e) {
        e.preventDefault();
        if ($(this).hasClass('yes')) {
            var value = 1;
        } else {
            var value = -1;
        }
        if ($(this).parent().parent().hasClass('question')) {
            var votetype = 'question';
        } else {
            var votetype = 'answer';
        }
        var user_id = $('p.user-display').attr('data-userid');
        var candidate_id = $(this).parent().parent().attr('data-own-id');
        send_vote(votetype,value,candidate_id,user_id);
    });
});
