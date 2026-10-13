---
title: "data_structures/hash_methods.rb"
slug: data-structures-hash-methods
description: "The metorex example program data_structures/hash_methods.rb and its output."
---

`tests/_examples/data_structures/hash_methods.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/data_structures/hash_methods.rb).

```metorex
# Test hash methods
ages = {"alice" => 30, "bob" => 25, "charlie" => 35}

puts "Keys:"
puts ages.keys

puts "Values:"
puts ages.values

puts "Has alice?"
puts ages.has_key?("alice")

puts "Has dave?"
puts ages.has_key?("dave")

puts "Size:"
puts ages.size

puts "Entries:"
puts ages.entries
```

Output:

```
Keys:
alice
bob
charlie
Values:
30
25
35
Has alice?
true
Has dave?
false
Size:
3
Entries:
alice
30
bob
25
charlie
35
```
