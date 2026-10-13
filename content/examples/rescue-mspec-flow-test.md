---
title: "rescue/mspec_flow_test.rb"
slug: rescue-mspec-flow-test
description: "The metorex example program rescue/mspec_flow_test.rb and its output."
---

`tests/_examples/rescue/mspec_flow_test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rescue/mspec_flow_test.rb).

```metorex
class Env
  def initialize
    @name = "test_env"
  end
end

class MSpec
  def self.setup
    @env = Env.new
  end

  def self.protect(location, &block)
    begin
      @env.instance_exec(&block)
      return true
    rescue Object => exc
      puts "rescued: location=#{location.inspect}, exc=#{exc.class}"
      return false
    end
  end
end

class ContextState
  def protect(what, blocks)
    Array(blocks).all? { |block| MSpec.protect what, &block }
  end

  def process
    examples = [
      lambda { 1 + 1 },
      lambda { 2 + 2 },
      lambda { 3 + 3 },
      lambda { 4 + 4 },
      lambda { 5 + 5 },
      lambda { 6 + 6 },
      lambda { "hello".bad_method },
    ]

    examples.each do |example|
      passed = protect nil, example
      if passed
        print "."
      end
    end
  end
end

# Simulate MSpec.files flow:
# outer protect wraps Kernel.load which triggers describe/process
MSpec.setup
MSpec.protect("loading file") do
  cs = ContextState.new
  cs.process
end
puts ""
puts "done"
```

Output:

```
......rescued: location=nil, exc=NoMethodError

done
```
