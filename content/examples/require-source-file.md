---
title: "require/source_file.rb"
slug: require-source-file
description: "The metorex example program require/source_file.rb and its output."
---

`tests/_examples/require/source_file.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/source_file.rb){target=_blank rel=noopener}.

```metorex
require_relative "source_file_lib/reporter"

puts Reporter.own_file
puts Reporter.file_from_a_block

module Evaluated
end

puts Evaluated.class_eval("__FILE__", "custom.rb", 7)
puts Evaluated.class_eval("__LINE__", "custom.rb", 7)
```

Output:

```
reporter.rb
reporter.rb
custom.rb
7
```
