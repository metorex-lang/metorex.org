---
title: "metaprogramming/deprecate_constant_no_parens.rb"
slug: metaprogramming-deprecate-constant-no-parens
description: "The metorex example program metaprogramming/deprecate_constant_no_parens.rb and its output."
---

`tests/_examples/metaprogramming/deprecate_constant_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/deprecate_constant_no_parens.rb){target=_blank rel=noopener}.

```metorex
module Archive
  ONE = 1
  TWO = 2
end

Archive.deprecate_constant "ONE", :TWO
Archive.private_constant :ONE

puts Archive::TWO
puts Archive.const_get(:ONE)

begin
  Archive::ONE
rescue NameError
  puts "private"
end
```

Output:

```
2
1
private
```
