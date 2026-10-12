---
title: Phone width check
description: Loads the theme sample in a 320px frame and records whether its page scrolls sideways, built with --drafts.
layout: page
draft: true
---

<iframe id="phone-frame" src="/theme-sample.html" width="320" height="600"></iframe>

<script>
  document.getElementById('phone-frame').addEventListener('load', function () {
    const framed = this.contentDocument.documentElement;
    document.documentElement.dataset.frameWidth = this.contentWindow.innerWidth;
    document.documentElement.dataset.framePageWidth = framed.scrollWidth;
    document.documentElement.dataset.frameTitle = this.contentDocument.title;
    document.documentElement.dataset.frameCodeWidth = this.contentDocument.querySelector('pre').scrollWidth;
  });
</script>
