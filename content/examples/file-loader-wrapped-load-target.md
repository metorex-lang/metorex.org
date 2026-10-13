---
title: "file_loader/wrapped_load_target.rb"
slug: file-loader-wrapped-load-target
description: "The metorex example program file_loader/wrapped_load_target.rb and its output."
---

`tests/_examples/file_loader/wrapped_load_target.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/file_loader/wrapped_load_target.rb){target=_blank rel=noopener}.

```metorex
# Loaded through `load(path, wrap)`. What it defines belongs to the module the
# load was wrapped in rather than to the program.
class WrappedInside
  $wrapped_notes << String
end

WRAPPED_CONSTANT = 1

def wrapped_top_method
  :wrapped_top_method
end

$wrapped_notes << method(:wrapped_top_method).owner
$wrapped_notes << self.to_s
```
