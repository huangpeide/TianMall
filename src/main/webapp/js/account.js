$(function () {
    var index = 0;
    $('#changepassword').submit(function () {
        var pass = $('#new-pwd').val();
        var cpass = $('#confirm-pwd').val();
        var currentpass = $('#current-pwd').val();
        if (pass.length == 0 || cpass.length == 0 || currentpass.length == 0) {
            return false;
        }
        if (pass != cpass) {
            $('#savechange').next().html('两次输入的密码不一致');
            $('#savechange').next().css('color', '#e62e2e');
            $('#savechange').next().show();
            return false;
        } else {
            $('#savechange').next().hide();
            return true;
        }
    });

    $('.myaccount-content>.btn').click(function () {
        index = layer.open({
            type: 1,
            area: ['800px', '500px'],
            scrollbar: false,
            content: "<form action=\"shippingaddress\"method='post'>\n" +
                "                                                            <fieldset>\n" +
                "                                                                <legend>送货地址</legend>\n" +
                "                                                                <div class=\"single-input-item\">\n" +
                "                                                                    <label for=\"current-pwd\"\n" +
                "                                                                           class=\"required\">送货地址</label>\n" +
                "                                                                    <input type=\"text\" name='shippingaddress' id=\"shippingaddress\"\n" +
                "                                                                           placeholder=\"送货地址\"/>\n" +
                "                                                                </div>\n" +
                "\n" +
                "                                                                <div class=\"row\">\n" +
                "                                                                    <div class=\"col-lg-6\">\n" +
                "                                                                        <div class=\"single-input-item\">\n" +
                "                                                                            <label for=\"new-pwd\"\n" +
                "                                                                                   class=\"required\">收货人</label>\n" +
                "                                                                            <input type=\"text\" name='shippingname' id=\"shippingname\"\n" +
                "                                                                                   placeholder=\"收货人\"/>\n" +
                "                                                                        </div>\n" +
                "                                                                    </div>\n" +
                "\n" +
                "                                                                    <div class=\"col-lg-6\">\n" +
                "                                                                        <div class=\"single-input-item\">\n" +
                "                                                                            <label for=\"confirm-pwd\" class=\"required\">电话号码</label>\n" +
                "                                                                            <input type=\"number\" name='shippingnum' id=\"shippingnum\"\n" +
                "                                                                                   placeholder=\"电话号码\"/>\n" +
                "                                                                        </div>\n" +
                "                                                                    </div>\n" +
                "                                                                </div>\n" +
                "                                                            </fieldset>\n" +
                "\n" +
                "                                                            <div class=\"single-input-item\">\n" +
                "                                                                <button type='submit' class=\"btn\" id='shippingbtn'>确定</button>\n" +
                "                                                            </div>\n" +
                "                                                        </form>"
        })
    });

    $(document).on('click', '#shippingbtn', function () {
        layer.close(index);
    });
});