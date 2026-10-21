(function () {
  'use strict';

  const tables = [];
  const NUMBER = /^-?[\d.,]+\s?(?:ms|s|MB|GB|KB|×|%)?$/;

  document.querySelectorAll('table').forEach(function (table) {
    const headings = Array.from(table.querySelectorAll('thead th')).map(function (heading) {
      return heading.textContent.trim();
    });

    if (headings.length === 0) {
      return;
    }

    table.querySelectorAll('tbody tr').forEach(function (row) {
      Array.from(row.children).forEach(function (cell, index) {
        if (headings[index]) {
          cell.dataset.label = headings[index];
        }
        if (NUMBER.test(cell.textContent.trim())) {
          cell.classList.add('number');
        }
        const value = document.createElement('span');
        value.className = 'cell-value';
        value.append(...cell.childNodes);
        cell.append(value);
      });
    });
    tables.push(table);
  });

  // A table stacks when its columns are wider than the space it has, so it
  // never scrolls sideways.
  function fit() {
    tables.forEach(function (table) {
      table.classList.remove('stacked');
      table.classList.toggle('stacked', table.scrollWidth > table.clientWidth);
    });
  }

  let pending = false;

  window.addEventListener('resize', function () {
    if (!pending) {
      pending = true;
      window.requestAnimationFrame(function () {
        pending = false;
        fit();
      });
    }
  });

  // Tables stay hidden until fit has measured them with the page's fonts, so a
  // table never shows as columns and then stacks.
  function reveal() {
    fit();
    document.documentElement.classList.remove('tables-pending');
  }

  fit();

  if (document.fonts) {
    Promise.race([
      document.fonts.ready,
      new Promise(function (resolve) { setTimeout(resolve, 1500); }),
    ]).then(reveal);
  } else {
    reveal();
  }
})();
