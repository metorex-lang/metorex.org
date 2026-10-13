---
title: "methods/kernel_function_method_on_a_class.rb"
slug: methods-kernel-function-method-on-a-class
description: "The metorex example program methods/kernel_function_method_on_a_class.rb and its output."
---

`tests/_examples/methods/kernel_function_method_on_a_class.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/kernel_function_method_on_a_class.rb){target=_blank rel=noopener}.

```metorex
puts_method = String.method(:puts)
p [puts_method.name, puts_method.owner]
puts_method.call("called through String")

class Report
  p method(:format).owner
end

module Formatting
  p method(:print).owner
end

Class.new.class_exec { p method(:puts).name }
p String.public_method(:puts) rescue p $!.class
```

Output:

```
[:puts, Kernel]
called through String
Kernel
Kernel
:puts
NameError
```
