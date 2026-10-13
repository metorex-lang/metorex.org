---
title: "methods/method_missing_bare_backtrace.rb"
slug: methods-method-missing-bare-backtrace
description: "The metorex example program methods/method_missing_bare_backtrace.rb and its output."
---

`tests/_examples/methods/method_missing_bare_backtrace.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/method_missing_bare_backtrace.rb){target=_blank rel=noopener}.

```metorex
require_relative "method_missing_bare_runner"

class Checker
  include BarePredicates

  def check = acount
end

begin
  Checker.new.check
rescue NameError => error
  puts error.backtrace.first(3).map { |line| line.sub(/\A.*\//, "") }
end

class ExplicitChecker
  include BarePredicates

  def check = self.acount
end

begin
  ExplicitChecker.new.check
rescue NoMethodError => error
  puts error.backtrace.first(2).map { |line| line.sub(/\A.*\//, "") }
end
```

Output:

```
method_missing_bare_runner.rb:5:in 'BarePredicates#method_missing'
method_missing_bare_backtrace.rb:6:in 'Checker#check'
method_missing_bare_backtrace.rb:10:in '<main>'
method_missing_bare_runner.rb:5:in 'BarePredicates#method_missing'
method_missing_bare_backtrace.rb:18:in 'ExplicitChecker#check'
```
