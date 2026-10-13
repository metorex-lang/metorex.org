---
title: "cli_flags/line_loop_methods_no_parens.rb"
slug: cli-flags-line-loop-methods-no-parens
description: "The metorex example program cli_flags/line_loop_methods_no_parens.rb and its output."
---

`tests/_examples/cli_flags/line_loop_methods_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/cli_flags/line_loop_methods_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Under -n, Kernel answers chomp, chop, sub and gsub as module functions and
# carries them as private instance methods.
print Kernel.public_methods(false).include?(:chomp), " "
print Kernel.private_instance_methods(false).include?(:sub), "\n"
```
