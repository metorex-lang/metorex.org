---
title: "rescue/param_scope_test.rb"
slug: rescue-param-scope-test
description: "The metorex example program rescue/param_scope_test.rb and its output."
---

`tests/_examples/rescue/param_scope_test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rescue/param_scope_test.rb).

```metorex
def test_method(loc, &blk)
  begin
    blk.call
    return "no error"
  rescue Object => exc
    return "caught: loc=#{loc}"
  end
end

result = test_method("my_location") { "hello".bad_method }
puts result
```

Output:

```
caught: loc=my_location
```
