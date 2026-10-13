---
title: "metaprogramming/const_missing.rb"
slug: metaprogramming-const-missing
description: "The metorex example program metaprogramming/const_missing.rb and its output."
---

`tests/_examples/metaprogramming/const_missing.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/const_missing.rb){target=_blank rel=noopener}.

```metorex
# Module#const_missing — written without parentheses where possible.
# Fires for literal qualified references and explicit calls; the default
# implementation raises NameError with the qualified path and the name
# attribute set. Symbol interpolation renders the bare name.
module Host
  def self.const_missing name
    "handled #{name}"
  end
end

module Bare
end

puts Host::Anything
puts Host.const_missing :Direct

begin
  Bare.const_missing "Nope"
rescue NameError => e
  puts e.message
  puts e.name.inspect
end

begin
  Bare::AlsoMissing
rescue NameError => e
  puts e.message
end
```

Output:

```
handled Anything
handled Direct
uninitialized constant Bare::Nope
:Nope
uninitialized constant Bare::AlsoMissing
```
