---
title: "scanning/substitutions_parens.rb"
slug: scanning-substitutions-parens
description: "The metorex example program scanning/substitutions_parens.rb and its output."
---

`tests/_examples/scanning/substitutions_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/scanning/substitutions_parens.rb){target=_blank rel=noopener}.

```metorex
# `sub` puts something in place of the first match and `gsub` in place of
# every one. A replacement string can name parts of the match, a Hash looks
# one up, and a block decides as it goes.
p "hello".sub("l", "L")
p "hello".gsub("l", "L")
p "hello".gsub(/l+/) { |part| part.upcase }
p "hello".gsub(/(?<letter>l)/, '<\k<letter>>')
p "hello".sub(/(e)(l)/, '\2\1')
p "hello".gsub(/[el]/, { "e" => "3", "l" => "1" })

# A line start is not read past the newline that closes the text.
p "Text\n".gsub(/^/, " ")
p "Text\nFoo".gsub(/^/, " ")

# A pattern on its own answers an Enumerator over the matches.
walk = "abca".gsub(/a/)
p walk.to_a
p walk.size

# The answer takes on the encoding of the first piece holding more than
# ASCII, so a replacement written in bytes decides what the answer is in.
p "hello".gsub(/l/) { 195.chr }.encoding

written = "hello"
written.gsub!(/l/, "y")
p written
p "hello".sub!(/z/, "y")

# The last match the call itself made is the one left behind, whatever the
# block matched while it ran.
"hello".gsub(/l/) { "ok".match(/o/) }
p $~[0]
p $~.string
```

Output:

```
"heLlo"
"heLLo"
"heLLo"
"he<l><l>o"
"hlelo"
"h311o"
" Text\n"
" Text\n Foo"
["a", "a"]
nil
#<Encoding:BINARY (ASCII-8BIT)>
"heyyo"
nil
"l"
"hello"
```
