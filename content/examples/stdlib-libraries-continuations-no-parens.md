---
title: "stdlib_libraries/continuations_no_parens.rb"
slug: stdlib-libraries-continuations-no-parens
description: "The metorex example program stdlib_libraries/continuations_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/continuations_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/continuations_no_parens.rb){target=_blank rel=noopener}.

```metorex
# callcc hands its block a continuation that returns from the block at once
# with whatever it is called with. Loading the library warns that it is
# obsolete.
require "stringio"
$stderr = StringIO.new
require "continuation"
warned = $stderr.string
$stderr = STDERR
p warned.include?("warning: callcc is obsolete; use Fiber instead")

p callcc { |continuation| 1 + 2 }
p callcc { |continuation| continuation.call 10; :not_reached }
p callcc { |continuation| continuation.call }
p callcc { |continuation| continuation.call 1, 2 }
p callcc { |continuation| continuation[5] }
p callcc { |continuation| [continuation.class, continuation.respond_to?(:call)] }

def find_first list
  callcc do |found|
    list.each { |item| found.call item if item.even? }
    nil
  end
end

p find_first([1, 3, 4, 6])
p find_first([1, 3])
total = callcc do |done|
  [1, 2, 3].each_with_index { |number, index| done.(number * 100) if index == 1 }
end
p total
p Continuation.instance_methods(false).sort
begin
  Continuation.new
rescue NoMethodError => error
  p error.class
end
p Kernel.private_method_defined?(:callcc)
```

Output:

```
true
3
10
nil
[1, 2]
5
[Continuation, true]
4
nil
200
[:[], :call]
NoMethodError
true
```
