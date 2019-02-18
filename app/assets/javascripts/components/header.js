/*
if (Modernizr.mq('only screen and (min-width: 1200px)')) {
  var offsetHeight, $header, $offsetBase;

  function setFixedHeader() {
    if ($header === undefined) {
      $header = $('.primary-header-wrap');
    }
    if ($offsetBase === undefined) {
      $offsetBase = $('.primary-header-wrap');
    }
    if (offsetHeight === undefined) {
      offsetHeight = parseInt($offsetBase.height());
    }

    if ($(document).scrollTop() > offsetHeight) {
      $header.addClass('scroll');
    } else {
      $header.removeClass('scroll');
    }
  }

  $(window).load(function () {
    setFixedHeader();
  });

  $(window).scroll(function () {
    setFixedHeader();
  });
}
*/
