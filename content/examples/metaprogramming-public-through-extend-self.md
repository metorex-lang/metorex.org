---
title: "metaprogramming/public_through_extend_self.rb"
slug: metaprogramming-public-through-extend-self
description: "The metorex example program metaprogramming/public_through_extend_self.rb and its output."
---

`tests/_examples/metaprogramming/public_through_extend_self.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/public_through_extend_self.rb).

```metorex
# `public` in a singleton class makes public a method the object reaches only
# through a module mixed into the module it extends itself with, as a
# module of commands that hides some of its helpers does.
module Quiet
  private

  def nothing(*) end

  alias_method :pwd, :nothing
end

module Commands
  include Quiet
  extend self

  class << self
    public :pwd
  end
end

p(Commands.respond_to?(:pwd))
p(Commands.pwd)
p(Commands.singleton_class.public_method_defined?(:pwd))
p(Commands.singleton_class.private_method_defined?(:pwd))

class Mixed
  include Quiet
  public :pwd
end

class Narrowed < Mixed
  private :pwd
end

p([Mixed.public_method_defined?(:pwd), Mixed.private_method_defined?(:pwd)])
p([Narrowed.public_method_defined?(:pwd), Narrowed.private_method_defined?(:pwd)])
```

Output:

```
true
nil
true
false
[true, false]
[false, true]
```
