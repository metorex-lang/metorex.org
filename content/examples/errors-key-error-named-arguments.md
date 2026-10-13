---
title: "errors/key_error/named_arguments.rb"
slug: errors-key-error-named-arguments
description: "The metorex example program errors/key_error/named_arguments.rb and its output."
---

`tests/_examples/errors/key_error/named_arguments.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/key_error/named_arguments.rb).

```metorex
error = KeyError.new receiver: "lookup source", key: :b
p error.receiver
p error.key
puts error.message

described = KeyError.new "key not found: :b", receiver: "lookup source", key: :b
puts described.message
p described.key

plain = KeyError.new "no lookup recorded"
begin
  plain.key
rescue ArgumentError => error
  puts error.message
end
begin
  plain.receiver
rescue ArgumentError => error
  puts error.message
end

frozen = FrozenError.new "can't modify", receiver: "text"
p frozen.receiver
puts frozen.message
```

Output:

```
"lookup source"
:b
KeyError
key not found: :b
:b
no key is available
no receiver is available
"text"
can't modify
```
