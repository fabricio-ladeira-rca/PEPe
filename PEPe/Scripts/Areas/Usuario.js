﻿$(function () {

    // Form validation
    $('#form-usuario').validate({
        rules: {
            "Nome": {
                required: true
            },
            "Email": {
                required: true,
                email: true
            }
        },
        highlight: function (element) {
            $(element).closest('.form-group').removeClass('success').addClass('error');
        },
        success: function (element) {
            element.addClass('valid').closest('.form-group').removeClass('error').addClass('success');
        }
    });

    ////// Product tags with select2
    //$("#product-tags").select2({
    //    placeholder: 'Select tags or add new ones',
    //    tags: ["shirt", "gloves", "socks", "sweater"],
    //    tokenSeparators: [",", " "]
    //});

    // Bootstrap wysiwyg
    $("#summernote").summernote({
        height: 240,
        toolbar: [
            ['style', ['style']],
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['fontsize', ['fontsize']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert', ['picture', 'link', 'video']],
            ['view', ['fullscreen', 'codeview']],
            ['table', ['table']],
        ]
    });

    // jQuery rating
    $('#raty').raty({
        path: 'images/raty',
        score: 4
    });

    // Datepicker
    $('.datepicker').datepicker({
        autoclose: true,
        orientation: 'left bottom',
    });

    // Minicolors colorpicker
    $('input.minicolors').minicolors({
        position: 'top left',
        defaultValue: '#9b86d1',
        theme: 'bootstrap'
    });

    // masked input example using phone input
    $(".mask-phone").mask("(999) 999-9999");
    $(".mask-cc").mask("9999 9999 9999 9999");
});