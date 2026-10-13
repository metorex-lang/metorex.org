---
title: "cli_flags/show_features_parens.rb"
slug: cli-flags-show-features-parens
description: "The metorex example program cli_flags/show_features_parens.rb and its output."
---

`tests/_examples/cli_flags/show_features_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/cli_flags/show_features_parens.rb).

```metorex
# What `--enable` and `--disable` left behind, and how loud the run is.
puts(defined?(Gem).inspect)
puts(defined?(DidYouMean).inspect)
puts($VERBOSE.inspect)
puts("frozen #{"literal".frozen?}")
```
