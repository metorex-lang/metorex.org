---
title: Phone width check
description: Loads the home, install, docs, and theme sample pages in 320px frames and records whether any page scrolls sideways, built with --drafts.
layout: page
draft: true
---

<iframe class="phone-frame" data-page="home" src="/index.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="sample" src="/theme-sample.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="install" src="/install.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="meta" src="/meta.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="language" src="/language.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="docs" src="/docs/layout-check.html" width="320" height="600"></iframe>

<script>
  const widths = [];

  document.querySelectorAll('.phone-frame').forEach(function (frame) {
    frame.addEventListener('load', function () {
      widths.push(frame.dataset.page + ':frame=' + frame.contentWindow.innerWidth + ',page=' + frame.contentDocument.documentElement.scrollWidth);
      document.documentElement.dataset.widths = widths.sort().join(' | ');
    });
  });
</script>
