---
title: "rex/formatters/custom/spec/silent_formatter.rb"
slug: rex-formatters-custom-spec-silent-formatter
description: "The metorex example program rex/formatters/custom/spec/silent_formatter.rb and its output."
---

`tests/_examples/rex/formatters/custom/spec/silent_formatter.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/formatters/custom/spec/silent_formatter.rb).

```metorex
require "rspec/core/formatters/base_text_formatter"

class SilentFormatter < RSpec::Core::Formatters::BaseTextFormatter
  RSpec::Core::Formatters.register self, :dump_summary

  def dump_summary(summary)
    output.puts "silent: #{summary.totals_line}"
  end
end
```
