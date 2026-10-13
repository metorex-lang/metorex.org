---
title: "basics/spaceship_operator.rb"
slug: basics-spaceship-operator
description: "The metorex example program basics/spaceship_operator.rb and its output."
---

`tests/_examples/basics/spaceship_operator.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/spaceship_operator.rb).

```metorex
# Int <=> Int
puts(1 <=> 2)
puts(2 <=> 2)
puts(3 <=> 2)

# Float <=> Float
puts(1.0 <=> 2.0)
puts(2.0 <=> 2.0)
puts(3.0 <=> 2.0)

# Int <=> Float
puts(1 <=> 2.0)
puts(2 <=> 2.0)
puts(3 <=> 2.0)

# Float <=> Int
puts(1.0 <=> 2)
puts(2.0 <=> 2)
puts(3.0 <=> 2)

# String <=> String
puts("apple" <=> "banana")
puts("hello" <=> "hello")
puts("zoo" <=> "apple")
```

Output:

```
-1
0
1
-1
0
1
-1
0
1
-1
0
1
-1
0
1
```
