var containerClass;

$(document).on('mouseenter', '.hover-toggle', function() {
  containerClass = '.' + $(this).data('container');
  $('.banner-quick-links:not(' + containerClass + ')').hide();
  $(containerClass).show();
  $(this).toggleClass('active');
});
