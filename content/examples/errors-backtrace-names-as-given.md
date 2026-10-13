---
title: "errors/backtrace/names_as_given.rb"
slug: errors-backtrace-names-as-given
description: "The metorex example program errors/backtrace/names_as_given.rb and its output."
---

`tests/_examples/errors/backtrace/names_as_given.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/backtrace/names_as_given.rb).

```metorex
# A backtrace names the program file the way the command line gave it, and
# a NameError names the line of the bare name it could not find.
begin
  nope
rescue NameError => error
  p(error.backtrace)
end

def go
  missing
end

begin
  go
rescue NameError => error
  p(error.backtrace)
end
```

Output:

```
["tests/_examples/errors/backtrace/names_as_given.rb:4:in '<main>'"]
["tests/_examples/errors/backtrace/names_as_given.rb:10:in 'Object#go'", "tests/_examples/errors/backtrace/names_as_given.rb:14:in '<main>'"]
```
