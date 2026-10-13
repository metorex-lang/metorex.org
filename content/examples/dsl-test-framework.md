---
title: "dsl/test_framework.rb"
slug: dsl-test-framework
description: "The metorex example program dsl/test_framework.rb and its output."
---

`tests/_examples/dsl/test_framework.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/dsl/test_framework.rb).

```metorex
# Simple test framework DSL
# Demonstrates using blocks to build a minimal testing framework

class TestSuite
  def initialize(name)
    @name = name
    @tests = []
    @passed = 0
    @failed = 0
  end

  def test(description, &block)
    @tests.push([description, block])
  end

  def run
    puts "Suite: #{@name}"
    @tests.each do |pair|
      desc = pair[0]
      blk = pair[1]
      result = blk.call
      if result
        @passed = @passed + 1
        puts "  PASS: #{desc}"
      else
        @failed = @failed + 1
        puts "  FAIL: #{desc}"
      end
    end
    puts "Results: #{@passed} passed, #{@failed} failed"
  end
end

suite = TestSuite.new("Math Tests")
suite.test("1 + 1 equals 2") { 1 + 1 == 2 }
suite.test("10 / 2 equals 5") { 10 / 2 == 5 }
suite.test("3 * 4 equals 12") { 3 * 4 == 12 }
suite.test("5 - 3 equals 2") { 5 - 3 == 2 }
suite.test("impossible math") { 1 + 1 == 3 }
suite.run
```

Output:

```
Suite: Math Tests
  PASS: 1 + 1 equals 2
  PASS: 10 / 2 equals 5
  PASS: 3 * 4 equals 12
  PASS: 5 - 3 equals 2
  FAIL: impossible math
Results: 4 passed, 1 failed
```
