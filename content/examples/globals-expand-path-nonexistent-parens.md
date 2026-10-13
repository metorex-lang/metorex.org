---
title: "globals/expand_path/nonexistent_parens.rb"
slug: globals-expand-path-nonexistent-parens
description: "The metorex example program globals/expand_path/nonexistent_parens.rb and its output."
---

`tests/_examples/globals/expand_path/nonexistent_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/expand_path/nonexistent_parens.rb).

```metorex
# File.expand_path with non-existent path (manual normalization)
result = File.expand_path "/tmp/nonexistent_metorex_test/../foo/bar"
puts result

# With base dir (needs parens for two args on dotted call)
result2 = File.expand_path("baz", "/tmp/base")
puts result2
```

Output:

```
/tmp/foo/bar
/tmp/base/baz
```
