---
title: "site/c_extensions_nkf.rb"
slug: site-c-extensions-nkf
description: "The metorex example program site/c_extensions_nkf.rb and its output."
---

`tests/_examples/site/c_extensions_nkf.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/c_extensions_nkf.rb){target=_blank rel=noopener}.

```metorex
require "nkf"

greeting = "こんにちは、世界".encode("Shift_JIS")
p greeting.bytesize
p NKF.guess(greeting)
p NKF.nkf("-w", greeting)
p NKF.nkf("-w --hiragana", "カタカナ")
```

Output:

```
16
#<Encoding:Shift_JIS>
"こんにちは、世界"
"かたかな"
```
