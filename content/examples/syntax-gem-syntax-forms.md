---
title: "syntax/gem_syntax_forms.rb"
slug: syntax-gem-syntax-forms
description: "The metorex example program syntax/gem_syntax_forms.rb and its output."
---

`tests/_examples/syntax/gem_syntax_forms.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/gem_syntax_forms.rb).

```metorex
module Core
  Event = Struct
end

class Basic < Core::Event.new(:entity); end
p(Basic.new(1).entity)

module Wrap
  class Inner < Core::Event.new(:x)
  end
end
p(Wrap::Inner.new(3).x)

begin
  ::Kernel::raise ::ArgumentError, "bad size"
rescue ArgumentError => error
  p(error.message)
end
p(::Kernel::Integer("12"))

module Tools
  def self.twice(value) = value * 2
end
p(Tools::twice(4))

def add(include)
  include + 1
end
p(add(1))
p([1, 2].map { |include| include * 2 })
p([3].each_with_object([]) { |extend, held| held << extend })

@line = 0
p({ line: @line += 1 })
count = 5
p({ total: count -= 2, "key" => count *= 3 })
module Contracts
  class CallableClass
    def kind = :callable
  end
end
module Aruba
  module Contracts
    class Enum < ::Contracts::CallableClass
    end
  end
end
p Aruba::Contracts::Enum.new.kind
class Top < ::Object
end
p Top.superclass
```

Output:

```
1
3
"bad size"
12
8
2
[2, 4]
[3]
{line: 1}
{total: 3, "key" => 9}
:callable
Object
```
