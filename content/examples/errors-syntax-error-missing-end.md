---
title: "errors/syntax_error/missing_end.rb"
slug: errors-syntax-error-missing-end
description: "The metorex example program errors/syntax_error/missing_end.rb and its output."
---

`tests/_examples/errors/syntax_error/missing_end.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/syntax_error/missing_end.rb){target=_blank rel=noopener}.

```metorex
# rubocop:disable Lint/Syntax
class Kennel
  def admit(dog)
    dogs << dog

  def release(dog)
    dogs.delete(dog)
  end
end
# rubocop:enable Lint/Syntax
```
