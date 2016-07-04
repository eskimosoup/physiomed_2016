function teamMemberNavigationButtons(container) {
  if(container.prev('.team-member-profile-wrap-modal').length == 1) {
    container.find('.previous-team-member-modal').show();
  }

  if(container.next('.team-member-profile-wrap-modal').length == 1) {
    container.find('.next-team-member-modal').show();
  }
}

$(document).on("click", ".toggle-class", function(e) {
  var toggleContainer = $(this).data('container');
  var toggleClass     = $(this).data('class');
  var dataReturn      = $(this).data('return');

  $(toggleContainer).toggleClass(toggleClass);

  if($(this).data('team-member-modal') === true) {
    teamMemberNavigationButtons($(toggleContainer));
  }

  if (dataReturn === false) {
    e.preventDefault();
  }
});

$(document).on('click', '.inline-modal', function(e) {
  if (e.target !== this)
    return;

  $(this).removeClass('visible');
});

$(document).on('click', '.previous-team-member-modal', function(e) {
  $(this).parent().parent().toggleClass('visible').prev('.team-member-profile-wrap-modal').toggleClass('visible');
  teamMemberNavigationButtons($(this).parent().parent().next('.team-member-profile-wrap-modal'));

  return false;
});

$(document).on('click', '.next-team-member-modal', function(e) {
  $(this).parent().parent().toggleClass('visible').next('.team-member-profile-wrap-modal').toggleClass('visible');
  teamMemberNavigationButtons($(this).parent().parent().next('.team-member-profile-wrap-modal'));

  return false;
});
