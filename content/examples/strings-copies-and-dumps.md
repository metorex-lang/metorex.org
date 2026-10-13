---
title: "strings/copies_and_dumps.rb"
slug: strings-copies-and-dumps
description: "The metorex example program strings/copies_and_dumps.rb and its output."
---

`tests/_examples/strings/copies_and_dumps.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/copies_and_dumps.rb){target=_blank rel=noopener}.

```metorex
# A copy of a string holds its own characters, so changing one of them leaves
# the other alone, and a clone keeps the frozen state the original had.
held = "string"[0..100]
copied = held.clone
held[0] = "x"
p(held)
p(copied)
p("x".freeze.clone.frozen?)
p("x".freeze.dup.frozen?)

# A subclass of String copies as one of the same class, seeded with the
# characters its own `initialize` decides on.
class Counted < String
  attr_reader :ivar

  def initialize(other)
    super
    @ivar = 1
  end
end
made = Counted.new("string")
p(made.clone.class)
p(made.clone.ivar)
p(made)

# `dump` writes the escapes Ruby writes, naming a character below 0x80 by its
# byte and one above by its number.
p("\a\b\t\n\v\f\r\e".dump)
p(0.chr.dump)
p("café".dump)
p("\u{10FFFF}".dump)
p("interp #{1} and #@ivar".dump)
```

Output:

```
"xtring"
"string"
true
false
Counted
1
"string"
"\"\\a\\b\\t\\n\\v\\f\\r\\e\""
"\"\\x00\""
"\"caf\\u00E9\""
"\"\\u{10FFFF}\""
"\"interp 1 and \""
```
