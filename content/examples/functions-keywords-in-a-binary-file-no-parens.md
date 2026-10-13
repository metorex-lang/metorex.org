---
title: "functions/keywords_in_a_binary_file_no_parens.rb"
slug: functions-keywords-in-a-binary-file-no-parens
description: "The metorex example program functions/keywords_in_a_binary_file_no_parens.rb and its output."
---

`tests/_examples/functions/keywords_in_a_binary_file_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/keywords_in_a_binary_file_no_parens.rb){target=_blank rel=noopener}.

```metorex
# encoding: binary
# Keywords spread from a Hash reach a method as the keywords they are, in a
# file whose text is bytes.
def gather(**keywords)
  keywords
end
options = { width: 3, height: 4 }
p gather(**options)
p gather(**options).keys
```

Output:

```
{width: 3, height: 4}
[:width, :height]
```
