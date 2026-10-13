---
title: "metaprogramming/refinement.rb"
slug: metaprogramming-refinement
description: "The metorex example program metaprogramming/refinement.rb and its output."
---

`tests/_examples/metaprogramming/refinement.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/refinement.rb){target=_blank rel=noopener}.

```metorex
module StringExt
  refine(String) do
    def shout
      upcase + "!"
    end
  end
end

using StringExt

puts "hello".shout
```

Output:

```
HELLO!
```
