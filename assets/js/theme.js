(function () {
  'use strict';

  const root = document.documentElement;
  const darkQuery = window.matchMedia('(prefers-color-scheme: dark)');

  function storedTheme() {
    try {
      return localStorage.getItem('theme');
    } catch (error) {
      return null;
    }
  }

  function storeTheme(theme) {
    try {
      localStorage.setItem('theme', theme);
    } catch (error) {
      // Storage can be blocked. The choice then lasts until the page unloads.
    }
  }

  darkQuery.addEventListener('change', function (event) {
    if (!root.dataset.theme) {
      root.dataset.themeEffective = event.matches ? 'dark' : 'light';
    }
  });

  document.querySelectorAll('.theme-toggle').forEach(function (button) {
    button.addEventListener('click', function () {
      const next = root.dataset.themeEffective === 'dark' ? 'light' : 'dark';

      root.dataset.theme = next;
      root.dataset.themeEffective = next;
      storeTheme(next);
    });
  });

  if (!storedTheme()) {
    delete root.dataset.theme;
  }
})();
