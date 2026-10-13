---
title: "basics/warn/categories_parens.rb"
slug: basics-warn-categories-parens
description: "The metorex example program basics/warn/categories_parens.rb and its output."
---

`tests/_examples/basics/warn/categories_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/warn/categories_parens.rb){target=_blank rel=noopener}.

```metorex
# `Warning.categories` lists every category `Warning[]` accepts.
p(Warning.categories)

# :experimental starts on, the rest start off.
p(Warning[:deprecated])
p(Warning[:experimental])
p(Warning[:performance])

Warning[:performance] = true
p(Warning[:performance])
Warning[:performance] = false

begin
  Warning[:noop]
rescue ArgumentError => error
  puts(error.message)
end

begin
  Warning["deprecated"]
rescue TypeError => error
  puts(error.message)
end

begin
  Warning[42] = true
rescue TypeError => error
  puts(error.message)
end

# Warning extends itself, so `warn` is an instance method it answers to.
p(Warning.singleton_class.ancestors.include?(Warning))
p(Warning.method(:warn).owner)

# A warning in a category that is switched off never prints.
Warning[:deprecated] = false
p(Warning.warn("suppressed\n", category: :deprecated))
Warning[:deprecated] = true
Warning.warn("printed\n", category: :deprecated)

# A key written twice in one literal is named once, and the warning travels
# through Warning.warn, which a program can replace.
$VERBOSE = false
$collected = []

def Warning.warn(message, category: nil)
  $collected << message
  nil
end

duplicated = { key: :value, key: :value2 }
p(duplicated)
p($collected.size)
p($collected.first.include?("key :key is duplicated and overwritten"))
```

Output:

```
[:deprecated, :experimental, :performance, :strict_unused_block]
false
true
false
true
unknown category: noop
no implicit conversion of String into Symbol
no implicit conversion of Integer into Symbol
true
Warning
nil
{key: :value2}
1
true
```
