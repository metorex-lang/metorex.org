---
title: "metaprogramming/extend_sees_later_methods_no_parens.rb"
slug: metaprogramming-extend-sees-later-methods-no-parens
description: "The metorex example program metaprogramming/extend_sees_later_methods_no_parens.rb and its output."
---

`tests/_examples/metaprogramming/extend_sees_later_methods_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/extend_sees_later_methods_no_parens.rb).

```metorex
module Rates
  def load_rates = :first_version
  extend self
end

module Rates
  def load_rates = :second_version
end

module Tariffs
  def lookup = :first_version
end

module Registry
  extend Tariffs
end

module Tariffs
  def lookup = :second_version
end

p Rates.load_rates
p Registry.lookup
```

Output:

```
:second_version
:second_version
```
