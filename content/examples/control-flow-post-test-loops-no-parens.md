---
title: "control_flow/post_test_loops_no_parens.rb"
slug: control-flow-post-test-loops-no-parens
description: "The metorex example program control_flow/post_test_loops_no_parens.rb and its output."
---

`tests/_examples/control_flow/post_test_loops_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/control_flow/post_test_loops_no_parens.rb).

```metorex
# `begin ... end while` reads its condition after the body has run, so the body
# runs at least once.
counted = 0
begin
  counted += 1
end while false
p counted

gathered = []
index = 0
begin
  gathered.push index
end while (index += 1) < 4
p gathered

skipped = []
index = 0
begin
  next if index == 2
  skipped.push index
end while (index += 1) < 4
p skipped

repeated = []
index = 0
turns = 0
begin
  repeated.push index
  turns += 1
  redo if turns < 3
end while (index += 1) < 3
p repeated

p((begin; break 123; end while true))
p((begin; break; end while true))

counted = 0
begin
  counted += 1
end until counted == 3
p counted
```

Output:

```
1
[0, 1, 2, 3]
[0, 1, 3]
[0, 0, 0, 1, 2]
123
nil
3
```
