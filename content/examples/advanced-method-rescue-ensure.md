---
title: "advanced/method_rescue_ensure.rb"
slug: advanced-method-rescue-ensure
description: "The metorex example program advanced/method_rescue_ensure.rb and its output."
---

`tests/_examples/advanced/method_rescue_ensure.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/method_rescue_ensure.rb).

```metorex
def with_rescue
  raise "oops"
rescue
  puts "rescued"
end

with_rescue()

def with_ensure
  puts "body"
ensure
  puts "ensure ran"
end

with_ensure()

def with_both
  raise "fail"
rescue
  puts "caught"
ensure
  puts "cleanup"
end

with_both()
```

Output:

```
rescued
body
ensure ran
caught
cleanup
```
