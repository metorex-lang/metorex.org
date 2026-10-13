---
title: "oop/prepend_ancestry_parens.rb"
slug: oop-prepend-ancestry-parens
description: "The metorex example program oop/prepend_ancestry_parens.rb and its output."
---

`tests/_examples/oop/prepend_ancestry_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/prepend_ancestry_parens.rb){target=_blank rel=noopener}.

```metorex
module Logging
  CHANNEL = "logging"

  def describe
    "logged: #{super}"
  end
end

class Report
  prepend Logging

  CHANNEL = "report"

  def describe
    "report"
  end

  def self.channel
    CHANNEL
  end
end

report = Report.new
puts(report.describe)
puts(Report.ancestors.first)
puts(Report.ancestors.take(2).last)
puts(report.is_a?(Logging))
puts(Report.channel)
puts(Report.constants.include?(:CHANNEL))

class Detailed < Report
  def describe
    "detailed: #{super}"
  end
end

puts(Detailed.new.describe)

module Shared
end

class Base
  include Shared
end

class Derived < Base
  prepend Shared
end

puts(Derived.ancestors.select { |ancestor| ancestor == Shared }.length)

begin
  Class.new { prepend }
rescue ArgumentError
  puts("ArgumentError")
end

class Alone
  prepend Logging
end

begin
  Alone.new.describe
rescue NoMethodError => error
  puts(error.message)
end
```

Output:

```
logged: report
Logging
Report
true
report
true
detailed: logged: report
2
ArgumentError
super: no superclass method 'describe' for an instance of Alone
```
