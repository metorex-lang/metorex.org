---
title: "syntax/operator_binding.rb"
slug: syntax-operator-binding
description: "The metorex example program syntax/operator_binding.rb and its output."
---

`tests/_examples/syntax/operator_binding.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/operator_binding.rb){target=_blank rel=noopener}.

```metorex
# A range binds looser than every operator but the conditional, so what
# stands on either side of the dots is read whole first.
p((1..false || 10))
p((1...false || 10))

# One range cannot be an end of another.
begin
  eval "1..2..3"
rescue SyntaxError
  puts "a range takes no range"
end

# Nor does a relation chain.
begin
  eval "1 == 2 == 3"
rescue SyntaxError
  puts "a relation takes no relation"
end

begin
  eval "1 <=> 2 <=> 3"
rescue SyntaxError
  puts "a comparison takes no comparison"
end

# A rescue modifier reaches around a whole conditional rather than around
# one of its branches.
p((true ? raise("stopped") : 0 rescue 10))

# A sign glued to a number after a name the program has bound carries on the
# arithmetic rather than opening an argument.
counted = 1
p [2].collect { |step| counted + step +1 }
```

Output:

```
1..10
1...10
a range takes no range
a relation takes no relation
a comparison takes no comparison
10
[4]
```
