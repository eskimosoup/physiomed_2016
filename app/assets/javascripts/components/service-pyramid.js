// https://stackoverflow.com/questions/1740700/how-to-get-hex-color-value-rather-than-rgb-value
var hexDigits = new Array
  ("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f");

//Function to convert rgb color to hex format
function rgb2hex(rgb) {
  rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
  return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
}

function hex(x) {
  return isNaN(x) ? "00" : hexDigits[(x - x % 16) / 16] + hexDigits[x % 16];
}
// Legend! https://stackoverflow.com/questions/5560248/programmatically-lighten-or-darken-a-hex-color-or-rgb-and-blend-colors
function shadeColor2(color, percent) {
  var f = parseInt(color.slice(1), 16), t = percent < 0 ? 0 : 255, p = percent < 0 ? percent * -1 : percent, R = f >> 16, G = f >> 8 & 0x00FF, B = f & 0x0000FF;
  return "#" + (0x1000000 + (Math.round((t - R) * p) + R) * 0x10000 + (Math.round((t - G) * p) + G) * 0x100 + (Math.round((t - B) * p) + B)).toString(16).slice(1);
}
$(document).on('mouseover', '.home-pyramid-content-structure__text', function () {
  var serviceId = $(this).data('service-id');
  $('.home-pyramid-content-overlay').hide();
  $('#service-' + serviceId).show();
  var offset = $(this).parent().position();
  var hexColor = rgb2hex($(this).css('background-color'));
  var backgroundColor = shadeColor2(hexColor, -0.25);
  $('.home-pyramid-content__connector').css({ top: offset.top + 10, backgroundColor: backgroundColor });
});
$(document).on('mouseleave', '.home-pyramid', function () {
  $('.home-pyramid-content__connector').css({ backgroundColor: 'transparent' });
  $('.home-pyramid-content-overlay').hide();
  $('.home-pyramid-content-overlay--0').show();
});
$(document).ready(function () {
  /*
  var $item = $('.home-pyramid-content-structure__text:first');
  var offset = $item.parent().position();
  var hexColor = rgb2hex($item.css('background-color'));
  var backgroundColor = shadeColor2(hexColor, -0.25);
  $('.home-pyramid-content__connector').css({ top: offset.top + 10, backgroundColor: backgroundColor });
  */
})
