---
title: "loading/carried_library_features.rb"
slug: loading-carried-library-features
description: "The metorex example program loading/carried_library_features.rb and its output."
---

`tests/_examples/loading/carried_library_features.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/loading/carried_library_features.rb){target=_blank rel=noopener}.

```metorex
p require("nkf")
p require("nkf")
require "json"
p $LOADED_FEATURES.grep(/nkf|json\.rb/).map { |feature| File.basename(feature, ".*") }
p $LOADED_FEATURES.any? { |feature| feature.end_with?("/json.rb") }
```

Output:

```
true
false
["nkf", "nkf", "json"]
true
```
