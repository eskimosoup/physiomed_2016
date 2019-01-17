// https://stackoverflow.com/a/29853395
if (Modernizr.mq('only screen and (min-width: 1024px)')) {
  (function ($, window) {
    var adjustAnchor = function () {

      var $anchor = $(':target'),
        fixedElementHeight = 150;

      if ($anchor.length > 0) {

        $('html, body')
          .stop()
          .animate({
            scrollTop: $anchor.offset().top - fixedElementHeight
          }, 200);

      }

    };

    $(window).on('hashchange load', function () {
      adjustAnchor();
    });

  })(jQuery, window);
}
