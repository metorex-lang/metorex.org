---
title: "metaprogramming/extend_with_several_modules.rb"
slug: metaprogramming-extend-with-several-modules
description: "The metorex example program metaprogramming/extend_with_several_modules.rb and its output."
---

`tests/_examples/metaprogramming/extend_with_several_modules.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/extend_with_several_modules.rb){target=_blank rel=noopener}.

```metorex
# extend takes several modules and puts the first one named nearest the
# object, and refuses anything that is not a module.
module Loud
  def speak = :loud
end

module Quiet
  def speak = :quiet
end

class Speaker
  extend(Loud, Quiet)
end

p(Speaker.speak)
p(Speaker.singleton_class.ancestors.take(3))
voice = Object.new
voice.extend(Quiet, Loud)
p(voice.speak)
[[1], [], [Speaker]].each do |given|
  Speaker.extend(*given)
rescue TypeError, ArgumentError => error
  p([error.class, error.message])
end
```

Output:

```
:loud
[#<Class:Speaker>, Loud, Quiet]
:quiet
[TypeError, "wrong argument type Integer (expected Module)"]
[ArgumentError, "wrong number of arguments (given 0, expected 1+)"]
[TypeError, "wrong argument type Class (expected Module)"]
```
