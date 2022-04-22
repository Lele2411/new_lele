$(document).ready(function(){
    $(".btn-login").click(function(){
        var email = $('#mailInput').val();
        var password = $('#passwordInput').val();
        var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var check_validate = true;
        $('.error-text').remove();
        if (email == "") {
            $('#error-box-login').append("<div class='error-text' id='error-empty-email'>Email is required!</div>");
            check_validate = false;
        } else {
            if (email.length > 256) {
                $('#error-box-login').append("<div class='error-text' id='error-limit'>Length Max is 256!</div>");
                check_validate = false;
            }
            if (!email.match(mailformat)) {
                $('#error-box-login').append("<div class='error-text' id='error-format'>Email is format!</div>");
                check_validate = false;
            }
        }
        if (password == '') {
            $('#error-box-sign-up').append("<div class='error-text' id='error-empty-password'>Password is required!</div>");
            check_validate = false;
        }
        if (check_validate) {
            $('.btn-login').get(0).type = 'submit';
        }
    });

});

