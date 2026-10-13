---
title: "oop/case_compare_extend_parens.rb"
slug: oop-case-compare-extend-parens
description: "The metorex example program oop/case_compare_extend_parens.rb and its output."
---

`tests/_examples/oop/case_compare_extend_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/case_compare_extend_parens.rb).

```metorex
module Basic
end

module Super
  include Basic
end

class Plain
end

obj = Plain.new
obj.extend(Super)

puts "Basic === obj: #{Basic === obj}"
puts "Super === obj: #{Super === obj}"
puts "obj.is_a?(Basic): #{obj.is_a?(Basic)}"
puts "obj.is_a?(Super): #{obj.is_a?(Super)}"

class Parent
end

class Child < Parent
  include Super
end

puts "Basic === Child.new: #{Basic === Child.new}"
puts "Super === Child.new: #{Super === Child.new}"
```

Output:

```
Basic === obj: true
Super === obj: true
obj.is_a?(Basic): true
obj.is_a?(Super): true
Basic === Child.new: true
Super === Child.new: true
```
