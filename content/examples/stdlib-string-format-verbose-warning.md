---
title: "stdlib/string/format_verbose_warning.rb"
slug: stdlib-string-format-verbose-warning
description: "The metorex example program stdlib/string/format_verbose_warning.rb and its output."
---

`tests/_examples/stdlib/string/format_verbose_warning.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/string/format_verbose_warning.rb).

```metorex
$VERBOSE = true
puts format("no placeholders", 1)
$VERBOSE = false
puts format("still quiet", 2)
```
