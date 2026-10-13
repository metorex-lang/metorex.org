---
title: "builtins/srand_seeding_parens.rb"
slug: builtins-srand-seeding-parens
description: "The metorex example program builtins/srand_seeding_parens.rb and its output."
---

`tests/_examples/builtins/srand_seeding_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/srand_seeding_parens.rb).

```metorex
srand(10)
puts srand(20)
puts srand(0)
puts srand(-17)

srand(10)
first = rand
srand(10)
puts(first == rand)

srand(99)
sequence = 3.times.map { rand }
srand(99)
puts(sequence == 3.times.map { rand })

srand(3.8)
puts srand

class Seed
  def to_int
    7
  end
end
srand(Seed.new)
puts srand

previous = srand
puts previous.is_a?(Integer)
puts(srand != 0)

[nil, "7"].each do |bad|
  begin
    srand(bad)
  rescue TypeError => error
    puts error.class
  end
end

puts Kernel.private_instance_methods(false).include?(:srand)
```

Output:

```
10
20
0
true
true
3
7
true
true
TypeError
TypeError
true
```
