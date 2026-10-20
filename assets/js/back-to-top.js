(function () {
  'use strict';

  const button = document.querySelector('.back-to-top');

  if (!button) {
    return;
  }

  const visibleAfterPixels = 300;
  const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)');

  function update() {
    button.classList.toggle('visible', window.scrollY > visibleAfterPixels);
  }

  window.addEventListener('scroll', update, { passive: true });
  button.addEventListener('click', function () {
    window.scrollTo({ top: 0, behavior: reducedMotion.matches ? 'auto' : 'smooth' });
  });
  update();
})();
