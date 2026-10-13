---
title: "oop/public_visibility_parens.rb"
slug: oop-public-visibility-parens
description: "The metorex example program oop/public_visibility_parens.rb and its output."
---

`tests/_examples/oop/public_visibility_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/public_visibility_parens.rb).

```metorex
class Ancestor
  private

  def redefined_later
    :before
  end
end

class Descendant < Ancestor
  public(:redefined_later)
end

class Ancestor
  def redefined_later
    :after
  end
end

puts(Descendant.new.redefined_later.inspect)
puts(Descendant.public_instance_methods(false).inspect)

class SameVisibility < Ancestor
  public(:redefined_later)
end
puts(SameVisibility.public_instance_methods(false).inspect)

class Toggling < Ancestor
  private(:redefined_later)
  public(:redefined_later)
end
puts(Toggling.public_instance_methods(false).inspect)
puts(Toggling.private_instance_methods(false).inspect)
```

Output:

```
:after
[:redefined_later]
[]
[:redefined_later]
[]
```
