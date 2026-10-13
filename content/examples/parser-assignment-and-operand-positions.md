---
title: "parser/assignment_and_operand_positions.rb"
slug: parser-assignment-and-operand-positions
description: "The metorex example program parser/assignment_and_operand_positions.rb and its output."
---

`tests/_examples/parser/assignment_and_operand_positions.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/parser/assignment_and_operand_positions.rb){target=_blank rel=noopener}.

```metorex
class Holder
  attr_accessor :value
end
holder = Holder.new

def assign_in_return(holder)
  return holder.value = :returned unless holder.value
  :kept
end
p assign_in_return(holder)

count = 0
while holder.value = (count < 2) && :looping
  count += 1
end
p count

def pair(first, second) = [first.class, second.class]
p pair lambda {}, lambda {}

def chosen(flag)
  if flag
    :from_if
  end || :from_or
end
p [chosen(true), chosen(false)]

def from_case(value)
  case value
  when 1 then :one
  end || :none
end
p from_case(2)
```

Output:

```
:returned
2
[Proc, Proc]
[:from_if, :from_or]
:none
```
