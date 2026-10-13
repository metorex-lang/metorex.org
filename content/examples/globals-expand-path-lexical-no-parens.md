---
title: "globals/expand_path/lexical_no_parens.rb"
slug: globals-expand-path-lexical-no-parens
description: "The metorex example program globals/expand_path/lexical_no_parens.rb and its output."
---

`tests/_examples/globals/expand_path/lexical_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/expand_path/lexical_no_parens.rb).

```metorex
# expand_path reads the path it was given, never the filesystem, so a
# symlink along the way stands as it was written.
puts File.expand_path "/usr/../tmp"
puts File.expand_path "..", "/one/two/three"
puts File.expand_path "/.."
puts File.expand_path "./four", "/one/two"
```

Output:

```
/tmp
/one/two
/
/one/two/four
```
