---
title: "oop/include_no_arguments.rb"
slug: oop-include-no-arguments
description: "The metorex example program oop/include_no_arguments.rb and its output."
---

`tests/_examples/oop/include_no_arguments.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/include_no_arguments.rb).

```metorex
begin
  Class.new do
    include
  end
rescue ArgumentError => error
  puts error.message
end
```
