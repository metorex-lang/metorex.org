---
title: "loading/require_same_file/main.rb"
slug: loading-require-same-file-main
description: "The metorex example program loading/require_same_file/main.rb and its output."
---

`tests/_examples/loading/require_same_file/main.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/loading/require_same_file/main.rb).

```metorex
$LOAD_PATH.unshift(__dir__)
p require("helper_once")
p require(File.join(__dir__, "helper_once.rb"))
p require(File.join(__dir__, "helper_once"))
p LOADS
```
