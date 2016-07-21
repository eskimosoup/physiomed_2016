$(function() {
  $('.ga-event').attr('target', '_blank');
});

$(document).on('click', '.ga-event', function(e) {
	var eventName = $(this).data('event-name');
	var itemName  = $(this).data('item-name');

	if ( eventName && itemName ) {
		ga('send', 'event', eventName, 'click', eventName + ': ' + itemName, 1);
	}
});
