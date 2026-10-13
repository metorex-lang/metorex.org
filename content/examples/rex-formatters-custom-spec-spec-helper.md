---
title: "rex/formatters/custom/spec/spec_helper.rb"
slug: rex-formatters-custom-spec-spec-helper
description: "The metorex example program rex/formatters/custom/spec/spec_helper.rb and its output."
---

`tests/_examples/rex/formatters/custom/spec/spec_helper.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/formatters/custom/spec/spec_helper.rb){target=_blank rel=noopener}.

```metorex
class TallyFormatter
  RSpec::Core::Formatters.register self, :example_passed, :example_failed, :dump_summary

  def initialize(output)
    @output = output
    @passed = 0
    @failed = 0
  end

  def example_passed(notification)
    @passed += 1
    @output.puts "passed: #{notification.example.description}"
  end

  def example_failed(notification)
    @failed += 1
    @output.puts "failed: #{notification.example.description}"
  end

  def example_pending(_notification)
    @output.puts "never called, since the class did not register it"
  end

  def dump_summary(summary)
    @output.puts "#{@passed} passed, #{@failed} failed of #{summary.example_count}"
  end
end

RSpec.configure do |config|
  config.add_formatter TallyFormatter
end
```
