---
title: "basics/elsif_basic.rb"
slug: basics-elsif-basic
description: "The metorex example program basics/elsif_basic.rb and its output."
---

`tests/_examples/basics/elsif_basic.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/elsif_basic.rb){target=_blank rel=noopener}.

```metorex
# Basic elsif example
x = 5

if x < 0
  puts "negative"
elsif x == 0
  puts "zero"
elsif x < 10
  puts "small positive"
else
  puts "large positive"
end
```

Output:

```
small positive
```
