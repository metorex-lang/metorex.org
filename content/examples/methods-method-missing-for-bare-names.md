---
title: "methods/method_missing_for_bare_names.rb"
slug: methods-method-missing-for-bare-names
description: "The metorex example program methods/method_missing_for_bare_names.rb and its output."
---

`tests/_examples/methods/method_missing_for_bare_names.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/method_missing_for_bare_names.rb){target=_blank rel=noopener}.

```metorex
module Predicates
  def method_missing(name, *arguments)
    if name.to_s.start_with?("be_")
      "predicate #{name.to_s.delete_prefix('be_')}#{arguments.empty? ? '' : " #{arguments.inspect}"}"
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    name.to_s.start_with?("be_") || super
  end
end

class Checker
  include Predicates

  def check = be_valid
end

checker = Checker.new
puts checker.check
puts checker.instance_exec { be_paid }
puts checker.instance_exec { be_within(3) }
puts Class.new(Checker).new.instance_exec { be_empty }

begin
  checker.instance_exec { not_a_predicate }
rescue NameError => error
  puts error.class
end
```

Output:

```
predicate valid
predicate paid
predicate within [3]
predicate empty
NameError
```
