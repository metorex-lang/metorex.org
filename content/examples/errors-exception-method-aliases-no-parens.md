---
title: "errors/exception_method_aliases_no_parens.rb"
slug: errors-exception-method-aliases-no-parens
description: "The metorex example program errors/exception_method_aliases_no_parens.rb and its output."
---

`tests/_examples/errors/exception_method_aliases_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/exception_method_aliases_no_parens.rb).

```metorex
# A subclass of an exception class can give the class's own methods another
# name, as RubyGems names `SystemExit#status` `exit_code`.
class Leaving < SystemExit
  alias_method :exit_code, :status
  alias_method :clean?, :success?
end

leaving = Leaving.new 3, "closing the ledger"
p [leaving.exit_code, leaving.clean?, Leaving.new(0).clean?]
p leaving.respond_to? :exit_code
p Leaving.instance_method(:exit_code).name
```

Output:

```
[3, false, true]
true
:exit_code
```
