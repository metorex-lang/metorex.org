---
title: Phone width check
description: Loads each page of the site in a 320px frame and records whether any page scrolls sideways, built with --drafts.
layout: page
draft: true
---

<iframe class="phone-frame" data-page="home" src="/index.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="sample" src="/theme-sample.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="install" src="/install.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="meta" src="/docs/meta.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="language" src="/language.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="ruby-differences" src="/docs/ruby-differences.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="implementations" src="/implementations.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="rex" src="/docs/rex.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="c-extensions" src="/docs/c-extensions.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="cli" src="/docs/cli.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="architecture" src="/architecture.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="benchmarks" src="/benchmarks.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="beyond-ruby" src="/beyond-ruby.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="stdlib" src="/docs/stdlib.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="versions" src="/versions.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="contributing" src="/contributing.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="syntax-tree-nodes" src="/docs/syntax-tree-nodes.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="blog" src="/blog.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="blog-post" src="/blog/introducing-metorex.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="tags" src="/tags.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="tag" src="/tags/announcements.html" width="320" height="600"></iframe>
<iframe class="phone-frame" data-page="archive" src="/archives/2026-10.html" width="320" height="600"></iframe>
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
