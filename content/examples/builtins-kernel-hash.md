---
title: "builtins/kernel_hash.rb"
slug: builtins-kernel-hash
description: "The metorex example program builtins/kernel_hash.rb and its output."
---

`tests/_examples/builtins/kernel_hash.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/kernel_hash.rb).

```metorex
puts Hash(nil).size
puts Hash([]).size
puts Kernel.Hash(nil).size

existing = { a: 1 }
puts Hash(existing)[:a]

class Config
  def to_hash
    { mode: "fast" }
  end
end

puts Hash(Config.new)[:mode]
converted = Hash Config.new
puts converted[:mode]

class Broken
  def to_hash
    "not a hash"
  end
end

begin
  Hash(Broken.new)
rescue TypeError => e
  puts e.message
end

begin
  Hash(Object.new)
rescue TypeError => e
  puts e.message
end

puts Kernel.private_instance_methods.include?(:Hash)
puts 1.respond_to?(:hash)
puts 1.hash == 1.hash
puts "a".hash == "a".hash
puts 1.hash == 2.hash
```

Output:

```
0
0
0
1
fast
fast
can't convert Broken to Hash (Broken#to_hash gives String)
can't convert Object into Hash
true
true
true
true
false
```
