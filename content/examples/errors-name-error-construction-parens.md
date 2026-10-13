---
title: "errors/name_error/construction_parens.rb"
slug: errors-name-error-construction-parens
description: "The metorex example program errors/name_error/construction_parens.rb and its output."
---

`tests/_examples/errors/name_error/construction_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/name_error/construction_parens.rb){target=_blank rel=noopener}.

```metorex
named = NameError.new("msg", "name")
puts(named.message)
p named.name
begin
  named.receiver
rescue ArgumentError => error
  puts(error.message)
end

symbol_named = NameError.new("msg", :name, receiver: "the receiver")
p symbol_named.name
p symbol_named.receiver

plain = NameError.new("just a message")
puts(plain.message)
p plain.name

class Caller
  def trigger
    missing_helper
  rescue NameError => error
    error
  end
end

caught = Caller.new.trigger
p caught.name
p caught.receiver.class.to_s

copied = caught.dup
p copied.name
p copied.receiver.class.to_s
```

Output:

```
msg
"name"
no receiver is available
:name
"the receiver"
just a message
nil
:missing_helper
"Caller"
:missing_helper
"Caller"
```
