---
title: "oop/super_reaches_kernel.rb"
slug: oop-super-reaches-kernel
description: "The metorex example program oop/super_reaches_kernel.rb and its output."
---

`tests/_examples/oop/super_reaches_kernel.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/super_reaches_kernel.rb).

```metorex
class Loader
  def require_relative(path)
    super
  end

  def frozen?
    super
  end

  def inspect
    "loader: #{super}"
  end

  def instance_variable_get(name)
    super(name)
  end
end

loader = Loader.new
loader.instance_variable_set(:@state, :ready)

puts loader.frozen?
puts loader.instance_variable_get(:@state).inspect
puts loader.inspect.start_with?("loader: #<Loader")

class Counter
  def itself
    super
  end
end

counter = Counter.new
puts counter.itself.equal?(counter)

class Missing
  def no_such_kernel_method
    super
  end
end

begin
  Missing.new.no_such_kernel_method
rescue NoMethodError => error
  puts error.message
end
```

Output:

```
false
:ready
true
true
super: no superclass method 'no_such_kernel_method' for an instance of Missing
```
