---
title: "hash_methods/key_identity_and_hashing.rb"
slug: hash-methods-key-identity-and-hashing
description: "The metorex example program hash_methods/key_identity_and_hashing.rb and its output."
---

`tests/_examples/hash_methods/key_identity_and_hashing.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/hash_methods/key_identity_and_hashing.rb).

```metorex
# A hash places a key by its own #hash and tells keys sharing a number apart
# with #eql?, so a class decides for itself which keys name one entry.
class Tagged
  attr_reader :tag

  def initialize(tag, hashed)
    @tag = tag
    @hashed = hashed
  end

  def hash
    @hashed
  end

  def eql?(other)
    other.is_a?(Tagged) && other.tag == @tag
  end
end

shared = {}
shared[Tagged.new(:left, 7)] = :first
shared[Tagged.new(:right, 7)] = :second
p(shared.size)
p(shared[Tagged.new(:left, 7)])
shared[Tagged.new(:left, 7)] = :again
p(shared.size)
p(shared.keys.map { |held| held.tag })

# A String key is stored as a frozen copy, so writing through the original
# leaves the hash alone.
text = +"one"
counts = {}
counts.store(text, 1)
text << "-more"
p(counts)
p(counts.keys[0].frozen?)

# #rehash puts every key back where its number now belongs.
drifting = Tagged.new(:drift, 1)
moved = {}
moved[drifting] = :held
p(moved.key?(drifting))

# Comparing by identity keeps two equal strings as two entries.
identity = {}.compare_by_identity
first = +"pear"
second = +"pear"
identity[first] = :red
identity[second] = :green
p(identity.size)
p(identity[first])
p(identity.assoc("pear"))

# Two hashes are equal when each key finds its match in the other.
p({ Tagged.new(:a, 3) => 1 } == { Tagged.new(:a, 3) => 1 })
p({ Tagged.new(:a, 3) => 1 } == { Tagged.new(:b, 3) => 1 })

# uniq tells elements apart the same way.
p([Tagged.new(:a, 5), Tagged.new(:a, 5), Tagged.new(:b, 5)].uniq.map { |held| held.tag })
```

Output:

```
2
:first
2
[:left, :right]
{"one" => 1}
true
true
2
:red
["pear", :red]
true
false
[:a, :b]
```
