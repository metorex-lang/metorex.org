---
title: "oop/refined_operators.rb"
slug: oop-refined-operators
description: "The metorex example program oop/refined_operators.rb and its output."
---

`tests/_examples/oop/refined_operators.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/refined_operators.rb){target=_blank rel=noopener}.

```metorex
module CharClassSubtraction
  refine Regexp do
    def -(other)
      /[#{source}&&[^#{other.source}]]/n
    end
  end
end

module ShiftMinutes
  refine Integer do
    def +(other)
      other.is_a?(String) ? "#{self} #{other}" : super(other)
    end
  end
end

def outside_the_refinement(left, right)
  left - right
rescue NoMethodError => error
  error.class
end

p(outside_the_refinement(/[a-z]/, /[aeiou]/))

using CharClassSubtraction
using ShiftMinutes

consonant = /[a-z]/ - /[aeiou]/
p(consonant)
p("rates"[consonant])
p(30 + "minutes")
p(30 + 15)
```

Output:

```
NoMethodError
/[[a-z]&&[^[aeiou]]]/n
"r"
"30 minutes"
45
```
