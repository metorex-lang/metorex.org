---
title: "globals/expand_path/lexical.rb"
slug: globals-expand-path-lexical
description: "The metorex example program globals/expand_path/lexical.rb and its output."
---

`tests/_examples/globals/expand_path/lexical.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/expand_path/lexical.rb){target=_blank rel=noopener}.

```metorex
# expand_path reads the path it was given, never the filesystem, so a
# symlink along the way stands as it was written.
puts(File.expand_path("/usr/../tmp"))
puts(File.expand_path("..", "/one/two/three"))
puts(File.expand_path("/.."))
puts(File.expand_path("./four", "/one/two"))
```

Output:

```
/tmp
/one/two
/
/one/two/four
```
