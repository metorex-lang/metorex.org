---
title: "stdlib_libraries/continuation_reentry.rb"
slug: stdlib-libraries-continuation-reentry
description: "The metorex example program stdlib_libraries/continuation_reentry.rb and its output."
---

`tests/_examples/stdlib_libraries/continuation_reentry.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/continuation_reentry.rb).

```metorex
# A continuation called after its callcc block has returned goes back to
# the place callcc was called from, which then answers what the
# continuation was called with.
require("stringio")
$stderr = StringIO.new
require("continuation")
$stderr = STDERR

saved = nil
count = callcc { |continuation| saved = continuation; 0 }
puts(count)
saved.call(count + 1) if count < 2

def counted
  again = nil
  number = callcc { |continuation| again = continuation; 10 }
  puts("in method #{number}")
  again.call(number + 1) if number < 12
  :done
end
p(counted)
```

Output:

```
0
1
2
in method 10
in method 11
in method 12
:done
```
