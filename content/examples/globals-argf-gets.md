---
title: "globals/argf_gets.rb"
slug: globals-argf-gets
description: "The metorex example program globals/argf_gets.rb and its output."
---

`tests/_examples/globals/argf_gets.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/argf_gets.rb){target=_blank rel=noopener}.

```metorex
def ARGF.gets
  "stubbed line"
end

puts gets
puts ARGF.gets
puts Kernel.private_instance_methods.include?(:gets)
puts ARGF.class
```

Output:

```
stubbed line
stubbed line
true
ARGF.class
```
