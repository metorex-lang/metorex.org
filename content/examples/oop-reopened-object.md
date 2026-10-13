---
title: "oop/reopened_object.rb"
slug: oop-reopened-object
description: "The metorex example program oop/reopened_object.rb and its output."
---

`tests/_examples/oop/reopened_object.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/reopened_object.rb).

```metorex
# A method written in `class Object` reaches an object made by `Object.new`,
# replacing the one every object answers with.
class Object
  def to_s = "written"
  def inspect = "shown"
  def fresh_name = :fresh
end

plain = Object.new
p(plain.to_s)
p(plain.inspect)
p(plain.fresh_name)
puts(plain)
puts("#{plain}")
p(plain)

class Ordinary; end
p(Ordinary.new.to_s)
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
