---
title: "errors/exception_method/copies.rb"
slug: errors-exception-method-copies
description: "The metorex example program errors/exception_method/copies.rb and its output."
---

`tests/_examples/errors/exception_method/copies.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/exception_method/copies.rb){target=_blank rel=noopener}.

```metorex
# `Exception#exception` answers self with no argument, and otherwise a copy
# carrying the new message. The copy is not re-initialized, so a subclass
# keeps the state it set. `Exception.exception` is another name for `new`.

original = RuntimeError.new("first")
puts original.equal?(original.exception).to_s
puts original.equal?(original.exception(original)).to_s

renamed = original.exception("second")
puts renamed.class.to_s
puts renamed.message
puts original.message
puts renamed.equal?(original).to_s

class Tagged < StandardError
  attr_reader :tag

  def initialize(tag)
    @tag = tag
  end
end

tagged = Tagged.new(:boom)
copy = tagged.exception("message")
puts copy.class.to_s
puts copy.tag.inspect
puts copy.message

# The class-level form builds one the way `new` does.
puts Exception.exception("built").message
puts Exception.exception.message
puts RuntimeError.exception.class.to_s

# An exception built with no message reports its class name; one built with an
# empty message reports that.
puts RuntimeError.new.message
puts RuntimeError.new("").message.inspect

# An exception and an exception class both answer to `exception`.
puts RuntimeError.new.respond_to?(:exception).to_s
puts RuntimeError.respond_to?(:exception).to_s
```

Output:

```
true
true
RuntimeError
second
first
false
Tagged
:boom
message
built
Exception
RuntimeError
RuntimeError
""
true
true
```
