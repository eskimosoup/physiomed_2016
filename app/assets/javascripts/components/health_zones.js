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
  mouseenter: function (e) {
    $(this).closest('div').find('.home-health-zone-hover').slideDown();
  },
  mouseleave: function () {
    $(this).closest('div').find('.home-health-zone-hover').slideUp();
  }
}, '.home-health-zone-link');

$(document).on('mouseenter', '.home-health-zone-image-link', function() {
  $(this).closest('div').find('.home-health-zone-hover').slideDown();
});

$(document).on('mouseleave', '.home-health-zone-hover', function() {
  $(this).slideUp();
});
