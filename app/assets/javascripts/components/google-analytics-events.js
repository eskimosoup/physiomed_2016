$(function() {
  $('.ga-event').attr('target', '_blank');
});

$(document).on('click', '.ga-event', function(e) {
	var eventName = $(this).data('event-name');
	var itemName  = $(this).data('item-name');

	if ( eventName && itemName ) {
    ga('send', {
      hitType: 'event',
      eventCategory: eventName, //required
      eventAction: 'click', //required
      eventLabel: eventName + ': ' + itemName,
      eventValue: 1,
      hitCallback: function() {
        console.log('Event sent: ' + eventName + ' ' + itemName);
      }
    });
  }
});
