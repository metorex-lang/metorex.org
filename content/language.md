---
title: Language tour
slug: language
description: A tour of Metorex through classes, blocks, Struct and Data, Enumerable, pattern matching, and exceptions, each sample shown with its output.
layout: page
---

Metorex runs Ruby. Each sample below runs under Metorex and prints the output shown under it, which matches MRI 4.0.6 for the same file. [Differences from MRI](/ruby-differences) lists the places where the two answer differently.

## Classes

Classes, inheritance, `attr_reader`, keyword arguments, `super`, and one-line `def`.

```metorex
class Account
  attr_reader :owner, :balance

  def initialize(owner, balance = 0)
    @owner = owner
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
    self
  end

  def to_s = "#{owner}: $#{balance}"
end

class SavingsAccount < Account
  def initialize(owner, balance = 0, rate:)
    super(owner, balance)
    @rate = rate
  end

  def add_interest = deposit(balance * @rate)
end

savings = SavingsAccount.new("Ada", 1000, rate: 0.05)
savings.deposit(500).add_interest
puts savings
p savings.is_a?(Account)
p SavingsAccount.ancestors.take(3)
```

```
Ada: $1575.0
true
[SavingsAccount, Account, Object]
```

## Blocks, procs, and lambdas

A method that yields and returns an enumerator without a block, lambdas, procs, composition with `>>`, and `&:symbol`.

```metorex
def each_pair_of(items)
  return enum_for(:each_pair_of, items) unless block_given?

  items.each_cons(2) { |first, second| yield first, second }
end

each_pair_of([1, 4, 9]) { |a, b| puts "#{a} -> #{b}" }
p each_pair_of(%w[a b c]).to_a

square = ->(n) { n * n }
add_one = proc { |n| n + 1 }
p [1, 2, 3].map(&square)
p (square >> add_one).call(4)
p %w[apple banana].map(&:upcase)
```

```
1 -> 4
4 -> 9
[["a", "b"], ["b", "c"]]
[1, 4, 9]
17
["APPLE", "BANANA"]
```

## Struct and Data

`Struct` builds a mutable value class with methods. `Data` builds an immutable one, and `with` copies it with changes.

```metorex
Point = Struct.new(:x, :y) do
  def distance_to(other)
    Math.sqrt((x - other.x)**2 + (y - other.y)**2)
  end
end

a = Point.new(0, 0)
b = Point.new(3, 4)
p a.distance_to(b)
p b.to_a
p b == Point.new(3, 4)

Coordinate = Data.define(:latitude, :longitude)
here = Coordinate.new(latitude: 36.16, longitude: -86.78)
p here
p here.with(latitude: 40.71)
```

```
5.0
[3, 4]
true
#<data Coordinate latitude=36.16, longitude=-86.78>
#<data Coordinate latitude=40.71, longitude=-86.78>
```

## Enumerable

`sum`, `max_by`, `partition`, `group_by`, a lazy infinite range, and `it` for a block's one argument.

```metorex
orders = [
  { item: "keyboard", price: 85, quantity: 2 },
  { item: "monitor", price: 240, quantity: 1 },
  { item: "cable", price: 9, quantity: 6 },
]

p orders.sum { it[:price] * it[:quantity] }
p orders.max_by { it[:price] }[:item]
p orders.partition { it[:price] > 50 }.map(&:size)
p orders.group_by { it[:quantity] > 1 }.transform_values { |group| group.map { it[:item] } }
p (1..Float::INFINITY).lazy.select(&:even?).map { it * it }.first(3)
p %w[a b c].each_with_index.to_h
```

```
464
"monitor"
[2, 1]
{true => ["keyboard", "cable"], false => ["monitor"]}
[4, 16, 36]
{"a" => 0, "b" => 1, "c" => 2}
```

## Pattern matching

`case`/`in` with nested hashes, array splats, ranges, bindings, and guards, plus rightward assignment with `=>`.

```metorex
def describe(response)
  case response
  in { status: 200, body: { users: [] } }
    "no users"
  in { status: 200, body: { users: [{ name: String => name }, *rest] } }
    "#{name} and #{rest.size} more"
  in { status: 400..499 => code }
    "client error #{code}"
  in { status: Integer => code } if code >= 500
    "server error #{code}"
  end
end

puts describe({ status: 200, body: { users: [] } })
puts describe({ status: 200, body: { users: [{ name: "Ada" }, { name: "Grace" }] } })
puts describe({ status: 404 })
puts describe({ status: 503 })

config = { db: { host: "localhost", port: 5432 } }
config => { db: { port: } }
p port
```

```
no users
Ada and 1 more
client error 404
server error 503
5432
```

## Exceptions

A custom exception class, `rescue` with `retry`, `ensure`, and a method-level `rescue`.

```metorex
class PaymentError < StandardError
  def initialize(amount)
    super("payment of #{amount} declined")
  end
end

def charge(amount)
  raise PaymentError.new(amount) if amount > 100
  "charged #{amount}"
end

attempts = 0
begin
  attempts += 1
  puts charge(150 - attempts * 30)
rescue PaymentError => error
  puts "#{error.message} (attempt #{attempts})"
  retry if attempts < 3
ensure
  puts "done after #{attempts} attempts"
end

def parse_port(text)
  Integer(text)
rescue ArgumentError
  nil
end

p parse_port("8080")
p parse_port("eighty")
```

```
payment of 120 declined (attempt 1)
charged 90
done after 2 attempts
8080
nil
```

These samples are `tests/_examples/site/language_*.rb` in the [metorex repository](https://github.com/metorex-lang/metorex), where the test suite checks their output.
