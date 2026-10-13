---
title: "hash_methods/key_changing_its_hash_no_parens.rb"
slug: hash-methods-key-changing-its-hash-no-parens
description: "The metorex example program hash_methods/key_changing_its_hash_no_parens.rb and its output."
---

`tests/_examples/hash_methods/key_changing_its_hash_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/hash_methods/key_changing_its_hash_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A key's own #hash and #eql? may change the hash that is looking it up.
class Key
  attr_reader :name

  def initialize(name, table)
    @name = name
    @table = table
  end

  def hash
    @table[:lookups] = (@table[:lookups] || 0) + 1
    name.hash
  end

  def eql?(other)
    @table[:comparisons] = (@table[:comparisons] || 0) + 1
    other.is_a?(Key) && other.name == name
  end
end

table = {}
first = Key.new("a", table)
table[first] = 1
p table[Key.new("a", table)]
p table[Key.new("b", table)]
p table[:lookups]
p table.size
```

Output:

```
1
nil
3
3
```
