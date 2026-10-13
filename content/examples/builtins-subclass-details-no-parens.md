---
title: "builtins/subclass_details_no_parens.rb"
slug: builtins-subclass-details-no-parens
description: "The metorex example program builtins/subclass_details_no_parens.rb and its output."
---

`tests/_examples/builtins/subclass_details_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/subclass_details_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Details Marshal reads from the values it writes.
p Encoding.find("sjis")
p Encoding::CP932

class Text < String; end
p Text.new.encoding

pattern = Regexp.new("")
pattern.instance_variable_set :@note, :kept
p pattern.instance_variable_get(:@note)

class Pattern < Regexp; end
p Pattern.new("a").encoding

class Counts < Hash
  def initialize(label)
    @label = label
  end
end
p Counts.new(7).default
```

Output:

```
#<Encoding:Windows-31J>
#<Encoding:Windows-31J>
#<Encoding:BINARY (ASCII-8BIT)>
:kept
#<Encoding:US-ASCII>
nil
```
