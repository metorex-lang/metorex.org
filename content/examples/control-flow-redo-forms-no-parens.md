---
title: "control_flow/redo_forms_no_parens.rb"
slug: control-flow-redo-forms-no-parens
description: "The metorex example program control_flow/redo_forms_no_parens.rb and its output."
---

`tests/_examples/control_flow/redo_forms_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/redo_forms_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Where `redo` restarts: the body of the closest block or loop, without
# asking the iterator for its next value, and after any ensure clause runs.

calls = []
-> {
  calls << 1
  redo if calls.size < 2
  calls << 2
}.call
p calls

pending = [2, 3]
processed = []
[1, 2, 3, 4].each do |value|
  begin
    processed << value
    raise StandardError, "included" if pending.include? value
  rescue StandardError
    pending.delete value
    redo
  end
end
p processed

list = []
[1, 2, 3].each do |value|
  list << value
  break if list.size == 6
  redo if value == 3
end
p list

list = []
[1, 2, 3].each do |value|
  list << value
  begin
    list << 10 * value
    ones = list.count 1
    redo if ones == 1
  ensure
    list << 100 * value
  end
end
p list

begin
  eval "def restarts; redo; end"
rescue SyntaxError
  p SyntaxError
end
```

Output:

```
[1, 1, 2]
[1, 2, 2, 3, 3, 4]
[1, 2, 3, 3, 3, 3]
[1, 10, 100, 1, 10, 100, 2, 20, 200, 3, 30, 300]
SyntaxError
```
