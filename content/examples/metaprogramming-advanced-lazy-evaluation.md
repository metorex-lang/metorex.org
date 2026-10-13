---
title: "metaprogramming/advanced/lazy_evaluation.rb"
slug: metaprogramming-advanced-lazy-evaluation
description: "The metorex example program metaprogramming/advanced/lazy_evaluation.rb and its output."
---

`tests/_examples/metaprogramming/advanced/lazy_evaluation.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/advanced/lazy_evaluation.rb).

```metorex
# Lazy Evaluation: Defer computation until the value is needed
# Demonstrates: blocks as closures, memoization pattern

class Lazy
  def initialize(&block)
    @block = block
    @computed = false
    @value = nil
  end

  def value
    if !@computed
      @value = @block.call
      @computed = true
    end
    @value
  end

  def computed?
    @computed
  end
end

puts "=== Lazy Evaluation ==="

# The block is not called until .value is accessed
expensive = Lazy.new do
  puts "  (computing expensive value...)"
  42 * 42
end

puts "Created lazy value"
puts "Computed yet? #{expensive.computed?}"
puts "First access: #{expensive.value}"
puts "Computed now? #{expensive.computed?}"
puts "Second access: #{expensive.value}"

# Lazy chain: compose lazy computations
puts ""
puts "=== Lazy Chaining ==="

step1 = Lazy.new do
  puts "  (step 1: loading data...)"
  [10, 20, 30]
end

step2 = Lazy.new do
  data = step1.value
  puts "  (step 2: transforming data...)"
  total = 0
  data.each do |n|
    total += n
  end
  total
end

step3 = Lazy.new do
  sum = step2.value
  puts "  (step 3: formatting result...)"
  "Total: #{sum}"
end

puts "Pipeline created (nothing computed yet)"
puts "Final result: #{step3.value}"
puts "Accessing again (cached): #{step3.value}"
```

Output:

```
=== Lazy Evaluation ===
Created lazy value
Computed yet? false
  (computing expensive value...)
First access: 1764
Computed now? true
Second access: 1764

=== Lazy Chaining ===
Pipeline created (nothing computed yet)
  (step 1: loading data...)
  (step 2: transforming data...)
  (step 3: formatting result...)
Final result: Total: 60
Accessing again (cached): Total: 60
```
