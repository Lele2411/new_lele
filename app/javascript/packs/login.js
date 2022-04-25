$(document).ready(function(){
    $(".btn-login").click(function(){
        var email = $('#session_mailInput').val();
        var password = $('#session_passwordInput').val();
        var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        var check_validate = true;
        $('.error-text').remove();
        $('.failed-login').remove();
        if (email == "") {
            appendElement($('#error-box-login'), "<div class='error-text' id='error-empty-email'>Email is required!</div>")
            check_validate = false;
        } else {
            if (email.length > 256) {
                appendElement($('#error-box-login'), "<div class='error-text' id='error-limit'>Length Max is 256!</div>")
                check_validate = false;
            }
            if (!email.match(mailformat)) {
                appendElement($('#error-box-login'), "<div class='error-text' id='error-format'>Email is format!</div>")
                check_validate = false;
            }
        }
        if (password == '') {
            appendElement($('#error-box-sign-up'), "<div class='error-text' id='error-empty-password'>Password is required!</div>")
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

