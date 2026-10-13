---
title: "rescue/class_method_test.rb"
slug: rescue-class-method-test
description: "The metorex example program rescue/class_method_test.rb and its output."
---

`tests/_examples/rescue/class_method_test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rescue/class_method_test.rb).

```metorex
class MyClass
  def self.protect(location, &block)
    begin
      block.call
      return true
    rescue Object => exc
      return "rescued: location=#{location}"
    end
  end
end

result = MyClass.protect("test_loc") { "hello".bad_method }
puts result
```

Output:

```
rescued: location=test_loc
```
