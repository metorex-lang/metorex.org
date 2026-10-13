---
title: "type_annotations/collection_types.rb"
slug: type-annotations-collection-types
description: "The metorex example program type_annotations/collection_types.rb and its output."
---

`tests/_examples/type_annotations/collection_types.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/type_annotations/collection_types.rb){target=_blank rel=noopener}.

```metorex
numbers = [1, 2, 3, 4, 5]  # list
puts "numbers = #{numbers}"

scores = {"Alice" => 90, "Bob" => 85}  # dict
puts "scores = #{scores}"

def process_list(items)  # list -> int
  items.length
end

def get_score(grades, name)  # dict, str -> int
  grades[name]
end

puts "length of numbers: #{process_list(numbers)}"
puts "Alice's score: #{get_score(scores, "Alice")}"
```

Output:

```
numbers = [1, 2, 3, 4, 5]
scores = {"Alice" => 90, "Bob" => 85}
length of numbers: 5
Alice's score: 90
```
