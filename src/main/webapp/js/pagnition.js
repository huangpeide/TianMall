$(function () {
    $('.pagination').on("click",".num",function () {
        //todo 坑点
        changePagination(parseInt($(this).text()));
        getData(parseInt($(this).text()));
    });
    $('.pagination>.prev').click(function () {
        var current = getCurrent();
        if (current != 1) {
            changePagination(getCurrent() - 1);
            getData(getCurrent() - 1);
        }
    });
    $('.pagination>.next').click(function () {
        var current = getCurrent();
        if (current != getTotalChildren()) {
            changePagination(getCurrent() + 1);
            getData(getCurrent() - 1);
        }
    });

    function getData(pages) {
        var kind=$('#displaykind').text();
        $.ajax({
            type: "POST",
            url: "/tiantian/itemList",
            dataType: 'json',
            data: "kind=" + kind + "&pages=" + pages,
            success: function (data) {
                var appendstr = "";
                $.each(data, function (i, n) {
                    appendstr += "<div class=\"col-md-4 col-sm-6 product-item text-center mb-3\">"
                        + "<div class=\"product-thumb\">"
                        + "<a href='/tiantian/item?itemid=" + n.id + "'>"
                        + "<img src='goodsimg/" + n.image + "'"
                        + "/>"
                        + "</a>"
                        + "<div class=\"product-action\">\n" +
                        "<span class=\"add-to-cart\">\n" +
                        "<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Add to cart\"></a>\n" +
                        "</span>\n" +
                        "<span class=\"wishlist\">\n" +
                        "<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Add to wishlist\"></a>\n" +
                        "</span>\n" +
                        "<span class=\"quickview\">\n" +
                        "<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Quickview\"></a>\n" +
                        "</span>\n" +
                        "<span class=\"compare\">\n" +
                        "<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Compare\"></a>\n" +
                        "</span>\n" +
                        "</div>"
                        + "</div>"
                        + "<div class=\"product-info\">"
                        + "<a href='/tiantian/item?itemid=" + n.id + "'>"
                        + "<h2 class=\"title\">" +
                        n.name + "</h2>" +
                        "<span class=\"price\">" +
                        n.value +
                        "</span>"
                        + "</a>"
                        + "</div>"
                        + "</div>"
                });
                $(".product-grid").empty().append(appendstr);
                $("html, body").animate({
                    scrollTop: $('.product-grid').offset().top-120
                }, 800);
            }
        })
    }

    //todo 售罄
    function checkstock(stock) {
        if (parseInt(stock) == 0) {
            return "<div class=\"badges\">\n" +
                "                                            <span class=\"hot\">Hot</span>\n" +
                "                                            <span class=\"onsale\">Sale!</span>\n" +
                "                                        </div>"
        }
        return "";
    }

    function getCurrent() {
        return parseInt($('.pagination>span').text());
    }

    function getTotalChildren() {
        return $('.pagination').children().length - 2;
    }

    function changePagination(pages) {
        var a = $("<a class=\"page-numbers num\" href=\"javascript:void(0)\"></a>");
        a.text(getCurrent());

        var span=$("<span class=\"page-numbers current\"></span>");
        span.text(pages);
        $('.pagination').children().eq(getCurrent()).after(a);
        $('.pagination').children().eq(getCurrent()).remove();

        $('.pagination').children().eq(pages).after(span);
        $('.pagination').children().eq(pages).remove();
    }
});