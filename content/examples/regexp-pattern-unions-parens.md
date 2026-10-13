---
title: "regexp/pattern_unions_parens.rb"
slug: regexp-pattern-unions-parens
description: "The metorex example program regexp/pattern_unions_parens.rb and its output."
---

`tests/_examples/regexp/pattern_unions_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/regexp/pattern_unions_parens.rb).

```metorex
# `Regexp.union` matches any of what it is given. A String is quoted, a
# Regexp keeps its own options by being written as `(?flags:source)`, and
# nothing at all matches nothing.
p(Regexp.union())
p(Regexp.union("n", "."))
p(Regexp.union(/dogs/, /cats/i))
p(Regexp.union([/dogs/, /cats/i]))
p(Regexp.union(:foo))

# One Regexp is answered as it stands.
held = /held/m
p(Regexp.union(held).equal?(held))

# An object is read through `to_regexp` when it is the only pattern, and
# through `to_str` otherwise.
class Pattern
  def to_regexp() = /from_regexp/
  def to_str() = "from_str"
end
p(Regexp.union(Pattern.new()))
p(Regexp.union(Pattern.new(), "bar"))

# The union takes the encoding of the patterns that need one, and is US-ASCII
# when every pattern is ASCII.
p(Regexp.union("a", "b".encode("SJIS")).encoding())
p(Regexp.union("©".encode("ISO-8859-1"), "a").encoding())
p(Regexp.union("a".encode("UTF-16LE")).encoding())
p(Regexp.union(/abc/, /[\x80-\xBF]/n).encoding())
p(Regexp.union(/probl[éeè]me/i, /help/i).encoding())

# Patterns whose encodings cannot be read together are refused.
def refusal()
  yield()
rescue StandardError => problem
  [problem.class(), problem.message()]
end

p(refusal() { Regexp.union("a".encode("UTF-16LE"), "b".encode("UTF-16BE")) })
p(refusal() { Regexp.union("©".encode("ISO-8859-1"), Regexp.new("a", Regexp::FIXEDENCODING)) })
p(refusal() { Regexp.union("a".encode("UTF-16LE"), "b") })
p(refusal() { Regexp.union(["a"], ["b"]) })
```

Output:

```
/(?!)/
/n|\./
/(?-mix:dogs)|(?i-mx:cats)/
/(?-mix:dogs)|(?i-mx:cats)/
/foo/
true
/from_regexp/
/(?-mix:from_regexp)|bar/
#<Encoding:US-ASCII>
#<Encoding:ISO-8859-1>
#<Encoding:UTF-16LE>
#<Encoding:BINARY (ASCII-8BIT)>
#<Encoding:UTF-8>
[ArgumentError, "incompatible encodings: UTF-16LE and UTF-16BE"]
[ArgumentError, "incompatible encodings: ISO-8859-1 and UTF-8"]
[ArgumentError, "ASCII incompatible encoding: UTF-16LE"]
[TypeError, "no implicit conversion of Array into String"]
```
