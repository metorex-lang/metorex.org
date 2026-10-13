---
title: "runtime/magic_dir_parens.rb"
slug: runtime-magic-dir-parens
description: "The metorex example program runtime/magic_dir_parens.rb and its output."
---

`tests/_examples/runtime/magic_dir_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/magic_dir_parens.rb).

```metorex
puts(__dir__.end_with?("tests/_examples/runtime"))
puts(__dir__ == File.dirname(File.expand_path(__FILE__)))

in_eval = eval("__dir__", nil, "foo.rb")
p(in_eval)
nested = eval("__dir__", nil, "foo/bar.rb")
p(nested)
with_binding = eval("__dir__", binding)
p(with_binding)
```

Output:

```
true
true
"."
"foo"
nil
```
