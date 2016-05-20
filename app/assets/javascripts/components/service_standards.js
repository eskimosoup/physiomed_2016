$(document).ready(function () {
  $(".service-standard").mouseenter(function() {
    $(this).children(".main-content").slideUp(500);
    $(this).children(".hover-content").slideDown(500);
  })
  $(".service-standard").mouseleave(function() {
    $(this).children(".main-content").slideDown(500);
    $(this).children(".hover-content").slideUp(500);
  })
});
