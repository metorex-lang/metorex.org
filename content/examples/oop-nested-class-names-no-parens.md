---
title: "oop/nested_class_names_no_parens.rb"
slug: oop-nested-class-names-no-parens
description: "The metorex example program oop/nested_class_names_no_parens.rb and its output."
---

`tests/_examples/oop/nested_class_names_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/nested_class_names_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A class nested in a class can inherit from the class holding it.
class Parser
  def name = "parser"

  class Lexer < ::Parser
  end

  class Scanner < Parser
  end
end
p Parser::Lexer.superclass
p Parser::Scanner.superclass
p Parser::Lexer.new.name

# Each class Struct.new answers is its own class.
Token = Struct.new(:type, :text)
Event = Struct.new(:name, :args)
token = Token.new(:ident, "x")
p token.is_a?(Token)
p token.is_a?(Event)
p Event === token
p Class.new(Struct) === token

# A method calls itself by name alone.
class Countdown
  def initialize(from)
    @from = from
  end

  def steps
    return [] if @from.zero?

    current = @from
    @from -= 1
    [current] + steps
  end
end
p Countdown.new(4).steps
```

Output:

```
Parser
Parser
"parser"
true
false
false
false
[4, 3, 2, 1]
```
