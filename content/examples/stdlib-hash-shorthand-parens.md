---
title: "stdlib/hash/shorthand_parens.rb"
slug: stdlib-hash-shorthand-parens
description: "The metorex example program stdlib/hash/shorthand_parens.rb and its output."
---

`tests/_examples/stdlib/hash/shorthand_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/hash/shorthand_parens.rb).

```metorex
# Hash shorthand syntax with parens: {key: value}
person = {name: "Alice", age: 30}
puts(person[:name])
puts(person[:age])

config = {host: "localhost", port: 8080, debug: true}
puts(config[:host])
puts(config[:port])
puts(config[:debug])

mixed = {a: 1, b: 2, c: 3}
puts(mixed.length)
puts(mixed[:b])
```

Output:

```
Alice
30
localhost
8080
true
3
2
```
