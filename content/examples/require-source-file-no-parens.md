---
title: "require/source_file_no_parens.rb"
slug: require-source-file-no-parens
description: "The metorex example program require/source_file_no_parens.rb and its output."
---

`tests/_examples/require/source_file_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/source_file_no_parens.rb).

```metorex
require_relative "source_file_lib/reporter"

puts Reporter.own_file
puts Reporter.file_from_a_block

module Evaluated
end

puts Evaluated.class_eval "__FILE__", "custom.rb", 7
puts Evaluated.class_eval "__LINE__", "custom.rb", 7
```

Output:

```
reporter.rb
reporter.rb
custom.rb
7
```
