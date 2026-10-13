---
title: "runtime/release_named_no_parens.rb"
slug: runtime-release-named-no-parens
description: "The metorex example program runtime/release_named_no_parens.rb and its output."
---

`tests/_examples/runtime/release_named_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/release_named_no_parens.rb).

```metorex
# The release metorex reports is the MRI release it follows.
p RUBY_VERSION
p RUBY_PATCHLEVEL
p RUBY_RELEASE_DATE
p Ruby::VERSION == RUBY_VERSION
```

Output:

```
"4.0.6"
0
"2026-07-14"
true
```
