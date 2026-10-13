---
title: "globals/global_variables_list.rb"
slug: globals-global-variables-list
description: "The metorex example program globals/global_variables_list.rb and its output."
---

`tests/_examples/globals/global_variables_list.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/global_variables_list.rb){target=_blank rel=noopener}.

```metorex
names = global_variables

puts names.include?(:$stdout)
puts names.include?(:$stderr)
puts names.include?(:$stdin)
puts names.include?(:$never_assigned)

before = global_variables.size
$freshly_assigned = 1
puts global_variables.size - before
puts global_variables.include?(:$freshly_assigned)

puts global_variables.grep(/std/).sort.inspect

words = ["apple", "banana", "avocado"]
puts words.grep(/^a/).inspect
puts words.grep_v(/^a/).inspect
puts words.grep(/^a/) { |word| word.upcase }.inspect

mixed = [1, "two", :three, 4]
puts mixed.grep(Integer).inspect

puts Kernel.private_instance_methods.include?(:global_variables)
```

Output:

```
true
true
true
false
1
true
[:$stderr, :$stdin, :$stdout]
["apple", "avocado"]
["banana"]
["APPLE", "AVOCADO"]
[1, 4]
true
```
