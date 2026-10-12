---
title: Theme toggle check
description: Clicks the theme toggle inside a frame, reloads it, then clears storage, and records the mode at each step, built with --drafts.
layout: page
draft: true
---

<iframe id="toggle-frame" src="/theme-sample.html" width="600" height="300"></iframe>

<script>
  const frame = document.getElementById('toggle-frame');
  const results = [];
  let step = 0;

  function record(label) {
    const framedRoot = frame.contentDocument.documentElement;
    const background = frame.contentWindow.getComputedStyle(frame.contentDocument.body).backgroundColor;
    results.push(label + ':theme=' + (framedRoot.dataset.theme || 'none') + ',effective=' + framedRoot.dataset.themeEffective + ',stored=' + frame.contentWindow.localStorage.getItem('theme') + ',background=' + background);
    const tokenColors = ['keyword', 'symbol', 'constant', 'string', 'comment'].map(function (kind) {
      return kind + '=' + frame.contentWindow.getComputedStyle(frame.contentDocument.querySelector('.tok-' + kind)).color;
    });
    results.push(label + ':' + tokenColors.join(','));
    document.documentElement.dataset.results = results.join(' | ');
  }

  frame.addEventListener('load', function () {
    step += 1;

    if (step === 1) {
      frame.contentWindow.localStorage.removeItem('theme');
      frame.contentWindow.location.reload();
    } else if (step === 2) {
      record('fresh');
      frame.contentDocument.querySelector('.theme-toggle').click();
      record('clicked');
      frame.contentWindow.location.reload();
    } else if (step === 3) {
      record('reloaded');
      frame.contentWindow.localStorage.removeItem('theme');
      frame.contentWindow.location.reload();
    } else if (step === 4) {
      record('cleared');
    }
  });
</script>
