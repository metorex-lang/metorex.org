---
title: "hash_methods/resetting_defaults_no_parens.rb"
slug: hash-methods-resetting-defaults-no-parens
description: "The metorex example program hash_methods/resetting_defaults_no_parens.rb and its output."
---

`tests/_examples/hash_methods/resetting_defaults_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/hash_methods/resetting_defaults_no_parens.rb){target=_blank rel=noopener}.

```metorex
# `initialize` is the hook behind `Hash.new`, and calling it again sets a new
# default without touching the pairs already stored.
held = { "one" => 1 }
p held.default

held.send :initialize, 0
p [held.default, held["missing"], held.to_a]

held.send :initialize do |hash, key|
  key.to_s * 2
end
p [held.default, held["ab"], held.to_a]

held.send :initialize
p [held.default, held.default_proc]

made = Set.new [1, 2, 2, 3]
p [made.size, made.include?(2)]

begin
  Set.new 42
rescue ArgumentError => refused
  p refused.message
end
```

Output:

```
nil
[0, 0, [["one", 1]]]
[nil, "abab", [["one", 1]]]
[nil, nil]
[3, true]
"value must be enumerable"
```
