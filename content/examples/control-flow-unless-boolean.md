---
title: "control_flow/unless_boolean.rb"
slug: control-flow-unless-boolean
description: "The metorex example program control_flow/unless_boolean.rb and its output."
---

`tests/_examples/control_flow/unless_boolean.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/unless_boolean.rb).

```metorex
# Unless with boolean conditions
is_logged_in = false
is_admin = true

unless is_logged_in
  puts "Please log in"
end

unless is_admin
  puts "You are not an admin"
else
  puts "You have admin privileges"
end
```
