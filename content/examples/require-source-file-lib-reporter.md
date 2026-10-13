---
title: "require/source_file_lib/reporter.rb"
slug: require-source-file-lib-reporter
description: "The metorex example program require/source_file_lib/reporter.rb and its output."
---

`tests/_examples/require/source_file_lib/reporter.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/source_file_lib/reporter.rb).

```metorex
# The file a method was written in is what __FILE__ names inside it, wherever
# the method is later called from.
module Reporter
  def self.own_file
    __FILE__.split("/").last
  end

  def self.file_from_a_block
    [1].map { __FILE__.split("/").last }.first
  end
end
```
