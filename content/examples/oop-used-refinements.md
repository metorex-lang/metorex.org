---
title: "oop/used_refinements.rb"
slug: oop-used-refinements
description: "The metorex example program oop/used_refinements.rb and its output."
---

`tests/_examples/oop/used_refinements.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/used_refinements.rb).

```metorex
integers = Module.new do
  refine Integer do
  end
end

strings = Module.new do
  refine String do
  end
end

combined = Module.new do
  include integers
end

Module.new do
  puts Module.used_refinements.inspect
end

Module.new do
  using integers
  using strings
  puts Module.used_refinements.length.inspect
end

Module.new do
  using combined
  puts (Module.used_refinements == integers.refinements).inspect
end

Module.new do
  include combined
  puts Module.used_refinements.inspect
end

Module.new do
  puts Module.used_refinements.inspect
end
```

Output:

```
[]
2
true
[]
[]
```
