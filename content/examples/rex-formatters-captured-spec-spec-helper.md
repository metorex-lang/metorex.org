---
title: "rex/formatters/captured/spec/spec_helper.rb"
slug: rex-formatters-captured-spec-spec-helper
description: "The metorex example program rex/formatters/captured/spec/spec_helper.rb and its output."
---

`tests/_examples/rex/formatters/captured/spec/spec_helper.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/formatters/captured/spec/spec_helper.rb).

```metorex
require "stringio"

CAPTURED = StringIO.new

RSpec.configure do |config|
  config.add_formatter RSpec::Core::Formatters::DocumentationFormatter.new(CAPTURED)
  config.after(:suite) do
    puts "captured:"
    puts CAPTURED.string.lines.map { |line| "| #{line}" }.join
  end
end
```
