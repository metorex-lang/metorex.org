---
title: "stdlib_libraries/irb_source_window_no_parens.rb"
slug: stdlib-libraries-irb-source-window-no-parens
description: "The metorex example program stdlib_libraries/irb_source_window_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/irb_source_window_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/irb_source_window_no_parens.rb).

```metorex
# The header `binding.irb` writes shows up to five lines of source on either
# side of the binding, with an arrow at the binding's own line. The line
# numbers are padded to the width of the last index shown, counted from zero.
require "rbconfig"

def header_of(place)
  environment = { "IRBRC" => nil, "HOME" => nil, "XDG_CONFIG_HOME" => nil }
  written = IO.popen([environment, RbConfig.ruby, __FILE__, place], "r+") do |pipe|
    pipe.close_write
    pipe.read
  end
  written.sub(/From: \S+/, "From: here")
end

if ARGV.first == "early"
  binding.irb
elsif ARGV.first == "late"
  binding.irb
else
  puts header_of "early"
  puts header_of "late"
end
```

Output:

```

From: here @ line 16 :

    11:   end
    12:   written.sub(/From: \S+/, "From: here")
    13: end
    14: 
    15: if ARGV.first == "early"
 => 16:   binding.irb
    17: elsif ARGV.first == "late"
    18:   binding.irb
    19: else
    20:   puts header_of "early"
    21:   puts header_of "late"

Switch to inspect mode.


From: here @ line 18 :

    13: end
    14: 
    15: if ARGV.first == "early"
    16:   binding.irb
    17: elsif ARGV.first == "late"
 => 18:   binding.irb
    19: else
    20:   puts header_of "early"
    21:   puts header_of "late"
    22: end

Switch to inspect mode.

```
