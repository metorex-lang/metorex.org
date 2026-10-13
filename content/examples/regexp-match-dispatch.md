---
title: "regexp/match_dispatch.rb"
slug: regexp-match-dispatch
description: "The metorex example program regexp/match_dispatch.rb and its output."
---

`tests/_examples/regexp/match_dispatch.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/regexp/match_dispatch.rb).

```metorex
# A string matched against another string refuses outright, and one matched
# against anything else hands the match to that object.
begin
  "some string" =~ "another string"
rescue TypeError => refused
  puts refused.message
end

class Matcher
  def =~(other)
    "matched #{other}"
  end
end
puts("w00t" =~ Matcher.new)

# `match` reads a pattern written as anything that answers to_str.
class Pattern
  def to_str
    "l+"
  end
end
puts "hello".match(Pattern.new)[0]

# A pattern carrying a `match` of its own answers for the string.
pattern = /./.dup
def pattern.match(subject)
  "asked #{subject}"
end
puts "hello".match(pattern)
puts pattern.match("hello")
```

Output:

```
type mismatch: String given
matched w00t
ll
asked hello
asked hello
```
