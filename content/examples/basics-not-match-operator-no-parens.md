---
title: "basics/not_match_operator_no_parens.rb"
slug: basics-not-match-operator-no-parens
description: "The metorex example program basics/not_match_operator_no_parens.rb and its output."
---

`tests/_examples/basics/not_match_operator_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/not_match_operator_no_parens.rb){target=_blank rel=noopener}.

```metorex
puts ("hello" !~ /ell/).inspect
puts ("hello" !~ /xyz/).inspect
puts (/ell/ !~ "hello").inspect

class Matcher
  def =~ other
    other == :expected
  end
end

matcher = Matcher.new
puts (matcher !~ :expected).inspect
puts (matcher !~ :other).inspect

class Overridden
  def !~ other
    :custom
  end
end

overridden = Overridden.new !~ :anything
puts overridden.inspect

begin
  Object.new !~ :foo
rescue NoMethodError => error
  puts "#{error.class}: #{error.message}"
end

begin
  42 !~ 99
rescue NoMethodError => error
  puts error.message
end
```

Output:

```
false
true
false
false
true
:custom
NoMethodError: undefined method '=~' for an instance of Object
undefined method '=~' for an instance of Integer
```
