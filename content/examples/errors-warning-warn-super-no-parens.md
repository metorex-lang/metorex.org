---
title: "errors/warning_warn_super_no_parens.rb"
slug: errors-warning-warn-super-no-parens
description: "The metorex example program errors/warning_warn_super_no_parens.rb and its output."
---

`tests/_examples/errors/warning_warn_super_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/warning_warn_super_no_parens.rb){target=_blank rel=noopener}.

```metorex
$stderr = $stdout

module Warning
  def warn *args, **kwargs
    $stdout.print "rewritten: "
    super
  end
end

warn "maintenance window moves to 02:00"
Warning.warn "rates reload at 03:00\n"
```

Output:

```
rewritten: maintenance window moves to 02:00
rewritten: rates reload at 03:00
```
