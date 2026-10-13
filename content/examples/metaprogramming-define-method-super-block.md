---
title: "metaprogramming/define_method_super_block.rb"
slug: metaprogramming-define-method-super-block
description: "The metorex example program metaprogramming/define_method_super_block.rb and its output."
---

`tests/_examples/metaprogramming/define_method_super_block.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/define_method_super_block.rb){target=_blank rel=noopener}.

```metorex
module Walks
  def walk_pairs(step)
    [1, 2, 3].each { |value| yield value, value * step }
  end
end

class Batch
  include Walks

  [:walk_pairs].each do |name|
    define_method(name) do |*args, &block|
      return :no_block if block.nil?
      super(*args, &block)
    end
  end
end

p Batch.new.walk_pairs(10)
Batch.new.walk_pairs(10) { |value, scaled| p [value, scaled] }

class Enumerator::Lazy
  [:each_cons].each do |name|
    define_method(name) do |*args, &block|
      super(*args, &block)
    end
  end
end

(1..4).lazy.each_cons(2) { |pair| p pair }
```

Output:

```
:no_block
[1, 10]
[2, 20]
[3, 30]
[1, 2]
[2, 3]
[3, 4]
```
