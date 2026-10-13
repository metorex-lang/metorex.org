---
title: "functions/keywords_in_a_binary_file.rb"
slug: functions-keywords-in-a-binary-file
description: "The metorex example program functions/keywords_in_a_binary_file.rb and its output."
---

`tests/_examples/functions/keywords_in_a_binary_file.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/keywords_in_a_binary_file.rb).

```metorex
# encoding: binary
# Keywords spread from a Hash reach a method as the keywords they are, in a
# file whose text is bytes.
def gather(**keywords)
  keywords
end
options = { width: 3, height: 4 }
p(gather(**options))
p(gather(**options).keys)
```

Output:

```
{width: 3, height: 4}
[:width, :height]
```
