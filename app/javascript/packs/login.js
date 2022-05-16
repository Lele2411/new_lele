$(function() {
    var emailInput = document.getElementById("session_mailInput");
    emailInput.addEventListener('input', function() {
        if (emailInput.value.length > 256) {
            var error_limit_email = document.getElementById("error-limit");
            if (!error_limit_email) {
                appendElement($('#error-box-email'), "<div class='error-text' id='error-limit'>Email max length is 256!</div>")
            }
        } else {
            $('.error-text').remove();
        }
    })

    emailInput.addEventListener('keypress', function(event) {
        if (emailInput.value.length > 256) {
            event.preventDefault();
        }
    });

    $(".btn-login").click(function(){
        console.log(emailInput.value);
        var password = $('#session_passwordInput').val();
        var mailformat = /^[\w+\-.]{2,}@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+$/i;
        var check_validate = true;
        $('.error-text').remove();
        $('.failed-login').remove();
        if (emailInput.value == "") {
            appendElement($('#error-box-email'), "<div class='error-text' id='error-empty-email'>Email is required!</div>")
            check_validate = false;
        } else {
            if (emailInput.value.length > 256) {
                appendElement($('#error-box-email'), "<div class='error-text' id='error-limit'>Email max length is 256!</div>")
                check_validate = false;
            }
            if (!emailInput.value.match(mailformat)) {
                appendElement($('#error-box-email'), "<div class='error-text' id='error-format'>Email must be correct format!</div>")
                check_validate = false;
            }
        }
        if (password == '') {
            appendElement($('#error-box-password'), "<div class='error-text' id='error-empty-password'>Password is required!</div>")
            check_validate = false;
        } else if (password.length > 256) {
            appendElement($('#error-box-password'), "<div class='error-text' id='error-limit-password'>Password max length is 256!</div>")
            check_validate = false;
        }
        if (check_validate) {
            $('.btn-login').get(0).type = 'submit';
        }
    });
    function appendElement(selectedElement, appendedElelement) {
        selectedElement.append(appendedElelement);
    }
});

import 'packs/application'
