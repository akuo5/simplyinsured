/**
 * Created by angelakuo on 3/28/16.
 */
$(document).ready(function() {

    var animating = false,
        submitPhase1 = 1100,
        submitPhase2 = 400,
        $app = $(".app");

    $(document).on("click", ".search__submit", function(e) {
        if (animating) return;
        animating = true;
        var that = this;
        $(that).addClass("processing");
        setTimeout(function() {
            $(that).addClass("success");
            setTimeout(function() {
                $app.show();
                // $app.css("top");
                // $app.addClass("active");
            }, submitPhase2 - 70);
            setTimeout(function() {
                animating = false;
                $(that).removeClass("success processing");
            }, submitPhase2);
        }, submitPhase1);
    });

});