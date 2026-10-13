---
title: "reopen_class_test.rb"
slug: reopen-class-test
description: "The metorex example program reopen_class_test.rb and its output."
---

`tests/_examples/reopen_class_test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/reopen_class_test.rb){target=_blank rel=noopener}.

```metorex
module Greetable
  def greet
    "hello"
  end
end

class MyClass
end

class MyClass
  include Greetable
end

obj = MyClass.new
puts obj.greet
```
