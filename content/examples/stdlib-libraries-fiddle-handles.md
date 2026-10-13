---
title: "stdlib_libraries/fiddle_handles.rb"
slug: stdlib-libraries-fiddle-handles
description: "The metorex example program stdlib_libraries/fiddle_handles.rb and its output."
---

`tests/_examples/stdlib_libraries/fiddle_handles.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/fiddle_handles.rb){target=_blank rel=noopener}.

```metorex
# Fiddle::Handle opens a shared library, or the program itself, and answers
# the address each symbol in it is loaded at.
require "fiddle"

begin
  Fiddle::Handle.new("doesnotexist.doesnotexist")
rescue Fiddle::DLError => error
  p(error.class.ancestors.take(3))
end

program = Fiddle::Handle.new(nil)
strlen = program.sym("strlen")
p([strlen.is_a?(Integer), strlen > 0, program["strlen"] == strlen])
p(Fiddle::Handle::DEFAULT.sym("strlen") == Fiddle::Handle.sym("strlen"))

begin
  program.sym("no_such_symbol_here")
rescue Fiddle::DLError => error
  p(error.message)
end

p(program.close)
begin
  program.close
rescue Fiddle::DLError => error
  p(error.message)
end
begin
  program.sym("strlen")
rescue Fiddle::DLError => error
  p(error.message)
end
```

Output:

```
[Fiddle::DLError, Fiddle::Error, StandardError]
[true, true, true]
true
"unknown symbol \"no_such_symbol_here\""
0
"dlclose() called too many times"
"closed handle"
```
