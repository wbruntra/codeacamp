function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function validatePassword(password) {
    var num = /^.*[1-9]+/;
    errors = [];
    if (!num.test(password)) {
        errors.push("Password must contain at least one digit (0-9)");
    }
    if (password.length < 8) {
        errors.push("Password must be at least 8 characters");
    }
    var caps = /^.*[A-Z]+/;
    if (!caps.test(password)) {
        errors.push("Password must contain at least one capital letter");
    }
    return errors;
}

$(document).on("ready",function(){
    console.log('ready to go');
    $('input[name="email"]').blur(function() {
        var email = $(this).val();
        console.log(email);
        $('.email-errors').html('');
        if (!validateEmail(email)) {
            li = $('<li>Email address invalid</li>');
            $('.email-errors').append(li);
        }
    }); 
    $('input[name="password"]').blur(function() {
        pw = $(this).val();
        console.log(pw);
        $('.password-errors').html('');
        var errors = validatePassword(pw);
        if (errors.length != 0) {
            for (var i=0;i<errors.length;i++) {
                var li = $('<li>');
                li.html(errors[i]);
                $('.password-errors').append(li);
            }
        }
    });  
});