---
title: "oop/singleton_class_assignment_no_parens.rb"
slug: oop-singleton-class-assignment-no-parens
description: "The metorex example program oop/singleton_class_assignment_no_parens.rb and its output."
---

`tests/_examples/oop/singleton_class_assignment_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/singleton_class_assignment_no_parens.rb){target=_blank rel=noopener}.

```metorex
class << $receiver = Object.new
  def greet
    :hello
  end

  def shout
    :HELLO
  end
end

puts $receiver.greet.inspect
puts $receiver.shout.inspect
singleton_names = $receiver.methods false
puts singleton_names.sort.inspect

class Holder
  def build
    class << @target = Object.new
      def describe
        :built
      end
    end
    @target
  end
end

holder = Holder.new
built = holder.build
puts built.describe.inspect

plain = Object.new
class << plain
  def still_works
    :yes
  end
end
puts plain.still_works.inspect

names = %i[alpha beta gamma]
puts names.inspect
puts names.first.class.name
words = %w[alpha beta]
puts words.first.class.name
parens = %i(one two)
puts parens.inspect
```

Output:

```
:hello
:HELLO
[:greet, :shout]
:built
:yes
[:alpha, :beta, :gamma]
Symbol
String
[:one, :two]
```
