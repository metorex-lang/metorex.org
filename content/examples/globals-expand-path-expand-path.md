---
title: "globals/expand_path/expand_path.rb"
slug: globals-expand-path-expand-path
description: "The metorex example program globals/expand_path/expand_path.rb and its output."
---

`tests/_examples/globals/expand_path/expand_path.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/expand_path/expand_path.rb){target=_blank rel=noopener}.

```metorex
puts File.expand_path("lib")
puts File.expand_path("../../../lib", __FILE__)
```

Output:

```
/Users/gd/workspace/metorex-lang/metorex/lib
/Users/gd/workspace/metorex-lang/metorex/tests/_examples/lib
```
