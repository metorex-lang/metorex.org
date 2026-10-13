---
title: "rescue/rerescue_test.rb"
slug: rescue-rerescue-test
description: "The metorex example program rescue/rerescue_test.rb and its output."
---

`tests/_examples/rescue/rerescue_test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rescue/rerescue_test.rb).

```metorex
class MSpec
  def self.protect(location, &block)
    begin
      block.call
      return true
    rescue Object => exc
      puts "rescue caught: location=#{location.inspect}"
      return false
    end
  end
end

class Matcher
  def matches?(proc)
    begin
      @result = proc.call
      return false
    rescue Object => actual
      # Exception was wrong type, re-raise
      raise actual
    end
  end
end

m = Matcher.new
MSpec.protect("test_loc") do
  m.matches?(lambda { "hello".bad_method })
end
```

Output:

```
rescue caught: location="test_loc"
```
