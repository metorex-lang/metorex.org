---
title: "eval/binding_paths.rb"
slug: eval-binding-paths
description: "The metorex example program eval/binding_paths.rb and its output."
---

`tests/_examples/eval/binding_paths.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/eval/binding_paths.rb){target=_blank rel=noopener}.

```metorex
# A binding and the code eval'd through it name the script by the path it
# was run with, the way __FILE__ does.
held = binding
p(held.source_location == [__FILE__, 3])
p(held.eval("__FILE__") == "(eval at #{__FILE__}:5)")
p(Object.new.instance_eval("__FILE__") == "(eval at #{__FILE__}:6)")
p(eval("__FILE__") == "(eval at #{__FILE__}:7)")
```

Output:

```
true
true
true
true
```
