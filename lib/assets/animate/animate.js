function animateIn() {
  var $elem = $(this);
  var animationType = $elem.data('animation-type');
  var animationDelay = $elem.data('animation-delay');

  if (Modernizr.mq('only screen and (min-width: 1024px)') && $elem.data('animation-delay-large') !== undefined) {
    animationDelay = $elem.data('animation-delay-large');
  }

  if (Modernizr.mq('only screen and (min-width: 1024px)') && $elem.data('animation-type-large') !== undefined) {
    animationType = $elem.data('animation-type-large');
  }

  if (animationDelay !== undefined) {
    setTimeout(function () {
      $elem.removeClass('visibility-hidden').addClass('animated ' + animationType);
    }, animationDelay);
  } else {
    $elem.removeClass('visibility-hidden').addClass('animated ' + animationType);
  }
}

function animateOut() {
  var $elem = $(this);
  var animationType = $elem.data('animation-type');
  $elem.removeClass('animated ' + animationType).addClass('visibility-hidden');
}

// if (Modernizr.mq('only screen and (min-width: 768px)') && !$('html').hasClass('ie9')) {
if (Modernizr.mq('only screen and (min-width: 768px)')) {
  $(function () {
    $('[data-animation-type]').addClass('visibility-hidden');

    $('[data-animation-type]').onScreen({
      tolerance: 0,
      toggleClass: 'onScreen',
      doIn: animateIn,
      // doOut: animateOut
    });
  });
}
