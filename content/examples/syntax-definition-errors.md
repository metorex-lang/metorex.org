---
title: "syntax/definition_errors.rb"
slug: syntax-definition-errors
description: "The metorex example program syntax/definition_errors.rb and its output."
---

`tests/_examples/syntax/definition_errors.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/definition_errors.rb).

```metorex
# A `for` loop takes a parenthesized group apart, and names nothing of its
# own among the locals.
for (rate, count) in [[2, 3]]
  p([rate, count])
end
for code, (low, high) in [[:a, [1, 9]]]
  p([code, low, high])
end
p(local_variables.include?(:__for_value))

# A named capture written in a block sets the local the scope around holds.
total = 42
1.times { /(?<total>\d+)/ =~ "17" }
p(total)

# Reopening a name with the wrong keyword says where it was defined.
LedgerRate = 1
begin
  class LedgerRate; end
rescue TypeError => problem
  p(problem.message.lines.first.chomp)
  p(problem.message.include?("previous definition of LedgerRate was here"))
end
class LedgerBook; end
begin
  module LedgerBook; end
rescue TypeError => problem
  p(problem.message.lines.first.chomp)
end
class LedgerEntry; end
begin
  class LedgerEntry < String; end
rescue TypeError => problem
  p(problem.message)
end
begin
  Class.new(1)
rescue TypeError => problem
  p(problem.message)
end
begin
  nil::Rate
rescue TypeError => problem
  p(problem.message)
end

# A value Ruby holds one copy of has no singleton class to alias on, and the
# refusal leaves constants readable.
begin
  1.instance_eval { alias :amount :to_s }
rescue TypeError => problem
  p(problem.message)
end
p(TypeError)

# A numbered parameter is not a local a Binding reads or writes.
begin
  proc { _1; binding.local_variable_get(:_1) }.call(5)
rescue NameError => problem
  p(problem.message)
end
```

Output:

```
[2, 3]
[:a, 1, 9]
false
"17"
"LedgerRate is not a class"
true
"LedgerBook is not a module"
"superclass mismatch for class LedgerEntry"
"superclass must be an instance of Class (given an instance of Integer)"
"nil is not a class/module"
"can't define singleton"
TypeError
"numbered parameter '_1' is not a local variable"
```
