$(function () {
    var error_name = true;
    var error_password = true;
    var error_check_password = true;
    var error_email = true;
    var error_check = true;
    $('#username').blur(function () {
        check_user_name();
    });

    $('#userpassword').blur(function () {
        check_pwd();
    });

    $('#cuserpassword').blur(function () {
        check_cpwd();
    });

    $('#useremail').blur(function () {
        check_email();
    });

    $('#allow').click(function () {
        if ($(this).is(':checked')) {
            error_check = false;
            $(this).siblings('span').hide();
        } else {
            error_check = true;
            $(this).siblings('span').html('请勾选同意');
            $(this).next().css('color', '#e62e2e');
            $(this).siblings('span').show();
        }
    });

    function check_user_name() {
        var len = $('#username').val().length;
        if (len < 5 || len > 20) {
            $('#username').next().html('请输入5-20个字符的用户名');
            $('#username').next().css('color', '#e62e2e');
            $('#username').next().show();
            error_name = true;
        } else {
            console.log("qwer");
            // $('#username').next().hide();
            // error_name = false;
            $.ajax({
                type: "POST",
                url: "/tiantian/checkUser",
                dataType: "text",
                data: "username=" + $('#username').val(),
                success: function (data) {
                    if (data == "true") {
                        $('#username').next().html('用户名可以注册');
                        $('#username').next().css('color', '#82e629');
                        $('#username').next().show();
                        error_name = false;
                    } else if (data == "false") {
                        $('#username').next().html('用户名已被注册');
                        $('#username').next().css('color', '#e62e2e');
                        $('#username').next().show();
                        error_name = true;
                    }
                },
                error: function () {

                }
            })
        }
    }

    function check_pwd() {
        var len = $('#userpassword').val().length;
        if (len < 8 || len > 20) {
            $('#userpassword').next().html('密码最少8位，最长20位');
            $('#userpassword').next().css('color', '#e62e2e');
            $('#userpassword').next().show();
            error_password = true;
        } else {
            $('#userpassword').next().hide();
            error_password = false;
        }
    }

    function check_cpwd() {
        var pass = $('#userpassword').val();
        var cpass = $('#cuserpassword').val();

        if (pass != cpass) {
            $('#cuserpassword').next().html('两次输入的密码不一致');
            $('#cuserpassword').next().css('color', '#e62e2e');
            $('#cuserpassword').next().show();
            error_check_password = true;
        } else {
            $('#cuserpassword').next().hide();
            error_check_password = false;
        }

    }

    function check_email() {
        var re = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/;

        if (re.test($('#useremail').val())) {
            $('#useremail').next().hide();
            error_email = false;
        } else {
            $('#useremail').next().html('你输入的邮箱格式不正确');
            $('#useremail').next().css('color', '#e62e2e');
            $('#useremail').next().show();
            error_check_password = true;
        }
    }

    function cheched() {
        if ($('#allow').is(':checked')) {
            error_check = false;
            $('#allow').siblings('span').hide();
        } else {
            error_check = true;
            $('#allow').siblings('span').html('请勾选同意');
            $('#allow').siblings('span').show();
        }
    }


    $('#reg_form').submit(function () {
        check_user_name();
        check_pwd();
        check_cpwd();
        check_email();
        cheched();
        if (error_name == false && error_password == false && error_check_password == false && error_email == false && error_check == false) {
            return true;
        } else {
            return false;
        }
    });
});