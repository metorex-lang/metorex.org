---
title: "stdlib/string/format_verbose_warning_parens.rb"
slug: stdlib-string-format-verbose-warning-parens
description: "The metorex example program stdlib/string/format_verbose_warning_parens.rb and its output."
---

`tests/_examples/stdlib/string/format_verbose_warning_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/string/format_verbose_warning_parens.rb){target=_blank rel=noopener}.

```metorex
$VERBOSE = true
puts(format("no placeholders", 1))
$VERBOSE = false
puts(format("still quiet", 2))
```
