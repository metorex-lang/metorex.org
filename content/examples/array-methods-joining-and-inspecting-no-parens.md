---
title: "array_methods/joining_and_inspecting_no_parens.rb"
slug: array-methods-joining-and-inspecting-no-parens
description: "The metorex example program array_methods/joining_and_inspecting_no_parens.rb and its output."
---

`tests/_examples/array_methods/joining_and_inspecting_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/array_methods/joining_and_inspecting_no_parens.rb){target=_blank rel=noopener}.

```metorex
# With no separator, or with nil for one, `$,` says what goes between.
p [1, 2, 3].join
$, = "_"
p [1, 2, 3].join
p [1, 2, 3].join(nil)
$, = nil

# An element is asked for `to_str`, then `to_ary`, then `to_s`, which is the
# order Ruby tries.
class Spells
  def to_str
    nil
  end

  def to_ary
    nil
  end

  def to_s
    "spelled"
  end
end
p [Spells.new].join

# A join is written in the encoding the first piece is written in, widened by
# the first piece that is not all ASCII. Two pieces neither of which is ASCII
# and whose encodings differ cannot be joined at all.
p [].join.encoding
p ["jp".encode("EUC-JP"), "utf8"].join.encoding
begin
  ["\u{3042}", [0xFF].pack("C")].join
rescue EncodingError => refused
  p refused.class.ancestors.include?(EncodingError)
end

# `inspect` asks what an element's own `inspect` answered for its `to_s` when
# that answer is no String, and never asks either one for `to_str`.
class Answers
  def inspect
    self
  end

  def to_s
    "answered"
  end
end
p [Answers.new].inspect

# A symbol key prints without quotes only where it is named plainly enough to
# read back that way.
p({ a: 1, a!: 1, a?: 1 })
p({ "needs-quotes": 1 })
p({ "": 1 })
```

Output:

```
"123"
"1_2_3"
"1_2_3"
"spelled"
#<Encoding:US-ASCII>
#<Encoding:EUC-JP>
true
"[answered]"
{a: 1, a!: 1, a?: 1}
{"needs-quotes": 1}
{"": 1}
```
