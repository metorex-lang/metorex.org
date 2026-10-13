---
title: "cli_flags/show_encodings.rb"
slug: cli-flags-show-encodings
description: "The metorex example program cli_flags/show_encodings.rb and its output."
---

`tests/_examples/cli_flags/show_encodings.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/cli_flags/show_encodings.rb){target=_blank rel=noopener}.

```metorex
internal = Encoding.default_internal
puts("source #{__ENCODING__.name}")
puts("external #{Encoding.default_external.name}")
puts("internal #{internal.nil? ? "none" : internal.name}")
```
