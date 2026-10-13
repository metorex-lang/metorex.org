---
title: "errors/warning_warn_super.rb"
slug: errors-warning-warn-super
description: "The metorex example program errors/warning_warn_super.rb and its output."
---

`tests/_examples/errors/warning_warn_super.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/warning_warn_super.rb).

```metorex
$stderr = $stdout

module Warning
  def warn(*args, **kwargs)
    $stdout.print("rewritten: ")
    super
  end
end

warn("maintenance window moves to 02:00")
Warning.warn("rates reload at 03:00\n")
```

Output:

```
rewritten: maintenance window moves to 02:00
rewritten: rates reload at 03:00
```
