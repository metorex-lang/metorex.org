---
title: "rescue/modifier/fallbacks_parens.rb"
slug: rescue-modifier-fallbacks-parens
description: "The metorex example program rescue/modifier/fallbacks_parens.rb and its output."
---

`tests/_examples/rescue/modifier/fallbacks_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rescue/modifier/fallbacks_parens.rb).

```metorex
# `expr rescue fallback` answers the fallback when expr raises a
# StandardError. On the right of an assignment the modifier binds to the
# value, so the fallback is what gets assigned.

def risky
  raise("boom")
end

quiet = risky rescue nil
puts(quiet.inspect)

named = risky rescue "caught"
puts(named)

untouched = 1 rescue "never"
puts(untouched.to_s)

parenthesized = (risky rescue :inline)
puts(parenthesized.inspect)

# A rescue clause on its own line still opens a block.
begin
  risky
rescue => error
  puts(error.message)
end

# Only StandardError is caught, so a raised Exception passes through.
def fatal
  raise(Exception, "fatal")
end

begin
  value = fatal rescue "swallowed"
  puts(value)
rescue Exception => error
  puts("propagated: #{error.message}")
end
```

Output:

```
nil
caught
1
:inline
boom
propagated: fatal
```
