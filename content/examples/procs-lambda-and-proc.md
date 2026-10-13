---
title: "procs/lambda_and_proc.rb"
slug: procs-lambda-and-proc
description: "The metorex example program procs/lambda_and_proc.rb and its output."
---

`tests/_examples/procs/lambda_and_proc.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/procs/lambda_and_proc.rb){target=_blank rel=noopener}.

```metorex
strict = lambda { |a, b| a + b }
loose = proc { |a, b| [a, b] }
arrow = -> (a) { a * 2 }

def capture(&block)
  block
end

ordinary = capture { 1 }

puts strict.lambda?
puts loose.lambda?
puts arrow.lambda?
puts ordinary.lambda?

puts strict.call(1, 2)
puts loose.call(1).inspect
puts loose.call(1, 2, 3).inspect

begin
  strict.call(1)
rescue ArgumentError => error
  puts error.class
end

def lambda_return
  result = lambda { return :from_lambda }.call
  [result, :method_finished]
end
puts lambda_return().inspect

def proc_return
  capture { return :from_proc }.call
  :method_finished
end
puts proc_return().inspect

already = lambda { 5 }
reused = lambda(&already)
puts reused.lambda?

begin
  lambda(&proc { 6 })
rescue ArgumentError => error
  puts "#{error.class}: #{error.message}"
end

begin
  lambda
rescue ArgumentError => error
  puts "#{error.class}: #{error.message}"
end

class Redefined
  def lambda(&block)
    block
  end

  def uses_own_lambda
    lambda { 7 }.lambda?
  end
end
puts Redefined.new.uses_own_lambda
```

Output:

```
true
false
true
false
3
[1, nil]
[1, 2]
ArgumentError
[:from_lambda, :method_finished]
:from_proc
true
ArgumentError: the lambda method requires a literal block
ArgumentError: tried to create Proc object without a block
false
```
