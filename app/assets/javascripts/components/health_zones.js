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

$(document).on('mouseout', '.home-health-zone-link', function() {
  $(this).closest('div').find('.home-health-zone-hover').stop(true, true).show().slideUp();
});

$(document).on('mouseout', '.home-health-zone-hover', function() {
  $(this).stop(true, true).show().slideUp();
});

$(document).on('mouseover', '.home-health-zone-link, .home-health-zone-image-link', function() {
  $(this).closest('div').find('.home-health-zone-hover').stop(true, true).hide().slideDown();
});
