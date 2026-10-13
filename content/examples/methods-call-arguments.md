---
title: "methods/call_arguments.rb"
slug: methods-call-arguments
description: "The metorex example program methods/call_arguments.rb and its output."
---

`tests/_examples/methods/call_arguments.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/call_arguments.rb){target=_blank rel=noopener}.

```metorex
# How a call hands over its arguments: a splat asks for `to_a`, keywords
# keep keys that are not Symbols and the order they were written in, `**nil`
# refuses keywords, and a space before the parentheses makes them one
# argument.

def gather(*values)
  values
end

class Refuses
  def to_a
    1
  end
end
begin
  gather(*Refuses.new)
rescue TypeError => error
  p(error.message)
end

class Declines
  def to_a
    nil
  end
end
p(gather(*Declines.new).first.class)

def options(**given)
  given
end
p(options("name" => 1, size: 2))
p(options(**{a: 1, b: 2}, **{a: 4, c: 7}))

def required_and_rest(a:, **rest)
  [a, rest]
end
p(required_and_rest("a" => 1, a: 1, b: 2))

def takes_no_keywords(value, **nil)
  value
end
p(takes_no_keywords({a: 1}))
begin
  takes_no_keywords(a: 1)
rescue ArgumentError => error
  p(error.message)
end

p(gather ())
p(gather ((0; 1)), ((2; 3)))
begin
  eval("gather (1, 2)")
rescue SyntaxError
  p(SyntaxError)
end

def pair(first:, second:)
  [first, second]
end
first = 1
second = 2
p(pair first:, second:)
```

Output:

```
"can't convert Refuses to Array (Refuses#to_a gives Integer)"
Declines
{"name" => 1, size: 2}
{a: 4, b: 2, c: 7}
[1, {"a" => 1, b: 2}]
{a: 1}
"no keywords accepted"
[nil]
[1, 3]
SyntaxError
[1, 2]
```
