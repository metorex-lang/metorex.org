---
title: "stdlib/string_streams.rb"
slug: stdlib-string-streams
description: "The metorex example program stdlib/string_streams.rb and its output."
---

`tests/_examples/stdlib/string_streams.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/string_streams.rb){target=_blank rel=noopener}.

```metorex
# A StringIO is opened over a buffer in a mode written as a string or as the
# flags File names, and a frozen buffer can only be read.
require "stringio"

held = StringIO.new "example", "r"
p held.closed_read?
p held.closed_write?

buffer = +"example"
numbered = StringIO.new buffer, IO::WRONLY
p numbered.closed_read?
p numbered.closed_write?

emptied = +"gone"
StringIO.new emptied, "w"
p emptied

begin
  StringIO.new "frozen".freeze, "w"
rescue Errno::EACCES => problem
  puts problem.class
end

opening = +"first"
stream = StringIO.new opening
replacement = +"second"
stream.reopen replacement
p stream.string
```

Output:

```
false
true
true
false
""
Errno::EACCES
"second"
```
