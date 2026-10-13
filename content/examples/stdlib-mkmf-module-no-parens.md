---
title: "stdlib/mkmf_module_no_parens.rb"
slug: stdlib-mkmf-module-no-parens
description: "The metorex example program stdlib/mkmf_module_no_parens.rb and its output."
---

`tests/_examples/stdlib/mkmf_module_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/mkmf_module_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Requiring mkmf defines MakeMakefile and includes it at the top level.
require "mkmf"

p MakeMakefile
p Object.include? MakeMakefile
```

Output:

```
MakeMakefile
true
```
