---
title: "metaprogramming/class_exec_splat_parameter.rb"
slug: metaprogramming-class-exec-splat-parameter
description: "The metorex example program metaprogramming/class_exec_splat_parameter.rb and its output."
---

`tests/_examples/metaprogramming/class_exec_splat_parameter.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/class_exec_splat_parameter.rb){target=_blank rel=noopener}.

```metorex
body = proc do |*options|
  options = options.first || {}

  define_method(:first) { :ran } unless options[:skip]
  p options
end

Class.new.class_exec(&body)
Class.new.class_exec({ skip: true }, &body)
```

Output:

```
{}
{skip: true}
```
