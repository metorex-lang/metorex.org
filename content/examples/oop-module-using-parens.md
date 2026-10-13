---
title: "oop/module_using_parens.rb"
slug: oop-module-using-parens
description: "The metorex example program oop/module_using_parens.rb and its output."
---

`tests/_examples/oop/module_using_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/module_using_parens.rb).

```metorex
Target = Class.new do
  def describe
    "plain"
  end
end

Adjustment = Module.new do
  refine Target do
    def describe
      "refined"
    end
  end
end

returned = nil
host = Module.new do
  returned = using(Adjustment)
end
puts((returned == host).inspect)

Module.new do
  def self.defined_before(object)
    object.describe
  end

  using(Adjustment)

  puts(defined_before(Target.new).inspect)

  def self.defined_after(object)
    object.describe
  end

  puts(defined_after(Target.new).inspect)
  puts(Target.new.describe.inspect)
end

puts(Target.new.describe.inspect)
```

Output:

```
true
"plain"
"refined"
"refined"
"plain"
```
