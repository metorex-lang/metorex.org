---
title: "methods/warn_parameters.rb"
slug: methods-warn-parameters
description: "The metorex example program methods/warn_parameters.rb and its output."
---

`tests/_examples/methods/warn_parameters.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/warn_parameters.rb).

```metorex
# `Kernel#warn` names the keywords it takes.
p Kernel.instance_method(:warn).parameters

# `exception:` takes true or false and nothing else.
reader, writer = IO.pipe
begin
  reader.read_nonblock(4, exception: nil)
rescue ArgumentError => problem
  p problem.message
end
begin
  writer.write_nonblock("x", exception: 0)
rescue ArgumentError => problem
  p problem.message
end
reader.close
writer.close

# `close_others:` and `daemon` arguments take true, false, or nil.
begin
  Process.spawn("true", close_others: 1)
rescue ArgumentError => problem
  p problem.message
end
begin
  Process.daemon("true")
rescue ArgumentError => problem
  p problem.message
end
begin
  Process.daemon(true, "x")
rescue ArgumentError => problem
  p problem.message
end
```

Output:

```
[[:rest, :msgs], [:key, :uplevel], [:key, :category]]
"expected true or false as exception: nil"
"expected true or false as exception: 0"
"expected true or false as close_others: 1"
"expected true or false as nochdir: \"true\""
"expected true or false as noclose: \"x\""
```
