$(function () {
    $('.cart-list').on("click", "li .remove", function () {
        var href = $(this).next('a').attr('href');
        var dengyuindex = href.indexOf('=');
        var id = href.slice(dengyuindex + 1, href.length);
        removeitem(id, -1);
    });
    $('.table').on("click", ".product-remove", function () {
        var href = $(this).next().children().eq(0).attr('href');
        var dengyuindex = href.indexOf('=');
        var id = href.slice(dengyuindex + 1, href.length);
        removeitem(id, -1);
    });
    function removeitem(itemid, num) {
        var numstring = "";
        if (num != -1) {
            numstring = "&num=" + num;
        }
        $.ajax({
            type: "POST",
            //todo
            url: "/tiantian/removeItemAllNum",
            dataType: "text",
            data: "itemid=" + itemid + numstring,
            success: function (data) {
                if (data == "true") {
                    refreshcart();
                } else if (data == "false") {
                    alert("删除失败");
                } else {
                    alert("请先登录");
                    window.location.href = '/tiantian/login'
                }
            }
        });

    }
});