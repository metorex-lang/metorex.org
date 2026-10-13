---
title: "require/autoload_and_require.rb"
slug: require-autoload-and-require
description: "The metorex example program require/autoload_and_require.rb and its output."
---

`tests/_examples/require/autoload_and_require.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/autoload_and_require.rb){target=_blank rel=noopener}.

```metorex
# An autoload of a constant already defined is ignored. A file required
# while it is also autoloaded defines its constant without loading itself
# again, and `include` of an autoloaded module loads it, as RubyGems and
# Bundler do.
$VERBOSE = true

module Ledger
  Region = :north
  autoload :Region, File.join(__dir__, "autoload_lib", "ledger_region")
  autoload :Rate, File.join(__dir__, "autoload_lib", "ledger_rate")
  autoload :Rounding, File.join(__dir__, "autoload_lib", "ledger_rounding")
end

p(Ledger.autoload?(:Region))
p(Ledger::Region)
require_relative("autoload_lib/ledger_rate")
p(Ledger.autoload?(:Rate))
p(Ledger::Rate.new.rounded)
p(Ledger.autoload?(:Rounding))
autoload(:Comparable, "ledger_comparable")
p(Object.autoload?(:Comparable))
```

Output:

```
nil
:north
nil
12.35
nil
nil
```
