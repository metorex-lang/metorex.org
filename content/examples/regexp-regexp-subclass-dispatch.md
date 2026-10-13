---
title: "regexp/regexp_subclass_dispatch.rb"
slug: regexp-regexp-subclass-dispatch
description: "The metorex example program regexp/regexp_subclass_dispatch.rb and its output."
---

`tests/_examples/regexp/regexp_subclass_dispatch.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/regexp/regexp_subclass_dispatch.rb).

```metorex
# A Regexp subclass's own methods answer before Regexp's, and `super`
# reaches the pattern it was built with.
class LoggedPattern < Regexp
  def match(*arguments)
    puts "match #{arguments.inspect}"
    super
  end

  def source
    "logged:#{super}"
  end
end

pattern = LoggedPattern.new("m.")
p pattern.match("meter")[0]
p pattern.source

# String#match hands the work to the pattern.
p "meter".match(pattern)[0]

# A subclass instance built by `new` is not frozen, and `initialize` on it
# again refuses.
p pattern.frozen?
begin
  pattern.send(:initialize, "x")
rescue TypeError => problem
  p problem.message
end
```

Output:

```
match ["meter"]
"me"
"logged:m."
match ["meter"]
"me"
false
"already initialized regexp"
```
