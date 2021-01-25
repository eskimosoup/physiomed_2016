$(function() {
  $('.ga-event:not(.ga-inline)').attr('target', '_blank');
});

$(document).on('click', '.ga-event', function(e) {
	var eventName = $(this).data('event-name');
	var itemName  = $(this).data('action-name');
  var actionName = $(this).data('item-name');

  if(actionName === undefined) {
    eventName = $(this).data('event-category');
  }

  if (itemName === undefined) {
    itemName = $(this).data('event-action');
  }

  if (actionName === undefined) {
    actionName = 'click';
  }

  console.log('Event begin: ' + eventName + ' ' + itemName);

	if ( eventName && itemName && typeof ga === 'function') {
    ga('send', {
      hitType: 'event',
      eventCategory: eventName, //required
      eventAction: actionName, //required
      eventLabel: eventName + ': ' + itemName,
      eventValue: 1,
      hitCallback: function() {
        console.log('Event sent: ' + eventName + ' ' + itemName);
      }
    });
  }
});
