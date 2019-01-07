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

    $('.table').on("click", ".update-cart", function () {
        var nums = $("tbody").children(".cart_item").length;
        var arrays = [];
        for (var i = 0; i < nums; i++) {
            var href = $('tbody').children().eq(i).children().eq(1).children().eq(0).attr('href');
            var dengyuindex = href.indexOf('=');
            var id = href.slice(dengyuindex + 1, href.length);
            var num = $('tbody').children().eq(i).children().eq(3).children().eq(0).children().eq(0).val();
            console.log(num);
            var data1 = {"itemid": id, "num": num};
            arrays.push(data1);
        }
        $.ajax({
            type: "POST",
            url: '/tiantian/editItemnum',
            data: {'items': JSON.stringify(arrays)},
            dataType: 'text',
            success: function (data) {
                console.log(data);
                if (data === 'true') {
                    refreshcart();
                } else if (data === 'false') {
                    alert("更新失败");
                }
            }
        });
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
                } else if (data == "false") {
                    alert("删除失败");
                } else {
                    alert("请先登录");
                    window.location.href = '/tiantian/login'
                }
            }
        });

    }

    function refreshcart() {
        var topcartstr = "";
        var bottomcartstr = "";
        var total = 0;
        $.ajax({
            type: "POST",
            url: "/tiantian/getCartItem",
            dataType: 'json',
            success: function (data) {
                $.each(data, function (i, n) {
                    topcartstr += "<li>" +
                        "<a href=\"javascript:void(0)\" class=\"remove\">×</a>" +
                        "<a href='/tiantian/item?itemid=" + n.item.id + "'>"
                        + "<img src='goodsimg/" + n.item.image + "'"
                        + "/>" + n.item.name
                        + "</a>" +
                        "</a>" +
                        "<span class='quantity'>" + n.num + "x" + n.item.value + "</span>" +
                        "</li>";

                    bottomcartstr += "<tr class=\"cart_item\">" +
                        "<td class=\"product-remove\">\n" +
                        "<a href=\"javascript:void(0)\" class=\"remove\">×</a>\n" +
                        "</td>" +
                        "<td class=\"product-thumbnail\">" +
                        "<a href='/tiantian/item?itemid=" + n.item.id + "'>"
                        + "<img src='goodsimg/" + n.item.image + "'"
                        + "/>" + "</a>" +
                        "</td>" +
                        "<td class=\"product-info\">" +
                        "<a href='/tiantian/item?itemid=" + n.item.id + "'>" +
                        n.item.name + "</a>" +
                        "<span class=\"amount\">" + n.item.value + "</span>" +
                        "</td>" +
                        "<td class=\"product-quantity\">" +
                        "<div class=\"quantity\">" +
                        "<input id='qty-" + n.item.id + "'" + " type=\"number\" min=\"1\" name=\"number\"" + " value='" + n.num + "'" +
                        " class=\"input-text\"" + " size=\"4\">" +
                        "</div>" +
                        "</td>" +
                        "<td class=\"product-subtotal\">" + "<span class=\"amount\">" + (n.item.value * n.num).toFixed(2) + "</span>" +
                        "</td>" +
                        "</tr>";
                    console.log((n.item.value * n.num).toFixed(2));
                    total = total + (parseFloat(n.item.value) * n.num);
                });
                bottomcartstr += "<tr>\n" +
                    "<td colspan=\"5\" class=\"actions\">\n" +
                    "<a class=\"continue-shopping\"\n" +
                    "href=\"${pageContext.request.contextPath}/itemList?kind=FRU\">继续购物</a>\n" +
                    "<input type=\"button\" class=\"update-cart\" name=\"update_cart\" value=\"更新购物车\">\n" +
                    "</td>\n" +
                    "</tr>";
                $(".cart-list").empty();
                $(".cart-list").append(topcartstr);
                var num = $('.cart-list').children().length;
                $(".tbody").empty();
                $(".tbody").append(bottomcartstr);
                $('.mini-cart-icon').attr('data-count', num);
                // $('.amount').text(total.toFixed(2));
                $('.cart-subtotal').children().eq(1).text(total.toFixed(2));
                if ($(".tbody").children(".cart_item").length != 0) {
                    if (total.toFixed(2) > 66) {
                        $('.shipping').children().eq(1).text("免运费");
                        $('.order-total').children().eq(1).children().eq(0).text(total.toFixed(2));
                    } else {
                        $('.shipping').children().eq(1).text("运费:15元");
                        $('.order-total').children().eq(1).children().eq(0).text((total + 15).toFixed(2));
                    }
                } else {
                    $('.shipping').children().eq(1).text("");
                    $('.order-total').children().eq(1).children().eq(0).text(0);
                }
            }
        });

    }
});