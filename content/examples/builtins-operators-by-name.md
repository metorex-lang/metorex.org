---
title: "builtins/operators_by_name.rb"
slug: builtins-operators-by-name
description: "The metorex example program builtins/operators_by_name.rb and its output."
---

`tests/_examples/builtins/operators_by_name.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/operators_by_name.rb){target=_blank rel=noopener}.

```metorex
# An operator called by name raises what Ruby raises for the pair: a number
# asks the other side to coerce itself, a collection wants one of its own
# kind or an Integer, a value with no such operator has no such method, and
# a comparison that fails names both sides.
def outcome
  yield.inspect
rescue StandardError => error
  "#{error.class}: #{error.message.gsub(/0x\h+/, "X")}"
end

cases = [
  [1, :+, nil], [1, :<<, nil], [1, :&, true], [1, :[], nil], [1.5, :&, true],
  [1.5, :<, :sym], [Rational(1, 2), :+, :sym], [Rational(1, 2), :<, "s"],
  [Rational(1, 2), :|, true], [Complex(1, 2), :+, "s"], [Complex(1, 2), :**, Object.new],
  [Complex(1, 2), :<, 1], [Complex(1, 2), :%, 2], ["s", :+, nil], ["s", :*, nil],
  ["s", :*, "s"], ["s", :[], :sym], ["s", :<<, true], ["s", :=~, "t"], ["s", :=~, [1]],
  ["s", :&, true], [[1], :+, nil], [[1], :-, "s"], [[1], :&, true], [[1], :*, nil],
  [[1], :^, true], [{a: 1}, :<, nil], [{a: 1}, :+, 1], [:sym, :<, :sym], [:sym, :<, 1],
  [:sym, :-@, nil], [:sym, :[], nil], [nil, :+, 1], [true, :<, 1], [Object.new, :-, 1],
  [(1..2), :+, 1], [Time.at(0).utc, :-, "s"], [1, :=~, 1]
]
cases.each do |receiver, operator, argument|
  shown = operator == :-@ ? outcome { receiver.public_send(operator) } : outcome { receiver.public_send(operator, argument) }
  puts("#{receiver.class} #{operator}: #{shown}")
end
p([1, 2.5, "s", [1], nil, :sym, Object.new].map { |value| value.public_send(:!) })
```

Output:

```
Integer +: TypeError: nil can't be coerced into Integer
Integer <<: TypeError: no implicit conversion of nil into Integer
Integer &: TypeError: true can't be coerced into Integer
Integer []: TypeError: no implicit conversion of nil into Integer
Float &: NoMethodError: undefined method '&' for an instance of Float
Float <: ArgumentError: comparison of Float with :sym failed
Rational +: TypeError: :sym can't be coerced into Rational
Rational <: ArgumentError: comparison of Rational with String failed
Rational |: NoMethodError: undefined method '|' for an instance of Rational
Complex +: TypeError: String can't be coerced into Complex
Complex **: TypeError: Object can't be coerced into Complex
Complex <: NoMethodError: undefined method '<' for an instance of Complex
Complex %: NoMethodError: undefined method '%' for an instance of Complex
String +: TypeError: no implicit conversion of nil into String
String *: TypeError: no implicit conversion from nil to integer
String *: TypeError: no implicit conversion of String into Integer
String []: TypeError: no implicit conversion of Symbol into Integer
String <<: TypeError: no implicit conversion of true into String
String =~: TypeError: type mismatch: String given
String =~: NoMethodError: undefined method '=~' for an instance of Array
String &: NoMethodError: undefined method '&' for an instance of String
Array +: TypeError: no implicit conversion of nil into Array
Array -: TypeError: no implicit conversion of String into Array
Array &: TypeError: no implicit conversion of true into Array
Array *: TypeError: no implicit conversion from nil to integer
Array ^: NoMethodError: undefined method '^' for an instance of Array
Hash <: TypeError: no implicit conversion of nil into Hash
Hash +: NoMethodError: undefined method '+' for an instance of Hash
Symbol <: false
Symbol <: ArgumentError: comparison of Symbol with 1 failed
Symbol -@: NoMethodError: undefined method '-@' for an instance of Symbol
Symbol []: TypeError: no implicit conversion from nil to integer
NilClass +: NoMethodError: undefined method '+' for nil
TrueClass <: NoMethodError: undefined method '<' for true
Object -: NoMethodError: undefined method '-' for an instance of Object
Range +: NoMethodError: undefined method '+' for an instance of Range
Time -: TypeError: can't convert String into an exact number
Integer =~: NoMethodError: undefined method '=~' for an instance of Integer
[false, false, false, false, true, false, false]
```
