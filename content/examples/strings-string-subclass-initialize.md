---
title: "strings/string_subclass_initialize.rb"
slug: strings-string-subclass-initialize
description: "The metorex example program strings/string_subclass_initialize.rb and its output."
---

`tests/_examples/strings/string_subclass_initialize.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/string_subclass_initialize.rb){target=_blank rel=noopener}.

```metorex
# A subclass of String that writes its own `initialize` decides what its
# characters are, so `new` hands it arguments that need not be Strings.
class QualifiedName < String
  attr_reader :namespace

  def initialize(name, namespace = "")
    super(name.to_s)
    @namespace = namespace
  end

  def full_name
    self.class.new("#{namespace}#{self}")
  end
end

name = QualifiedName.new(:Crate, "Shipping::")
p(name)
p(name.namespace)
p(name.full_name)
p(name.full_name.class)
p(QualifiedName.new(:Crate) == "Crate")
p(QualifiedName.new(42).length)
```

Output:

```
"Crate"
"Shipping::"
"Shipping::Crate"
QualifiedName
true
2
```
