---
title: "errors/backtrace/locations.rb"
slug: errors-backtrace-locations
description: "The metorex example program errors/backtrace/locations.rb and its output."
---

`tests/_examples/errors/backtrace/locations.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/backtrace/locations.rb){target=_blank rel=noopener}.

```metorex
# `Exception#backtrace_locations` answers Thread::Backtrace::Location objects,
# nil until the exception is raised, and the same Array on every call.

unraised = RuntimeError.new("never raised")
puts unraised.backtrace_locations.inspect

begin
  raise "raised here"
rescue RuntimeError => error
  locations = error.backtrace_locations
  puts locations.class.to_s
  puts locations.first.instance_of?(Thread::Backtrace::Location).to_s
  puts locations.equal?(error.backtrace_locations).to_s
  puts locations.first.path.end_with?(".rb").to_s
  puts (locations.first.lineno > 0).to_s
end

# `each_with_index` yields the element and its position.
labelled = []
["a", "b"].each_with_index do |value, index|
  labelled.push "#{index}:#{value}"
end
puts labelled.inspect
single = ["only"]
puts single.each_with_index.class.to_s
```

Output:

```
nil
Array
true
true
true
true
["0:a", "1:b"]
Enumerator
```
