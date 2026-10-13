---
title: "signals/signame_parens.rb"
slug: signals-signame-parens
description: "The metorex example program signals/signame_parens.rb and its output."
---

`tests/_examples/signals/signame_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/signals/signame_parens.rb){target=_blank rel=noopener}.

```metorex
# `Signal.signame` answers the name a number goes by, and nil for a number no
# signal uses.
puts(Signal.signame(0))
puts(Signal.signame(Signal.list["TERM"]))
p(Signal.signame(-1))

# The name a signal goes by wins over the older spelling of it.
puts(Signal.signame(Signal.list["ABRT"]))
puts(Signal.signame(Signal.list["CHLD"]))

# `Signal.list` carries CLD alongside CHLD, at the same number.
puts(Signal.list["CLD"] == Signal.list["CHLD"])

# Anything but an Integer is asked for `to_int`.
class SignalNumber
  def to_int
    0
  end
end

puts(Signal.signame(SignalNumber.new))

begin
  Signal.signame("hello")
rescue TypeError => error
  puts(error.message)
end

class NotANumber
  def to_int
    "not an int"
  end
end

begin
  Signal.signame(NotANumber.new)
rescue TypeError => error
  puts(error.message)
end
```

Output:

```
EXIT
TERM
nil
ABRT
CHLD
true
EXIT
no implicit conversion of String into Integer
can't convert NotANumber to Integer (NotANumber#to_int gives String)
```
