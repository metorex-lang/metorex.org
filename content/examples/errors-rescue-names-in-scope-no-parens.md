---
title: "errors/rescue_names_in_scope_no_parens.rb"
slug: errors-rescue-names-in-scope-no-parens
description: "The metorex example program errors/rescue_names_in_scope_no_parens.rb and its output."
---

`tests/_examples/errors/rescue_names_in_scope_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/rescue_names_in_scope_no_parens.rb){target=_blank rel=noopener}.

```metorex
# The same as `rescue_names_in_scope.rb`, written without parentheses.
# A name in a rescue clause is read where it was written, so a method of a
# nested class reaches an exception class the enclosing module holds by its
# simple name.
module Store
  class Missing < StandardError; end

  class Shelf
    def fetch(name)
      raise Missing, "nothing named #{name}"
    end

    def fetch_or_default(name)
      fetch(name)
    rescue Missing => trouble
      trouble.message
    end
  end
end

p Store::Shelf.new.fetch_or_default("tea")

# `__dir__` names the directory holding the file the code was written in,
# which is the same directory `__FILE__` sits in even inside a block.
here = -> { __dir__ }
p here.call == File.dirname(File.expand_path(__FILE__))

# A Regexp subclass carries the pattern it was built with and answers
# Regexp's methods through it.
class Loose < Regexp; end
loose = Loose.new "ab", Regexp::IGNORECASE
p loose.class
p loose.source
p loose.options
p loose.match?("AB")
```

Output:

```
"nothing named tea"
true
Loose
"ab"
1
true
```
