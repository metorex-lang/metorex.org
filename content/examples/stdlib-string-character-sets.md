---
title: "stdlib/string/character_sets.rb"
slug: stdlib-string-character-sets
description: "The metorex example program stdlib/string/character_sets.rb and its output."
---

`tests/_examples/stdlib/string/character_sets.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/string/character_sets.rb){target=_blank rel=noopener}.

```metorex
# The methods that read a set of characters the way `tr` writes one: a range
# with a dash, a leading `^` for every character but those.
p("hello".count("lo"))
p("hello".count("lo", "o"))
p("hello".count("^l"))
p("hello world".delete("l"))
p("aaabbbccc".squeeze)
p("aaabbbccc".squeeze("a"))
p("hello".tr("el", "ip"))
p("hello".tr("a-y", "b-z"))
p("hello".tr("^aeiou", "*"))
p("hello".tr_s("l", "r"))

begin
  "hello".count("h-e")
rescue ArgumentError => problem
  p(problem.message)
end

# Cutting a string apart, and reading what it holds.
p("hello\n".chop)
p("hello\r\n".chop)
p("hello".delete_prefix("he"))
p("hello".delete_suffix("lo"))
p("hello".partition("l"))
p("hello".rpartition("l"))
p("hello".partition(/l+/))
p("hello".intern)
p("abc".sum)
p("abc".sum(4))
p("hi".center(9))
p("hi".center(9, "12"))
p("abc".casecmp("ABC"))
p("abc".casecmp?("ABC"))
p("abc".casecmp(1))
p(String.try_convert("x"))
p(String.try_convert(Object.new))

# `upto` walks from one string to another, stepping by code point when both
# are a single character.
p("a".upto("e").to_a)
p("9".upto("A").to_a)
p("8".upto("11").to_a)
p("a".upto("d", true).to_a)
p("5".upto("2").to_a)
```

Output:

```
3
1
3
"heo word"
"abc"
"abbbccc"
"hippo"
"ifmmp"
"*e**o"
"hero"
"invalid range \"h-e\" in string transliteration"
"hello"
"hello"
"llo"
"hel"
["he", "l", "lo"]
["hel", "l", "o"]
["he", "ll", "o"]
:hello
294
6
"   hi    "
"121hi1212"
0
true
nil
"x"
nil
["a", "b", "c", "d", "e"]
["9", ":", ";", "<", "=", ">", "?", "@", "A"]
["8", "9", "10", "11"]
["a", "b", "c"]
[]
```
