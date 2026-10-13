---
title: "syntax/assignment_order_no_parens.rb"
slug: syntax-assignment-order-no-parens
description: "The metorex example program syntax/assignment_order_no_parens.rb and its output."
---

`tests/_examples/syntax/assignment_order_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/assignment_order_no_parens.rb).

```metorex
# Assignment evaluates the receiver, subscripts, and namespace of each target
# before the right-hand side, and a compound assignment reads and writes
# through one evaluation of the receiver. Written with as few parentheses as
# Ruby allows.

class Recorder
  attr_reader :log

  def initialize
    @log = []
  end

  def note(step, value)
    @log << step
    value
  end
end

class Box
  attr_accessor :count

  def initialize
    @slots = {}
  end

  def [](key)
    @slots[key]
  end

  def []=(key, value)
    @slots[key] = value
  end
end

module Settings
  LIMIT = 1
end

recorder = Recorder.new
box = Box.new
recorder.note(:receiver, box).count = recorder.note(:value, 1)
p recorder.log

recorder = Recorder.new
recorder.note(:receiver, box)[recorder.note(:key, :a)] = recorder.note(:value, 2)
p recorder.log

recorder = Recorder.new
recorder.note(:namespace, Settings)::WIDTH = recorder.note(:value, 80)
p recorder.log
p Settings::WIDTH

recorder = Recorder.new
recorder.note(:a, box).count, recorder.note(:b, box)[:b] = recorder.note(:c, 3), recorder.note(:d, 4)
p recorder.log

recorder = Recorder.new
(recorder.note(:a, box).count, _rest), _tail = [recorder.note(:b, 5)]
p recorder.log
p box.count

recorder = Recorder.new
box.count = 1
recorder.note(:receiver, box).count += 2
p recorder.log
p box.count

recorder = Recorder.new
box[:k] = 10
recorder.note(:receiver, box)[recorder.note(:key, :k)] += 5
p recorder.log
p box[:k]

recorder = Recorder.new
$VERBOSE = nil
recorder.note(:namespace, Settings)::LIMIT += 1
p recorder.log
p Settings::LIMIT

box.count = nil
box.count ||= 7
box.count ||= 8
p box.count
box.count &&= 9
p box.count
box.count = [1]
box.count <<= 2
p box.count

Settings::DEPTH ||= 4
p Settings::DEPTH

target = nil
p target&.count = recorder.note(:unreached, 1)
p target&.count += 1

single = Object.new
def single.[]=(key, value)
  puts "single #{key} #{value}"
end
single[:x] = 1

begin
  (:not_a_module)::A = 1
rescue TypeError => error
  p error.message
end

class Guarded
  def initialize
    @amount = 0
  end

  def bump
    self.amount += 1
  end

  private

  attr_accessor :amount
end

guarded = Guarded.new
p guarded.bump
begin
  guarded.amount += 1
rescue NoMethodError => error
  p error.class
end

holder = Box.new
block = proc {}
begin
  eval "holder[:a, &block] = 1"
rescue SyntaxError => error
  p error.message.include?("block arg given in index assignment")
end
begin
  eval "holder[1, b: 2] += 1"
rescue SyntaxError => error
  p error.message.include?("keyword arg given in index assignment")
end

class << Settings
  attr_accessor :level
end
Settings.level = 1
Settings.level += 1
p Settings.level

absent = nil
begin
  raise ArgumentError, "bad width"
rescue => absent&.error
  p absent
end

begin
  eval "box.fetch(1) = 2"
rescue SyntaxError
  p SyntaxError
end
```

Output:

```
[:receiver, :value]
[:receiver, :key, :value]
[:namespace, :value]
80
[:a, :b, :c, :d]
[:a, :b]
5
[:receiver]
3
[:receiver, :key]
15
[:namespace]
2
7
9
[1, 2]
4
nil
nil
single x 1
":not_a_module is not a class/module"
1
NoMethodError
true
true
2
nil
SyntaxError
```
