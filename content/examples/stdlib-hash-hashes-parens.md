---
title: "stdlib/hash/hashes_parens.rb"
slug: stdlib-hash-hashes-parens
description: "The metorex example program stdlib/hash/hashes_parens.rb and its output."
---

`tests/_examples/stdlib/hash/hashes_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/hash/hashes_parens.rb).

```metorex
# Hash/Dict methods demonstration (with parentheses)

ages = {"alice" => 30, "bob" => 25, "charlie" => 35}

# keys and values
puts(ages.keys.sort)
puts(ages.values.sort)

# has_key?
puts(ages.has_key?("alice"))
puts(ages.has_key?("dave"))

# size
puts(ages.size)

# get with default
puts(ages.get("alice"))
puts(ages.get("dave", 0))

# fetch
puts(ages.fetch("bob"))

# merge
merged = ages.merge({"dave" => 40})
puts(merged.size)

# each
total = 0
ages.each { |k, v| total += v }
puts(total)

# entries
puts(ages.entries.length)
```

Output:

```
alice
bob
charlie
25
30
35
true
false
3
30
0
25
4
90
3
```
