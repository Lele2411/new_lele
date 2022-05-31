$(function() {
    const lengthOfCompanyCode = [6];
    const lengthOfCompanyPhoneNumber = [10, 11];

    preventEnter($("#company_company_code"), lengthOfCompanyCode, $("#company_code_error"), "#company_code_error_detail", "<div id='company_code_error_detail'>Company code must have 6 characters!</div>");
    preventEnter($("#company_company_profiles_attributes_0_phone_number"), lengthOfCompanyPhoneNumber, $("#phone_number_error"), "#phone_number_error_detail", "<div id='phone_number_error_detail'>Phone number must have 10 or 11 characters!</div>");

    $("#btn-update-company").on('click', function() {
        $("#company-register-frm").submit();
    })

    $(".btn-update-status").each(function() {
        $(this).on('click', function() {
            $("#company_status").val(this.value);
        });
    })

    $("#btn-update-status").on("click", function() {
        $("#form-update-status").submit();
    })

    if ($("#check-status-update").length && $("#check-status-update").val() == "true") {
        $("#btn-update-success").click();
    }

    $("#company_company_profiles_attributes_0_phone_number").bind("paste", function(e) {
        if (!e.originalEvent.clipboardData.getData('text').match(/^\d+$/)) {
            e.preventDefault();
        }
    })

    $("#company_company_profiles_attributes_0_phone_number").bind("keypress", function(e) {
        if (!e.key.match(/^\d+$/)) {
            e.preventDefault();
        }
    })

    function appendElement(selectedElement, appendedElelement) {
        selectedElement.append(appendedElelement);
    }

    function preventEnter(inputElement, compareArr, parentElement, element, message) {
        inputElement.on('input', function() {
            if (!compareArr.includes(inputElement.val().length)) {
                if ($(element).length == 0) {
                    appendElement(parentElement, message)
                }
            } else {
                $(element).remove();
            }
        })
        inputElement.on('keypress', function(event) {
            if (inputElement.val().length > compareArr.at(-1) - 1) {
                event.preventDefault();
            }
        });
    }
});

import 'packs/application'
