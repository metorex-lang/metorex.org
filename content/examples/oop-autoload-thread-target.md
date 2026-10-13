---
title: "oop/autoload_thread_target.rb"
slug: oop-autoload-thread-target
description: "The metorex example program oop/autoload_thread_target.rb and its output."
---

`tests/_examples/oop/autoload_thread_target.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/autoload_thread_target.rb){target=_blank rel=noopener}.

```metorex
module Outer
  class Foo
    block = $saved_lambda
    block.call
  end
end
```
