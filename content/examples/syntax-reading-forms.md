---
title: "syntax/reading_forms.rb"
slug: syntax-reading-forms
description: "The metorex example program syntax/reading_forms.rb and its output."
---

`tests/_examples/syntax/reading_forms.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/reading_forms.rb){target=_blank rel=noopener}.

```metorex
# Forms the parser reads: a control-flow keyword used for its value, an empty
# pair of parentheses, a group of statements, percent literals, a call written
# with a leading dot, and a call that steps over a nil receiver.
case 1
when 1 then :matched
end.to_s.tap { |shown| p shown }

unless false then
  :kept
end.to_s.tap { |shown| p shown }

counted = 0
while counted < 3
  counted += 1
end.inspect.tap { |shown| p shown }

p [0, (), 2]
p({() => ()})
p((1; 2; 3))

names = 3
filled_words = %W(a #{names} c)
filled_symbols = %I(a b#{names})
plain_words = %w(x y)
plain_symbols = %i(x y)
raw_text = %q{a#{1}b}
escaped_text = %q(a\(b)

p filled_words
p filled_symbols
p plain_words
p plain_symbols
p raw_text
p escaped_text

p [1, 2, 3]
  .map { |number| number * 2 }
  .select { |number| number > 2 }

p nil&.length
p "hello"&.length
p nil&.map { |item| item }
p [1, 2]&.map { |item| item + 1 }
```

Output:

```
"matched"
"kept"
"nil"
[0, nil, 2]
{nil => nil}
3
["a", "3", "c"]
[:a, :b3]
["x", "y"]
[:x, :y]
"a\#{1}b"
"a(b"
[4, 6]
nil
5
nil
[2, 3]
```
