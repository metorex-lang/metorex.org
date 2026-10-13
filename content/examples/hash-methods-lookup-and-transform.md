---
title: "hash_methods/lookup_and_transform.rb"
slug: hash-methods-lookup-and-transform
description: "The metorex example program hash_methods/lookup_and_transform.rb and its output."
---

`tests/_examples/hash_methods/lookup_and_transform.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/hash_methods/lookup_and_transform.rb){target=_blank rel=noopener}.

```metorex
counts = Hash.new(0)
counts[:a] += 1
p counts[:missing]
p counts.default
counts.default = 5
p counts.default
p counts[:other]

scores = { alice: 10, bob: nil, carol: 30 }
p scores.empty?
p({}.empty?)
p scores.keys
p scores.values
p scores.size
p scores.has_value?(30)
p scores.value?(99)
p scores.key(30)
p scores.invert
p scores.compact
p scores.except(:bob)
p scores.slice(:alice, :carol)
p scores.values_at(:alice, :nope)
p scores.fetch_values(:alice, :carol)
p scores.assoc(:alice)
p scores.rassoc(30)
p scores.flatten
p scores.to_a
p scores.any?
p scores.any? { |name, score| score.nil? }
p scores.sort

names = []
scores.each_key { |name| names << name }
p names
found = []
scores.each_value { |score| found << score }
p found

p scores.select { |name, score| score }
p scores.reject { |name, score| score }
p scores.transform_values { |score| score.to_s }
p scores.transform_keys { |name| name.to_s }

held = { a: 1, b: 2 }
held.keep_if { |name, value| value > 1 }
p held
held.store(:c, 3)
p held
p held.shift
p held
held.clear
p held

p({ a: 1 } < { a: 1, b: 2 })
p({ a: 1, b: 2 } > { a: 1 })
p({ a: 1 } <= { a: 1 })
p({ a: 1 } >= { a: 2 })

p Hash[a: 1, b: 2]
p Hash[1 => 2]
p Hash[[[:k, :v]]]
p Hash[:x, 1, :y, 2]

keyed = { 4 => "int", 4.0 => "float" }
p keyed[4]
p keyed[4.0]

room = [1, 2, 3, 4, 5]
room[1, 2] = :spliced
p room
room[0] = :first
p room
room[8] = :far
p room
room[0..1] = [:a, :b, :c]
p room
p room.[]=(0, :zero)
```

Output:

```
0
0
5
5
false
true
[:alice, :bob, :carol]
[10, nil, 30]
3
true
false
:carol
{10 => :alice, nil => :bob, 30 => :carol}
{alice: 10, carol: 30}
{alice: 10, carol: 30}
{alice: 10, carol: 30}
[10, nil]
[10, 30]
[:alice, 10]
[:carol, 30]
[:alice, 10, :bob, nil, :carol, 30]
[[:alice, 10], [:bob, nil], [:carol, 30]]
true
true
[[:alice, 10], [:bob, nil], [:carol, 30]]
[:alice, :bob, :carol]
[10, nil, 30]
{alice: 10, carol: 30}
{bob: nil}
{alice: "10", bob: "", carol: "30"}
{"alice" => 10, "bob" => nil, "carol" => 30}
{b: 2}
{b: 2, c: 3}
[:b, 2]
{c: 3}
{}
true
true
true
false
{a: 1, b: 2}
{1 => 2}
{k: :v}
{x: 1, y: 2}
"int"
"float"
[1, :spliced, 4, 5]
[:first, :spliced, 4, 5]
[:first, :spliced, 4, 5, nil, nil, nil, nil, :far]
[:a, :b, :c, 4, 5, nil, nil, nil, nil, :far]
:zero
```
