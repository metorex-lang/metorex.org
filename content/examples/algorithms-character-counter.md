---
title: "algorithms/character_counter.rb"
slug: algorithms-character-counter
description: "The metorex example program algorithms/character_counter.rb and its output."
---

`tests/_examples/algorithms/character_counter.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/algorithms/character_counter.rb).

```metorex
text = "banana"
counts = {}

text.each_char do |char|
  if counts.key?(char)
    counts[char] = counts[char] + 1
  else
    counts[char] = 1
  end
end

puts counts
```

Output:

```
{"b" => 1, "a" => 3, "n" => 2}
```
