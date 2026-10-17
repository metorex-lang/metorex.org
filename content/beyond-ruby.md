---
title: Beyond Ruby
slug: beyond-ruby
description: What Metorex has that MRI does not, each with a sample, and the features the metorex README lists that are not built yet.
layout: page
---

Metorex runs Ruby, and it has a few features MRI does not. Each sample below runs under Metorex and prints the output shown. Under MRI 4.0.6 each one stops at its first line with a NoMethodError.

## Assertions

`assert`, `assert_equal`, and `assert_raises` are available in every program, with no library to require. A failed assertion raises a RuntimeError naming what was expected and what came instead.

```metorex
assert(3.between?(1, 5))
assert_equal(4, 2 + 2)
assert_raises { Integer("four") }

begin
  assert_equal(5, [2, 2].sum)
rescue RuntimeError => failure
  puts failure.message
end
```

```
Expected 5, got 4
```

## Finding and running test files

`metorex --test DIR` runs each file under DIR named `*_test.rb`, `test_*.rb`, or `*_spec.rb`, reports each one as `ok` or `FAIL` with the error that stopped it, and exits with status 1 when one fails. A test file is a program that uses the assertions above.

```sh
metorex --test test
```

## RSpec with no gems

[Rex](/rex), the spec framework built into Metorex, runs suites written for RSpec 3.13 with `metorex spec`, and loads the first time a program names `RSpec`. `metorex spec --coverage` reports the lines and branches that ran, counted by the interpreter.

## Code as objects

`parse` turns source text into the syntax tree nodes Metorex compiles, and `body`, called on the method `get_source` returns, answers that method's statements as the same nodes. Each node is a hash with a `"type"` key. [Code as objects](/meta) goes through them.

```metorex
def grouped(node)
  case node["type"]
  when "BinaryOp" then "(#{grouped(node["left"])} #{node["op"]} #{grouped(node["right"])})"
  when "Grouped" then grouped(node["expression"])
  when "IntLiteral" then node["value"].to_s
  when "Identifier" then node["name"]
  end
end

puts grouped(parse("rate * hours + 40").first)
puts grouped(parse("rate * (hours + 40)").first)
```

```
((rate * hours) + 40)
(rate * (hours + 40))
```

## Listed in the README, not built yet

The [metorex README](https://github.com/metorex-lang/metorex#readme){target=_blank rel=noopener} lists these, and Metorex does not have them yet:

- Traits. A module included in a class is a Ruby module and nothing more.
- Optional static typing and type inference.
- The `Deque`, `PriorityQueue`, and `TreeMap` collections.
- Channels, async and await, and atomics.
- MessagePack serialization.
- A JIT compiler, a language server, a debugger of its own, and a linter or formatter.

The samples on this page are `tests/_examples/site/beyond_assertions.rb` and `beyond_parse.rb` in the [metorex repository](https://github.com/metorex-lang/metorex){target=_blank rel=noopener}, where the test suite checks their output.
