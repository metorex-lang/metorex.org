---
title: "errors/system_exit_subclass.rb"
slug: errors-system-exit-subclass
description: "The metorex example program errors/system_exit_subclass.rb and its output."
---

`tests/_examples/errors/system_exit_subclass.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/system_exit_subclass.rb){target=_blank rel=noopener}.

```metorex
class CustomExit < SystemExit
end

puts "before raise"
raise CustomExit.new(8)
puts "never reached"
```
