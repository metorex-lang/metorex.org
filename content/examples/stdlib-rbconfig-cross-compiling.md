---
title: "stdlib/rbconfig_cross_compiling.rb"
slug: stdlib-rbconfig-cross-compiling
description: "The metorex example program stdlib/rbconfig_cross_compiling.rb and its output."
---

`tests/_examples/stdlib/rbconfig_cross_compiling.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/rbconfig_cross_compiling.rb){target=_blank rel=noopener}.

```metorex
# RbConfig says Ruby was built for the platform it runs on, which Bundler
# reads through CROSS_COMPILING.
require "rbconfig"

p(CROSS_COMPILING)
p(RbConfig::CONFIG["CROSS_COMPILING"])
p(CROSS_COMPILING || RUBY_PLATFORM == RUBY_PLATFORM)
```

Output:

```
nil
"no"
true
```
