---
title: "c_extensions/autoloaded_class.rb"
slug: c-extensions-autoloaded-class
description: "The metorex example program c_extensions/autoloaded_class.rb and its output."
---

`tests/_examples/c_extensions/autoloaded_class.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/autoloaded_class.rb){target=_blank rel=noopener}.

```metorex
# Loaded by autoload when C code first asks for Outer::Loaded.
module Outer
  class Loaded
  end
end
```
