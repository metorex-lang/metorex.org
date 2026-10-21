---
title: Beyond Ruby
slug: beyond-ruby
description: What Metorex has that MRI does not, each with a sample.
order: 9
aliases: [/beyond-ruby]
---

Metorex has these features MRI does not. Each sample below runs under Metorex and prints the output shown. Under MRI each one stops with a NoMethodError at its first call to a method MRI does not have.

## Assertions

`assert`, `assert_equal`, and `assert_raises` are available in every program, with no library to require. A failed assertion raises a RuntimeError. `assert_equal`'s message names the expected value and the value it got.

```ruby
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

## Finding and Running Test Files

`metorex test DIR` runs each file under DIR, or under `test/` when no directory is named, named `*_test.rb`, `test_*.rb`, or `*_spec.rb`, reports each one as `ok` or `FAIL` with the error that stopped it, and exits with status 1 when one fails. A test file is a program that uses the assertions above.

```sh
metorex test
```

## RSpec with No Gems

[Rex](/docs/rex), the spec framework built into Metorex, runs suites written for RSpec with `metorex spec`, and loads the first time a program names `RSpec`. `metorex spec --coverage` reports the lines and branches that ran, counted by the interpreter.

## Code as Objects

`parse` turns source text into the syntax tree nodes Metorex compiles, and `body`, called on the method `get_source` returns, answers that method's statements as the same nodes. Each node is a hash with a `"type"` key. [Code as objects](/docs/meta) goes through them.

```ruby
def grouped(node)
  case node["type"]
  when "BinaryOp"
    left = grouped(node["left"])
    right = grouped(node["right"])
    "(#{left} #{node["op"]} #{right})"
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
