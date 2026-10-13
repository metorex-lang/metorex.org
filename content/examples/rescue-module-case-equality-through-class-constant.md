---
title: "rescue/module_case_equality_through_class_constant.rb"
slug: rescue-module-case-equality-through-class-constant
description: "The metorex example program rescue/module_case_equality_through_class_constant.rb and its output."
---

`tests/_examples/rescue/module_case_equality_through_class_constant.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rescue/module_case_equality_through_class_constant.rb){target=_blank rel=noopener}.

```metorex
module Catching
  def self.===(exception)
    exception.is_a?(Exception)
  end
end

class Runner
  def run
    yield
  rescue Catcher => error
    [:caught, error.message]
  end

  if RUBY_VERSION.to_f < 1.9
    Catcher = Exception
  else
    Catcher = Catching
  end
end

class Strict < Exception; end
p Runner::Catcher
p Runner.new.run { raise Strict, "deep" }
```

Output:

```
Catching
[:caught, "deep"]
```
