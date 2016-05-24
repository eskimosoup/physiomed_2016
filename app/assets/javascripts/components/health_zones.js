$(document).ready(function() {
  $(".health-zones").slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    autoplay: false,
    arrows: true,
    prevArrow: '.slick-health-zone.slick-prev',
    nextArrow: '.slick-health-zone.slick-next'
  });
});

$(document).on({
  mouseenter: function (e) {
    $(this).closest('div').find('.home-health-zone-hover').slideToggle();
  },
  mouseleave: function () {
    $(this).closest('div').find('.home-health-zone-hover').slideToggle();
  }
}, '.home-health-zone-link');
