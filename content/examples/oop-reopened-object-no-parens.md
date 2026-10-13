---
title: "oop/reopened_object_no_parens.rb"
slug: oop-reopened-object-no-parens
description: "The metorex example program oop/reopened_object_no_parens.rb and its output."
---

`tests/_examples/oop/reopened_object_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/reopened_object_no_parens.rb).

```metorex
# A method written in `class Object` reaches an object made by `Object.new`,
# replacing the one every object answers with.
class Object
  def to_s = "written"
  def inspect = "shown"
  def fresh_name = :fresh
end

plain = Object.new
p plain.to_s
p plain.inspect
p plain.fresh_name
puts plain
puts "#{plain}"
p plain

class Ordinary; end
p Ordinary.new.to_s
```

Output:

```
"written"
"shown"
:fresh
written
written
shown
"written"
```
