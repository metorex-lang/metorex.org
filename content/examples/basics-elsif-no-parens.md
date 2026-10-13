---
title: "basics/elsif_no_parens.rb"
slug: basics-elsif-no-parens
description: "The metorex example program basics/elsif_no_parens.rb and its output."
---

`tests/_examples/basics/elsif_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/elsif_no_parens.rb).

```metorex
# elsif without parentheses in conditions
temperature = 25

if temperature < 0
  puts "freezing"
elsif temperature < 15
  puts "cold"
elsif temperature < 25
  puts "moderate"
elsif temperature < 35
  puts "warm"
else
  puts "hot"
end
```

Output:

```
warm
```
