//= require js-cookie

function modalEvent(event) {
  document.querySelector('.inline-notice-modal').classList.remove('visible');
  Cookies.set('inline-notice-modal', '1', { expires: 7 });
  event.preventDefault();
}

// IE support: https://developer.mozilla.org/en-US/docs/Web/API/Element/matches
if (!Element.prototype.matches) {
  Element.prototype.matches = Element.prototype.msMatchesSelector;
}

document.addEventListener('click',
  function (event) {
    if (event.target.matches('.inline-notice-modal-content__button')) {
      modalEvent(event);
    }
    if (event.target.matches('.inline-notice-modal-content a')) {
      document.querySelector('.inline-notice-modal').classList.remove('visible');
      Cookies.set('inline-notice-modal', '1', { expires: 7 });
      window.location.href = event.target.getAttribute('href');
    }
  },
  false
);

function turbolinksCheck() {
  return (typeof Turbolinks == 'undefined') ? 'DOMContentLoaded' : 'turbolinks:load';
}

let initializer = turbolinksCheck();

document.addEventListener(
  initializer,
  function () {
    if (Cookies.get('inline-notice-modal') != 1) {
      document.querySelector('.inline-notice-modal').classList.add('visible');
    }
  }
);
