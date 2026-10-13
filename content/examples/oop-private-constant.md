---
title: "oop/private_constant.rb"
slug: oop-private-constant
description: "The metorex example program oop/private_constant.rb and its output."
---

`tests/_examples/oop/private_constant.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/private_constant.rb){target=_blank rel=noopener}.

```metorex
class Holder
  VISIBLE = :visible
  HIDDEN = :hidden
  ALSO_HIDDEN = :also_hidden

  private_constant :HIDDEN, "ALSO_HIDDEN"

  def self.reach_hidden
    HIDDEN
  end
end

class Heir < Holder
end

puts Holder::VISIBLE.inspect
puts Holder.reach_hidden.inspect

begin
  Holder::HIDDEN
rescue NameError
  puts "HIDDEN is private"
end

begin
  Holder::ALSO_HIDDEN
rescue NameError
  puts "ALSO_HIDDEN is private"
end

begin
  Heir.send :private_constant, :VISIBLE
rescue NameError
  puts "NameError for an inherited constant"
end

begin
  Holder.send :private_constant, :ABSENT
rescue NameError
  puts "NameError for a missing constant"
end

Holder.send :public_constant, :HIDDEN
puts Holder::HIDDEN.inspect
```

Output:

```
:visible
:hidden
HIDDEN is private
ALSO_HIDDEN is private
NameError for an inherited constant
NameError for a missing constant
:hidden
```
