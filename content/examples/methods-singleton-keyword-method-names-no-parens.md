---
title: "methods/singleton_keyword_method_names_no_parens.rb"
slug: methods-singleton-keyword-method-names-no-parens
description: "The metorex example program methods/singleton_keyword_method_names_no_parens.rb and its output."
---

`tests/_examples/methods/singleton_keyword_method_names_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/singleton_keyword_method_names_no_parens.rb){target=_blank rel=noopener}.

```metorex
class Widget
end

widget = Widget.new

def widget.class
  Integer
end

def widget.begin
  "opened"
end

def widget.nil
  "not really"
end

def widget.[] index
  index * 2
end

def widget.<< other
  "shoveled #{other}"
end

puts widget.class
puts widget.begin
puts widget.nil
puts widget[21]
puts widget << "log"
puts widget.is_a? Widget

class Holder
  def initialize
    @target = Widget.new

    def @target.class
      Float
    end
  end

  def target_class
    @target.class
  end

  def target_is_a_widget
    @target.is_a? Widget
  end
end

holder = Holder.new
puts holder.target_class
puts holder.target_is_a_widget
```

Output:

```
Integer
opened
not really
42
shoveled log
true
Float
true
```
