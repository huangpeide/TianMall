$(function () {
    var error_name = true;
    var error_password = true;
    $('#username').blur(function () {
        check_user_name();
    });

    $('#userpassword').blur(function () {
        check_pwd();
    });

    function check_user_name() {
        var len = $('#username').val().length;
        if (len < 5 || len > 20) {
            $('#username').next().html('请输入5-20个字符的用户名');
            $('#username').next().css('color', '#e62e2e');
            $('#username').next().show();
            error_name = true;
        } else {
            $('#username').next().hide();
            error_name=false;
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

    $('#login_form').submit(function () {
        check_user_name();
        check_pwd();
        if (error_name == false && error_password == false) {
            return true;
        } else {
            return false;
        }
    });
});