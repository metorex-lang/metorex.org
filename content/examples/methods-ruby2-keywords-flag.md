---
title: "methods/ruby2_keywords_flag.rb"
slug: methods-ruby2-keywords-flag
description: "The metorex example program methods/ruby2_keywords_flag.rb and its output."
---

`tests/_examples/methods/ruby2_keywords_flag.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/ruby2_keywords_flag.rb){target=_blank rel=noopener}.

```metorex
class Forwarder
  ruby2_keywords def forwards(*args)
    args
  end
end

collected = Forwarder.new.forwards(1, 2)
puts collected.length
puts collected.last

begin
  Forwarder.class_eval { ruby2_keywords :missing }
rescue NameError => error
  puts error.message
end

class Unqualified
  def positional(first, second)
    first
  end
end

Unqualified.class_eval { ruby2_keywords :positional }
puts "warned and carried on"
```

Output:

```
2
2
undefined method 'missing' for class 'Forwarder'
warned and carried on
```
