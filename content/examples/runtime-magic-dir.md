---
title: "runtime/magic_dir.rb"
slug: runtime-magic-dir
description: "The metorex example program runtime/magic_dir.rb and its output."
---

`tests/_examples/runtime/magic_dir.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/magic_dir.rb).

```metorex
puts __dir__.end_with? "tests/_examples/runtime"
puts __dir__ == File.dirname(File.expand_path(__FILE__))

in_eval = eval "__dir__", nil, "foo.rb"
p in_eval
nested = eval "__dir__", nil, "foo/bar.rb"
p nested
with_binding = eval "__dir__", binding
p with_binding
```

Output:

```
true
true
"."
"foo"
nil
```
