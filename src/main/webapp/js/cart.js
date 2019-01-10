$(function () {
    $('.add-to-cart').click(function () {
        var href = $(this).parent().prev().attr('href');
        var dengyuindex = href.indexOf('=');
        var id = href.slice(dengyuindex + 1, href.length);
        addtocart(id, 1);
        return false;
    });

    $('.wishlist').click(function () {
        var href = $(this).parent().prev().attr('href');
        var dengyuindex = href.indexOf('=');
        var id = href.slice(dengyuindex + 1, href.length);
        addToWishList(id);
        return false;
    });


    $('.single-add-to-cart').click(function () {
        var itemid = parseInt($(this).prev().text());
        var num = parseInt($('.quantity>input').val());
        addtocart(itemid, num);
    });


    $('.cart-list').on("click", "li .remove", function () {
        var href = $(this).next('a').attr('href');
        var dengyuindex = href.indexOf('=');
        var id = href.slice(dengyuindex + 1, href.length);
        removeitem(id, -1);
    });

    function addtocart(itemid, num) {
        $.ajax({
            type: "POST",
            url: "/tiantian/addToCart",
            dataType: "text",
            data: "itemid=" + itemid + "&num=" + num,
            success: function (data) {
                if (data == "true") {
                    refreshcart();
                    alert("添加成功");
                } else if (data == "false") {
                    alert("添加失败");
                } else {
                    alert("请先登录");
                    window.location.href = '/tiantian/login'
                }
            }
        });

    }

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
                    alert("删除成功");
                } else if (data == "false") {
                    alert("删除失败");
                } else {
                    alert("请先登录");
                    window.location.href = '/tiantian/login'
                }
            }
        });

    }
    function addToWishList(id) {
        $.ajax({
            type: "POST",
            url: "/tiantian/addToList",
            dataType: "text",
            data: "itemid=" + id,
            success: function (data) {
                if (data == "true") {
                    refreshcart();
                    alert("添加成功")
                } else if (data == "false") {
                    alert("添加失败");
                } else {
                    alert("请先登录");
                    window.location.href = '/tiantian/login'
                }
            }
        });
    }

    function refreshcart() {
        var appendstr = "";
        var total = 0;
        $.ajax({
            type: "POST",
            url: "/tiantian/getCartItem",
            dataType: 'json',
            success: function (data) {
                $.each(data, function (i, n) {
                    appendstr += "<li>" +
                        "<a href=\"javascript:void(0)\" class=\"remove\">×</a>" +
                        "<a href='/tiantian/item?itemid=" + n.item.id + "'>"
                        + "<img src='goodsimg/" + n.item.image + "'"
                        + "/>" + n.item.name
                        + "</a>" +
                        "</a>" +
                        "<span class='quantity'>" + n.num + "x" + n.item.value + "</span>" +
                        "</li>";
                    total = total + (parseFloat(n.item.value) * n.num);
                });
                $(".cart-list").empty();
                $(".cart-list").append(appendstr);
                var num = $('.cart-list').children().length;
                $('.mini-cart-icon').attr('data-count', num);
                $('.amount').text(total.toFixed(2));
            }
        });
    }
});