---
title: Copy button check
description: Clicks each code block's copy button with the clipboard replaced by a recorder, and records the copied text, built with --drafts.
layout: page
draft: true
---

```sh
$ cargo build --release
   Compiling metorex v0.1.0
$ target/release/metorex hello.rb
hello
```

```metorex
>> [1, 2, 3].sum
=> 6
>> def twice(n)
..   n * 2
.. end
=> :twice
```

```metorex
puts "no prompts here"
x ||= 1
```

<script>
  const copied = [];

  Object.defineProperty(navigator, 'clipboard', {
    value: {
      writeText: function (text) {
        copied.push(JSON.stringify(text));
        document.documentElement.dataset.copied = copied.join(' | ');
        return Promise.resolve();
      },
    },
  });

  window.addEventListener('load', function () {
    document.querySelectorAll('.copy-button').forEach(function (button) {
      button.click();
    });
  });
</script>
