---
title: "backtraces/private_call_frame/main.rb"
slug: backtraces-private-call-frame-main
description: "The metorex example program backtraces/private_call_frame/main.rb and its output."
---

`tests/_examples/backtraces/private_call_frame/main.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/backtraces/private_call_frame/main.rb).

```metorex
require_relative "library"

begin
  Settings.new.alias_name(:feature)
rescue NoMethodError => error
  puts error.message
  puts error.backtrace.first(2).map { |line| line.sub(%r{\A[^:]*/}, "") }
end

begin
  Settings.new.missing_name
rescue NoMethodError => error
  puts error.backtrace.first(2).map { |line| line.sub(%r{\A[^:]*/}, "") }
end
```

Output:

```
private method 'hidden' called for class Registry
library.rb:13:in 'Settings#alias_name'
main.rb:4:in '<main>'
library.rb:17:in 'Settings#missing_name'
main.rb:11:in '<main>'
```
