---
title: "ractors/isolating_a_ractor_no_parens.rb"
slug: ractors-isolating-a-ractor-no-parens
description: "The metorex example program ractors/isolating_a_ractor_no_parens.rb and its output."
---

`tests/_examples/ractors/isolating_a_ractor_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/ractors/isolating_a_ractor_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A Ractor other than the main one may not reach the main program's locals,
# its globals, its class variables, or a constant holding an object that is
# not shareable. `Ractor.make_shareable` freezes an object and everything it
# refers to so any Ractor may hold it.

Warning[:experimental] = false
Thread.report_on_exception = false

def attempt
  yield
rescue Exception => trouble
  [trouble.class, trouble.message.gsub(/0x\h+/, "ADDRESS").sub(/ \S+\.rb:\d+/, " WRITTEN_AT")]
end

first = 1
second = 2
p attempt { Ractor.new { first + second } }
p attempt { Ractor.new { first = 5 } }
p Ractor.new { counted = 1; [1].map { |step| step + counted } }.value
p Ractor.new { [1].map { |first| first } }.value

$setting = 1
class Box
  @@count = 1
  def self.count = @@count
  LIST = [1, 2]
  FROZEN = [1, 2].freeze
  def self.list = LIST
end

class SmallBox < Box
  def self.inherited_list = LIST
end
LIST = [3]

reached = Ractor.new do
  [
    attempt { $setting },
    attempt { $setting = 2 },
    attempt { $stdout.class },
    attempt { $0 },
    attempt { Box.count },
    attempt { Box::LIST },
    attempt { Box.list },
    attempt { SmallBox.inherited_list },
    attempt { Box::FROZEN },
    attempt { LIST },
    attempt { ::LIST },
    attempt { Box.const_set(:ADDED, []) }
  ]
end
reached.value.each { |line| p line }

p [1, :a, nil, 1.5, String, "text".freeze, 1..2].map { |held| Ractor.shareable?(held) }
p [+"text", [1, +"x"].freeze, Object.new].map { |held| Ractor.shareable?(held) }

nested = [1, [+"deep", { key: +"value" }], +"top"]
p Ractor.make_shareable(nested).equal?(nested)
p [nested.frozen?, nested[1].frozen?, nested[1][0].frozen?, nested[1][1][:key].frozen?]
p Ractor.shareable?(nested)

original = [+"x"]
copied = Ractor.make_shareable(original, copy: true)
p [copied.equal?(original), original.frozen?, copied.frozen?]

p attempt { Ractor.make_shareable(proc { 1 }) }
text = +"open"
p attempt { Ractor.make_shareable(nil.instance_eval { proc { text } }) }
count = 1
p attempt { Ractor.make_shareable(nil.instance_eval { proc { count = 2 } }) }
p attempt { Ractor.make_shareable(nil.instance_eval { proc { count + 1 } }) }
base = 1
summed = Ractor.make_shareable(nil.instance_eval { proc { base + 1 } })
p [summed.call, summed.frozen?, Ractor.shareable?(summed), Ractor.shareable?(proc { 1 })]

shared = Ractor.shareable_proc { 1 + 2 }
p [shared.call, Ractor.shareable?(shared)]
shared_lambda = Ractor.shareable_lambda { 3 }
p [shared_lambda.lambda?, shared_lambda.call]
p attempt { Ractor.make_shareable(Thread::Mutex.new) }
```

Output:

```
[ArgumentError, "can not isolate a Proc because it accesses outer variables (first, second)."]
[ArgumentError, "can not isolate a Proc because it accesses outer variables (first)."]
[2]
[1]
[Ractor::IsolationError, "can not access global variable $setting from non-main Ractor"]
[Ractor::IsolationError, "can not access global variable $setting from non-main Ractor"]
IO
[Ractor::IsolationError, "can not access global variable $0 from non-main Ractor"]
[Ractor::IsolationError, "can not access class variables from non-main Ractors (@@count from Box)"]
[Ractor::IsolationError, "can not access non-shareable objects in constant Box::LIST by non-main Ractor."]
[Ractor::IsolationError, "can not access non-shareable objects in constant Box::LIST by non-main ractor."]
[Ractor::IsolationError, "can not access non-shareable objects in constant Box::LIST by non-main Ractor."]
[1, 2]
[Ractor::IsolationError, "can not access non-shareable objects in constant Object::LIST by non-main Ractor."]
[Ractor::IsolationError, "can not access non-shareable objects in constant Object::LIST by non-main Ractor."]
[Ractor::IsolationError, "can not set constants with non-shareable objects by non-main Ractors"]
[true, true, true, true, true, true, true]
[false, false, false]
true
[true, true, true, true]
true
[false, false, true]
[Ractor::IsolationError, "Proc's self is not shareable: #<Proc:ADDRESS WRITTEN_AT>"]
[Ractor::IsolationError, "cannot make a shareable Proc because it can refer unshareable object \"open\" from variable 'text'"]
[ArgumentError, "can not make a Proc shareable because it accesses outer variables (count)."]
[Ractor::IsolationError, "cannot make a shareable Proc because the outer variable 'count' may be reassigned."]
[2, true, true, false]
[3, true]
[true, 3]
[Ractor::Error, "can not make shareable object for #<Thread::Mutex:ADDRESS>"]
```
