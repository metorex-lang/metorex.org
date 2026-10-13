---
title: "errors/syntax_error/extra_end.rb"
slug: errors-syntax-error-extra-end
description: "The metorex example program errors/syntax_error/extra_end.rb and its output."
---

`tests/_examples/errors/syntax_error/extra_end.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/syntax_error/extra_end.rb).

```metorex
# rubocop:disable Lint/Syntax
def invoice_total(items)
  items.sum(&:price)
  end
end
# rubocop:enable Lint/Syntax
```
