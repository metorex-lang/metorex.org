---
title: "cli_flags/end_data_parens.rb"
slug: cli-flags-end-data-parens
description: "The metorex example program cli_flags/end_data_parens.rb and its output."
---

`tests/_examples/cli_flags/end_data_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/cli_flags/end_data_parens.rb){target=_blank rel=noopener}.

```metorex
# A line reading `__END__` closes the code, and `DATA` reads the text after it
# as a file positioned where that text begins.
p(DATA.class)
p(DATA.pos > 0)
p(DATA.read)
DATA.rewind
p(DATA.gets)
__END__
first line
second line
```
