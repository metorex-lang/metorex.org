---
title: "globals/require/test.rb"
slug: globals-require-test
description: "The metorex example program globals/require/test.rb and its output."
---

`tests/_examples/globals/require/test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/require/test.rb).

```metorex
$:.unshift File.expand_path("..", __FILE__)
require "lib"
puts GREETING
```

Output:

```
hello from lib
```
