---
title: Search Check
description: Types a query into the header search box and records the result titles, built with --drafts.
layout: page
draft: true
---

<script>
  window.addEventListener('load', function () {
    setTimeout(function () {
      const input = document.querySelector('[data-blogin-search] input');
      input.value = 'theme';
      input.dispatchEvent(new Event('input', { bubbles: true }));

      setTimeout(function () {
        const titles = Array.from(document.querySelectorAll('[data-blogin-results] .blogin-result-title')).map(function (title) {
          return title.textContent;
        });
        const results = document.querySelector('[data-blogin-results]');
        document.documentElement.dataset.searchResults = titles.join(' | ');
        document.documentElement.dataset.searchPosition = getComputedStyle(results).position;
      }, 200);
    }, 500);
  });
</script>
