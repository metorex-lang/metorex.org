---
title: "stdlib/hash/shorthand.rb"
slug: stdlib-hash-shorthand
description: "The metorex example program stdlib/hash/shorthand.rb and its output."
---

`tests/_examples/stdlib/hash/shorthand.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/hash/shorthand.rb){target=_blank rel=noopener}.

```metorex
# Hash shorthand syntax: {key: value}
person = {name: "Alice", age: 30}
puts person[:name]
puts person[:age]

config = {host: "localhost", port: 8080, debug: true}
puts config[:host]
puts config[:port]
puts config[:debug]

mixed = {a: 1, b: 2, c: 3}
puts mixed.length
puts mixed[:b]
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
