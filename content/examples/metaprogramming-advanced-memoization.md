---
title: "metaprogramming/advanced/memoization.rb"
slug: metaprogramming-advanced-memoization
description: "The metorex example program metaprogramming/advanced/memoization.rb and its output."
---

`tests/_examples/metaprogramming/advanced/memoization.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/advanced/memoization.rb).

```metorex
# Memoization: Cache function results to avoid redundant computation
# Demonstrates: closures, hashes as caches, higher-order functions

# Manual memoization using a hash cache
class MemoizedFibonacci
  def initialize
    @cache = {}
  end

  def compute(n)
    if @cache.has_key?(n)
      return @cache[n]
    end

    result = nil
    if n <= 1
      result = n
    else
      result = self.compute(n - 1) + self.compute(n - 2)
    end

    @cache[n] = result
    result
  end

  def cache_size
    @cache.size
  end
end

puts "=== Memoized Fibonacci ==="
fib = MemoizedFibonacci.new

for n in 0..10
  puts "fib(#{n}) = #{fib.compute(n)}"
end
puts "Cache entries: #{fib.cache_size}"

# Generic memoizer using blocks
class Memoizer
  def initialize(&block)
    @func = block
    @cache = {}
  end

  def call(arg)
    if @cache.has_key?(arg)
      return @cache[arg]
    end
    result = @func.call(arg)
    @cache[arg] = result
    result
  end

  def cache_size
    @cache.size
  end
end

puts ""
puts "=== Generic Memoizer ==="

square = Memoizer.new do |n|
  puts "  (computing #{n} * #{n})"
  n * n
end

puts "First calls:"
puts square.call(5)
puts square.call(3)
puts square.call(5)

puts "Second calls (cached):"
puts square.call(5)
puts square.call(3)
puts "Cache size: #{square.cache_size}"
```

Output:

```
=== Memoized Fibonacci ===
fib(0) = 0
fib(1) = 1
fib(2) = 1
fib(3) = 2
fib(4) = 3
fib(5) = 5
fib(6) = 8
fib(7) = 13
fib(8) = 21
fib(9) = 34
fib(10) = 55
Cache entries: 11

=== Generic Memoizer ===
First calls:
  (computing 5 * 5)
25
  (computing 3 * 3)
9
25
Second calls (cached):
25
9
Cache size: 2
```
