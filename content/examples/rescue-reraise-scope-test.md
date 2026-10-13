---
title: "rescue/reraise_scope_test.rb"
slug: rescue-reraise-scope-test
description: "The metorex example program rescue/reraise_scope_test.rb and its output."
---

`tests/_examples/rescue/reraise_scope_test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rescue/reraise_scope_test.rb).

```metorex
class MSpec
  def self.protect(location, &block)
    begin
      block.call
      return true
    rescue Object => exc
      puts "outer rescue: location=#{location.inspect}, exc class=#{exc.class}"
      return false
    end
  end
end

class Matcher
  def initialize(expected_type)
    @expected_type = expected_type
  end

  def matches?(proc)
    @result = proc.call
    return false
  rescue Object => actual
    if actual.class == @expected_type
      return true
    else
      raise actual
    end
  end
end

m = Matcher.new(String)
MSpec.protect(nil) do
  m.matches?(lambda { "hello".bad_method })
end
```

Output:

```
outer rescue: location=nil, exc class=NoMethodError
```
