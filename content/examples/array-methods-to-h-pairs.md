---
title: "array_methods/to_h_pairs.rb"
slug: array-methods-to-h-pairs
description: "The metorex example program array_methods/to_h_pairs.rb and its output."
---

`tests/_examples/array_methods/to_h_pairs.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/array_methods/to_h_pairs.rb){target=_blank rel=noopener}.

```metorex
# Array#to_h names the index of the element it refused, and it walks the array
# as it stands rather than a snapshot taken up front.
p([[1, 2], [3, 4]].to_h)
p([[1, 2]].to_h { |key, value| [key.to_s, value * 2] })

begin
  [[1, 2, 3]].to_h
rescue ArgumentError => trouble
  p trouble.message
end

begin
  ["pair"].to_h
rescue TypeError => trouble
  p trouble.message
end

class Pairable
  def to_ary
    [:key, :value]
  end
end

p([Pairable.new].to_h)

growing = [[1, 1]]
seen = []
growing.to_h do |pair|
  seen << pair
  growing << [2, 2] if growing.size == 1
  pair
end
p seen
```

Output:

```
{1 => 2, 3 => 4}
{"1" => 4}
"wrong array length at 0 (expected 2, was 3)"
"wrong element type String at 0 (expected array)"
{key: :value}
[[1, 1], [2, 2]]
```
