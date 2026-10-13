---
title: "stdlib/mkmf_module.rb"
slug: stdlib-mkmf-module
description: "The metorex example program stdlib/mkmf_module.rb and its output."
---

`tests/_examples/stdlib/mkmf_module.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/mkmf_module.rb){target=_blank rel=noopener}.

```metorex
# Requiring mkmf defines MakeMakefile and includes it at the top level.
require "mkmf"

p MakeMakefile
p(Object.include?(MakeMakefile))
```

Output:

```
MakeMakefile
true
```
