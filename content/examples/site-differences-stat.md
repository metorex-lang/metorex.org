---
title: "site/differences_stat.rb"
slug: site-differences-stat
description: "The metorex example program site/differences_stat.rb and its output."
---

`tests/_examples/site/differences_stat.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/differences_stat.rb).

```metorex
p RubyVM.stat.values.all?(&:zero?)
```

Output:

```
true
```
