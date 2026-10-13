---
title: "oop/nested_constant_lookup.rb"
slug: oop-nested-constant-lookup
description: "The metorex example program oop/nested_constant_lookup.rb and its output."
---

`tests/_examples/oop/nested_constant_lookup.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/nested_constant_lookup.rb){target=_blank rel=noopener}.

```metorex
module Catalog
  LIMIT = 3

  module Storage
    class Shelf
      def same_kind?(other)
        other.kind_of? Shelf
      end

      def limit
        LIMIT
      end

      def own_name
        Shelf
      end
    end
  end
end

shelf = Catalog::Storage::Shelf.new

puts shelf.same_kind?(Catalog::Storage::Shelf.new)
puts shelf.same_kind?(Object.new)
puts shelf.limit
puts shelf.own_name
```

Output:

```
true
false
3
Catalog::Storage::Shelf
```
