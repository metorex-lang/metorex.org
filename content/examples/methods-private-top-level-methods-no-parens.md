---
title: "methods/private_top_level_methods_no_parens.rb"
slug: methods-private-top-level-methods-no-parens
description: "The metorex example program methods/private_top_level_methods_no_parens.rb and its output."
---

`tests/_examples/methods/private_top_level_methods_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/private_top_level_methods_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A method defined at the top level is a private method of Object, so every
# object answers it from inside and refuses it with a receiver, nil and true
# among them. `send` reaches it and `public_send` does not. A class's own
# methods come ahead of it, so `Dir.mkdir` is not hidden by a top-level
# `mkdir`.
require "tmpdir"

def helper = :top
def mkdir(*) = :top_level_mkdir

[Object.new, "text", 1, [1], nil, true, :name, 1.5, { a: 1 }].each do |receiver|
  p receiver.helper
rescue NoMethodError => error
  p error.message
end
p "text".send(:helper)
p [1.respond_to?(:helper), 1.respond_to?(:helper, true)]
begin
  1.public_send(:helper)
rescue NoMethodError => error
  p error.class
end
p mkdir
Dir.mktmpdir do |root|
  p Dir.mkdir(File.join(root, "made"))
  p Dir.send(:mkdir, File.join(root, "sent"))
  p Dir.exist?(File.join(root, "made"))
end
```

Output:

```
"private method 'helper' called for an instance of Object"
"private method 'helper' called for an instance of String"
"private method 'helper' called for an instance of Integer"
"private method 'helper' called for an instance of Array"
"private method 'helper' called for nil"
"private method 'helper' called for true"
"private method 'helper' called for an instance of Symbol"
"private method 'helper' called for an instance of Float"
"private method 'helper' called for an instance of Hash"
:top
[false, true]
NoMethodError
:top_level_mkdir
0
0
true
```
