---
title: "control_flow/do_while_jumps_and_case_constants.rb"
slug: control-flow-do-while-jumps-and-case-constants
description: "The metorex example program control_flow/do_while_jumps_and_case_constants.rb and its output."
---

`tests/_examples/control_flow/do_while_jumps_and_case_constants.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/do_while_jumps_and_case_constants.rb){target=_blank rel=noopener}.

```metorex
def first_large(values)
  index = -1
  begin
    index += 1
    break if values[index] > 10
  end while index < values.size - 1
  values[index]
end
p(first_large([3, 14, 5]))

def skip_small(values)
  index = 0
  total = 0
  begin
    index += 1
    next if values[index - 1] < 5
    total += values[index - 1]
  end until index >= values.size
  total
end
p(skip_small([3, 14, 5]))

class Sorter
  INVOICE = /\AINV-(\d+)\z/
  SMALL = (1..9)
  LIMIT = 100

  def self.kind(value)
    case value
    when INVOICE then "invoice #{$1}"
    when SMALL then "small"
    when LIMIT then "limit"
    else "other"
    end
  end
end
p(Sorter.kind("INV-1042"))
p(Sorter.kind(4))
p(Sorter.kind(100.0))
p(Sorter.kind(:pending))

p(case 4.0 when 4 then :whole end)
p(case 4 when 4.0 then :float end)
p(case 4.5 when 4 then :whole else :fraction end)
```

Output:

```
14
19
"invoice 1042"
"small"
"limit"
"other"
:whole
:float
:fraction
```
