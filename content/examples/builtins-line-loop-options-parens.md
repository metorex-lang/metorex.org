---
title: "builtins/line_loop_options_parens.rb"
slug: builtins-line-loop-options-parens
description: "The metorex example program builtins/line_loop_options_parens.rb and its output."
---

`tests/_examples/builtins/line_loop_options_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/line_loop_options_parens.rb){target=_blank rel=noopener}.

```metorex
# `Array#join` joins a nested array with the same separator, however deeply
# they nest.
p(["a", "b", ["c", "d"]].join(" "))
p([1, [2, [3]]].join("-"))
p([1, 2].join(","))
p([].join(","))

# `$FILENAME` names the file ARGF is reading, and `$.` counts the lines read.
one = "/tmp/metorex_lineloop_parens_one.txt"
File.write(one, "alpha\nbeta\n")
stream = ARGF.class.new(one)
p($.)
stream.gets
p(stream.lineno)
stream.gets
p(stream.lineno)
stream.rewind
p(stream.lineno)
File.delete(one)

# A stream read to the end is closed, and cannot be put back to the start.
drained = ARGF.class.new("/tmp/metorex_lineloop_parens_two.txt")
File.write("/tmp/metorex_lineloop_parens_two.txt", "only\n")
drained.read
begin
  drained.rewind
rescue ArgumentError => problem
  p problem.message
end
File.delete("/tmp/metorex_lineloop_parens_two.txt")
```

Output:

```
"a b c d"
"1-2-3"
"1,2"
""
0
1
2
0
"closed stream"
```
