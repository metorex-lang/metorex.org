---
title: "control_flow/case_string.rb"
slug: control-flow-case-string
description: "The metorex example program control_flow/case_string.rb and its output."
---

`tests/_examples/control_flow/case_string.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/case_string.rb){target=_blank rel=noopener}.

```metorex
# Case statement with string matching
command = "start"

case command
  when "start"
    puts "Starting server"
  when "stop"
    puts "Stopping server"
  when "restart"
    puts "Restarting server"
  else
    puts "Unknown command"
end
```
