$(document).ready(function() {
  $(".articles").slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    autoplay: false,
    arrows: true,
    prevArrow: '.slick-articles.slick-prev',
    nextArrow: '.slick-articles.slick-next',
    responsive: [
      {
        breakpoint: 767,
        settings: {
          slidesToShow: 1
        }
      },
    ]
  });
});
