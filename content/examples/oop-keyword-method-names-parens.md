---
title: "oop/keyword_method_names_parens.rb"
slug: oop-keyword-method-names-parens
description: "The metorex example program oop/keyword_method_names_parens.rb and its output."
---

`tests/_examples/oop/keyword_method_names_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/keyword_method_names_parens.rb).

```metorex
class Keywords
  def meth
    :original
  end

  alias_method(:alias, :meth)
  alias_method(:until, :meth)
  alias_method(:extend, :meth)
end

subject = Keywords.new
puts(subject.alias.inspect)
puts(subject.until.inspect)
puts(subject.extend.inspect)

def take(first, second)
  [first, second]
end

pair = take(:alias, :meth)
puts(pair.inspect)
```

Output:

```
:original
:original
:original
[:alias, :meth]
```
