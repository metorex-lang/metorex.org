---
title: "io/stderr_wrapper_answers_write_through_method_missing.rb"
slug: io-stderr-wrapper-answers-write-through-method-missing
description: "The metorex example program io/stderr_wrapper_answers_write_through_method_missing.rb and its output."
---

`tests/_examples/io/stderr_wrapper_answers_write_through_method_missing.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/io/stderr_wrapper_answers_write_through_method_missing.rb){target=_blank rel=noopener}.

```metorex
class StreamWrapper
  def initialize(stream)
    @stream = stream
  end

  def method_missing(name, *arguments, &block)
    @stream.__send__(name, *arguments, &block)
  end

  def respond_to_missing?(name, include_private = false)
    @stream.respond_to?(name, include_private) || super
  end
end

original = $stderr
$stderr = StreamWrapper.new($stdout)
$stderr.write("written through the wrapper\n")
$stderr = original

begin
  $stderr = Class.new.new
rescue TypeError => error
  puts error.message.sub(/0x\h+/, "0x")
end
```

Output:

```
written through the wrapper
$stderr must have write method, #<Class:0x> given
```
