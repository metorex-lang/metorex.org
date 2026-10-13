---
title: "strings/coercion_and_padding_no_parens.rb"
slug: strings-coercion-and-padding-no-parens
description: "The metorex example program strings/coercion_and_padding_no_parens.rb and its output."
---

`tests/_examples/strings/coercion_and_padding_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/coercion_and_padding_no_parens.rb){target=_blank rel=noopener}.

```metorex
# String#+, #ljust, and #rjust read anything that spells itself as text
# through #to_str, and the padded result carries whichever encoding holds
# both the receiver and the pattern.
class Spelled
  def to_str
    "-spelled"
  end
end

p "held" + Spelled.new
p "ab".ljust(6, Spelled.new)
p "ab".rjust(6, Spelled.new)

begin
  "held" + 42
rescue TypeError => refused
p refused.message
end

begin
  "ab".ljust(6, "")
rescue ArgumentError => refused
p refused.message
end

p "ab".ljust(4.7)
p "abc".ljust(5, "x").encoding

# Array#* joins with a separator the argument names, and repeats when it
# names a count instead.
p [1, 2, 3] * ", "
p [1, 2] * 3
p [1, [2, 3]].join(":")

begin
  [1, 2] * Object.new
rescue TypeError => refused
p refused.message
end
```

Output:

```
"held-spelled"
"ab-spe"
"-speab"
"no implicit conversion of Integer into String"
"zero width padding"
"ab  "
#<Encoding:UTF-8>
"1, 2, 3"
[1, 2, 1, 2, 1, 2]
"1:2:3"
"no implicit conversion of Object into Integer"
```
