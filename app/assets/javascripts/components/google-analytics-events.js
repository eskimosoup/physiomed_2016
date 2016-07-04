$(document).on('click', '.ga-event', function() {
	var eventName = $(this).attr('data-ga-event-name');
	var itemName  = $(this).attr('data-ga-item-name');

	if ( eventName && itemName ) {
		ga('send', 'event', eventName, 'click', eventName + ': ' + itemName, 1);
	}
});
