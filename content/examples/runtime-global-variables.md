---
title: "runtime/global/variables.rb"
slug: runtime-global-variables
description: "The metorex example program runtime/global/variables.rb and its output."
---

`tests/_examples/runtime/global/variables.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/global/variables.rb){target=_blank rel=noopener}.

```metorex
# Global variables with $ prefix
$count = 0

def increment
  $count = $count + 1
end

increment
increment
increment
puts $count

$message = "hello"
puts $message
```

Output:

```
3
hello
```
