---
title: "errors/highlight_keyword.rb"
slug: errors-highlight-keyword
description: "The metorex example program errors/highlight_keyword.rb and its output."
---

`tests/_examples/errors/highlight_keyword.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/highlight_keyword.rb){target=_blank rel=noopener}.

```metorex
# `highlight:` takes true, false, or nil and nothing else.
problem = begin
  raise("meter offline")
rescue => raised
  raised
end
p problem.full_message(highlight: false, order: :top).include?("meter offline (RuntimeError)")
p problem.detailed_message(highlight: nil)
begin
  problem.full_message(highlight: "yes")
rescue ArgumentError => refused
  p refused.message
end
begin
  problem.detailed_message(highlight: 1)
rescue ArgumentError => refused
  p refused.message
end

# A program's own `set_backtrace` is handed the backtrace `raise` names.
class LoggedError < StandardError
  attr_reader :log
  def set_backtrace(lines)
    (@log ||= []) << lines
    super
  end
end
begin
  raise LoggedError, "late", ["meter.rb:4"]
rescue LoggedError => caught
  p caught.log
  p caught.backtrace
end
```

Output:

```
true
"meter offline (RuntimeError)"
"expected true or false as highlight: \"yes\""
"expected true or false as highlight: 1"
[["meter.rb:4"]]
["meter.rb:4"]
```
