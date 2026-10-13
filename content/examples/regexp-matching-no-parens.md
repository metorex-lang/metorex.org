---
title: "regexp/matching_no_parens.rb"
slug: regexp-matching-no-parens
description: "The metorex example program regexp/matching_no_parens.rb and its output."
---

`tests/_examples/regexp/matching_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/regexp/matching_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A match answers a MatchData, which carries the whole match, the captures,
# and where each one sat in the subject.
data = /(\w+)\s+(\w+)/.match("hello there world")

p data.class
p data[0]
p data[1]
p data[2]
p data.captures
p data.to_a
p data.pre_match
p data.post_match
p data.begin 0
p data.end 0
p data.offset 2
p data.size
p data.to_s
p data.match 1
p data.match_length 1
p data.values_at 0, 2, 5
p data.string

# A named group is reached by its name, and once a pattern names any group
# the unnamed ones stop capturing.
named = /(?<greeting>\w+)\s+(\w+)/.match("hello there")
p named[:greeting]
p named["greeting"]
p named.names
p named.named_captures
p named.captures
p named.inspect

# A subscript past the end answers nil, while begin and end refuse it.
p data[9]
begin
  data.begin 9
rescue IndexError => error
  p error.message
end

# The last match is what $~, $1, $&, and Regexp.last_match all read.
"the quick fox" =~ /the (\w+)/
p $~[0]
p $1
p $&
p $~.pre_match
p Regexp.last_match 1

# A pattern that does not match clears the last match.
"nothing here" =~ /zzz/
p $~
p $1

# Regexp answers its own source and options, and builds from a String.
p(/ab+c/i.source)
p(/ab+c/i.options)
p(/ab+c/i.casefold?)
p Regexp.new("ab").match("xaby")[0]
p Regexp.union("cat", "dog").source
p(/a/ == /a/)
p(/a/.class)

# A Range and a Regexp both answer === the way a case branch asks them to.
p((3..7) === 5)
p(/ll/ === "hello")
p [1, 4, 9].grep 3..7
p ["apple", "grape"].grep(/pp/)
p ["apple", "grape"].grep_v(/pp/)
```

Output:

```
MatchData
"hello there"
"hello"
"there"
["hello", "there"]
["hello there", "hello", "there"]
""
" world"
0
11
[6, 11]
3
"hello there"
"hello"
5
["hello there", "there", nil]
"hello there world"
"hello"
"hello"
["greeting"]
{"greeting" => "hello"}
["hello"]
"#<MatchData \"hello there\" greeting:\"hello\">"
nil
"index 9 out of matches"
"the quick"
"quick"
"the quick"
""
"quick"
nil
nil
"ab+c"
1
true
"ab"
"cat|dog"
true
Regexp
true
true
[4]
["apple"]
["grape"]
```
