(function () {
  'use strict';

  const toggle = document.querySelector('.nav-toggle');
  const nav = document.getElementById('site-nav');

  if (!toggle || !nav) {
    return;
  }

  toggle.addEventListener('click', function () {
    const open = toggle.getAttribute('aria-expanded') !== 'true';

    toggle.setAttribute('aria-expanded', String(open));
    toggle.setAttribute('aria-label', open ? 'Hide menu' : 'Show menu');
    nav.classList.toggle('open', open);
  });

  const menus = Array.from(nav.querySelectorAll('.nav-menu'));

  function setMenuOpen(menu, open) {
    menu.classList.toggle('open', open);
    menu.querySelector('.nav-menu-toggle').setAttribute('aria-expanded', String(open));
  }

  menus.forEach(function (menu) {
    const menuToggle = menu.querySelector('.nav-menu-toggle');

    menuToggle.addEventListener('click', function () {
      const open = !menu.classList.contains('open');

      menus.forEach(function (other) {
        setMenuOpen(other, other === menu && open);
      });
    });

    menu.addEventListener('keydown', function (event) {
      if (event.key === 'Escape' && menu.classList.contains('open')) {
        setMenuOpen(menu, false);
        menuToggle.focus();
      }
    });

    menu.addEventListener('focusout', function (event) {
      if (!menu.contains(event.relatedTarget)) {
        setMenuOpen(menu, false);
      }
    });
  });

  document.addEventListener('click', function (event) {
    menus.forEach(function (menu) {
      if (!menu.contains(event.target)) {
        setMenuOpen(menu, false);
      }
    });
  });
})();
