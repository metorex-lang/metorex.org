---
title: "file_loader/own_top_level_locals_no_parens.rb"
slug: file-loader-own-top-level-locals-no-parens
description: "The metorex example program file_loader/own_top_level_locals_no_parens.rb and its output."
---

`tests/_examples/file_loader/own_top_level_locals_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/file_loader/own_top_level_locals_no_parens.rb).

```metorex
# A file loaded from another one keeps its own top-level locals, so a name it
# binds there never shows up in the file that loaded it. Constants, methods,
# and classes are shared.
require_relative "own_top_level_locals_lib"

p LOADED_CONSTANT
p loaded_method

begin
  p loaded_local
rescue NameError => refused
  p refused.message
end

p binding.local_variables.sort
```

Output:

```
"shared"
"shared method"
"undefined local variable or method 'loaded_local' for main"
[:refused]
```
