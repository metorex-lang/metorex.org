---
title: "callables/blocks_and_methods.rb"
slug: callables-blocks-and-methods
description: "The metorex example program callables/blocks_and_methods.rb and its output."
---

`tests/_examples/callables/blocks_and_methods.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/callables/blocks_and_methods.rb){target=_blank rel=noopener}.

```metorex
pair = proc { |(a, b)| [a, b] }
p pair.call([1, 2])
p pair.call(3)

labeled = proc { |x, (y, z)| [x, y, z] }
p labeled.call(1, [2, 3])

defaulted = proc { |x: 5| x }
p defaulted.call
p defaulted.call(x: 9)

symbolic = proc { |x: :fallback| x }
p symbolic.call

[[1, 2], [3, 4]].each { |(a, b)| p [a, b] }

taking_block = -> &b { b.call }
p taking_block.call { 7 }

adder = -> a, b { a + b }
p adder.call(1, 2)

def keyword_reader(**options)
  options
end
p keyword_reader(lambda: true, if: 1, class: 2)

class Greeter
  def hello(name)
    "hi #{name}"
  end
  alias greet hello
end

greeting = Greeter.new.method(:greet)
p greeting.name
p greeting.original_name
p greeting.call("ada")
p greeting.receiver.class.to_s
p greeting.owner.to_s

plus = 1.method(:+)
p plus.call(2)
p plus.name

counting = 1.upto(3)
p counting.class.to_s
p counting.next
p counting.next
p counting.to_a

holder = Object.new
def holder.multi
  yield :a
  yield :b1, :b2
end
walked = holder.to_enum(:multi)
p walked.next_values
p walked.peek_values

p (1..10).first(3)
p (1..10).last(3)
p (1..10).min
p (1...10).max
p (1..10).size
p (1..).size
p (1..10).cover?(5)
p (1..10).cover?(2..4)
p (1..5).overlap?(4..8)
p (1..5).overlap?(6..8)
p ('a'..'e').include?("c")
p (1..4).to_set.size
p (1..4).reverse_each.to_a

p "  padded  ".lstrip
p "  padded  ".rstrip
p "a\nb\n".lines
p [1, 2, 2].to_set.size
```

Output:

```
[1, 2]
[3, nil]
[1, 2, 3]
5
9
:fallback
[1, 2]
[3, 4]
7
3
{lambda: true, if: 1, class: 2}
:greet
:hello
"hi ada"
"Greeter"
"Greeter"
3
:+
"Enumerator"
1
2
[1, 2, 3]
[:a]
[:b1, :b2]
[1, 2, 3]
[8, 9, 10]
1
9
10
Infinity
true
true
true
false
true
4
[4, 3, 2, 1]
"padded  "
"  padded"
["a\n", "b\n"]
2
```
