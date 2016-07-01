$(document).ready(function() {
  $(".health-zones").slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    autoplay: false,
    arrows: true,
    prevArrow: '.slick-health-zone.slick-prev',
    nextArrow: '.slick-health-zone.slick-next',
    responsive: [
    {
      breakpoint: 767,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }]
  });
});

$(document).on({
  mouseover: function (e) {
    $(this).closest('div').find('.home-health-zone-hover').stop(true, true).hide().slideDown();
  },
  mouseout: function () {
    $(this).closest('div').find('.home-health-zone-hover').stop(true, true).show().slideUp();
  }
}, '.home-health-zone-link, .home-health-zone-image-link');
