---
title: "test_discovery/test_strings.rb"
slug: test-discovery-test-strings
description: "The metorex example program test_discovery/test_strings.rb and its output."
---

`tests/_examples/test_discovery/test_strings.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/test_discovery/test_strings.rb).

```metorex
# Test file: test_strings.rb
# Discovered by --test flag (matches test_*.rb pattern)

assert_equal(5, "hello".length)
assert_equal("HELLO", "hello".upcase)
assert_equal("hello", "HELLO".downcase)
puts "test_strings passed"
```
