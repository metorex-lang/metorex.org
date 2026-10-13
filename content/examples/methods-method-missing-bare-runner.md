---
title: "methods/method_missing_bare_runner.rb"
slug: methods-method-missing-bare-runner
description: "The metorex example program methods/method_missing_bare_runner.rb and its output."
---

`tests/_examples/methods/method_missing_bare_runner.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/method_missing_bare_runner.rb){target=_blank rel=noopener}.

```metorex
module BarePredicates
  def method_missing(name, *arguments)
    return "predicate" if name.to_s.start_with?("be_")

    super
  end

  def respond_to_missing?(name, include_private = false)
    name.to_s.start_with?("be_") || super
  end
end
```
