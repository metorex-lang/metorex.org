---
title: "stdlib_libraries/coverage_counted_class.rb"
slug: stdlib-libraries-coverage-counted-class
description: "The metorex example program stdlib_libraries/coverage_counted_class.rb and its output."
---

`tests/_examples/stdlib_libraries/coverage_counted_class.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/coverage_counted_class.rb){target=_blank rel=noopener}.

```metorex
class Counted
  def used
    :used
  end

  def unused
    :unused
  end
end

Counted.new.used
```
