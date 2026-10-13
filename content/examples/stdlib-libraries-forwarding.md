---
title: "stdlib_libraries/forwarding.rb"
slug: stdlib-libraries-forwarding
description: "The metorex example program stdlib_libraries/forwarding.rb and its output."
---

`tests/_examples/stdlib_libraries/forwarding.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/forwarding.rb){target=_blank rel=noopener}.

```metorex
# Forwardable hands a call on to whatever an accessor names: an instance
# variable, a method, or an expression written as a String.
require("forwardable")

# The warning about a private method is written where the output can be
# read with the rest.
$stderr = $stdout

class Line
  extend(Forwardable)
  attr_reader(:items)

  def initialize
    @items = []
    @log = []
  end

  def_delegators(:@items, :size, :<<, :first, :each, :__send__)
  def_delegator(:@items, :shift, :dequeue)
  def_delegator(:items, :last)
  def_delegator("@items.first", :to_s, :first_text)
  delegate([:push, :empty?] => :@items, :clear => :@log)
  instance_delegate(:length => :items)
  include Enumerable
end

line = Line.new
line << 3 << 5
p(line.size, line.first, line.last, line.length)
p(line.dequeue, line.first_text)
line.push(9)
p(line.map { |held| held * 2 })
p(line.empty?)
p(Line.instance_method(:size).owner)
p(Line.public_method_defined?(:dequeue))
p(Line.method_defined?(:__send__))
p(Line.instance_method(:size).arity)
p(Line.def_delegator(:@items, :count))
p(Line.def_delegators(:@items, :min, :max))

class Secretive
  def initialize = @inner = Inner.new
  class Inner
    private def hidden = :reached
  end
  extend(Forwardable)
  def_delegator(:@inner, :hidden)
end
p(Secretive.new.hidden)

settings = { "a" => 1 }
settings.extend(SingleForwardable)
settings.def_delegator(:itself, :keys, :names)
p(settings.names)
printer = Object.new
printer.extend(SingleForwardable)
printer.def_delegators(:$stdout, :puts)
printer.delegate([:write] => :$stdout)
printer.puts("through stdout")
p(Forwardable::VERSION)
p(Forwardable.debug)
```

Output:

```
2
3
5
2
3
"5"
[10, 18]
false
Line
true
true
-1
:count
[:min, :max]
tests/_examples/stdlib_libraries/forwarding.rb:49: warning: Secretive#hidden at tests/_examples/stdlib_libraries/forwarding.rb:47 forwarding to private method Secretive::Inner#hidden
:reached
["a"]
through stdout
"1.4.0"
nil
```
