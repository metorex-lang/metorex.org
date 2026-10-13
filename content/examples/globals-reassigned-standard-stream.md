---
title: "globals/reassigned_standard_stream.rb"
slug: globals-reassigned-standard-stream
description: "The metorex example program globals/reassigned_standard_stream.rb and its output."
---

`tests/_examples/globals/reassigned_standard_stream.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/reassigned_standard_stream.rb){target=_blank rel=noopener}.

```metorex
# A standard stream's constant may be pointed at another stream inside a
# block and pointed back afterwards, which leaves the original open.
original = STDERR
[1].each do
  $VERBOSE = nil
  STDERR = File.open("/dev/null", "w")
  STDERR.close
  begin
    p STDERR.closed?
  ensure
    STDERR = original
  end
end
p STDERR.equal?(original)
p STDERR.closed?
p $stderr.closed?
```

Output:

```
true
true
false
false
```
