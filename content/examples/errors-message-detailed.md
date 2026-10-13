---
title: "errors/message/detailed.rb"
slug: errors-message-detailed
description: "The metorex example program errors/message/detailed.rb and its output."
---

`tests/_examples/errors/message/detailed.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/message/detailed.rb){target=_blank rel=noopener}.

```metorex
# `Exception#detailed_message` decorates the message with the class name, or
# stands in for an empty one. `#full_message` renders the whole thing the way
# an uncaught exception is printed.

puts RuntimeError.new("new error").detailed_message
puts RuntimeError.new("").detailed_message
puts StandardError.new("").detailed_message
puts RuntimeError.new("new error").detailed_message(foo: true)

# An anonymous class has no name to decorate with.
anonymous = Class.new(RuntimeError)
puts anonymous.new("message").detailed_message
puts anonymous.new("message").class.equal?(anonymous).to_s
puts anonymous.new("message").is_a?(RuntimeError).to_s

reported = RuntimeError.new("Some runtime error")
reported.set_backtrace(["a.rb:1", "b.rb:2"])
puts reported.full_message(highlight: false, order: :top)
puts reported.full_message(highlight: false, order: :bottom)

# A class that defines its own `detailed_message` decides how it reads.
custom = Exception.new("new error")
def custom.detailed_message(**)
  "<prefix>#{message}<suffix>"
end
puts custom.detailed_message
puts custom.full_message(highlight: false).include?("<prefix>new error<suffix>").to_s
```

Output:

```
new error (RuntimeError)
unhandled exception
StandardError
new error (RuntimeError)
message
true
true
a.rb:1: Some runtime error (RuntimeError)
	from b.rb:2
Traceback (most recent call last):
	from b.rb:2
a.rb:1: Some runtime error (RuntimeError)
<prefix>new error<suffix>
true
```
