---
title: "runtime/process_title_no_parens.rb"
slug: runtime-process-title-no-parens
description: "The metorex example program runtime/process_title_no_parens.rb and its output."
---

`tests/_examples/runtime/process_title_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/process_title_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Process.setproctitle changes the command a process listing shows, and
# leaves $0 as it was.
title = "metorex-title-example"
p Process.setproctitle(title)
p $0 == title
```

Output:

```
"metorex-title-example"
false
```
