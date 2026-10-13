---
title: "backtraces/loaded_file_test.rb"
slug: backtraces-loaded-file-test
description: "The metorex example program backtraces/loaded_file_test.rb and its output."
---

`tests/_examples/backtraces/loaded_file_test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/backtraces/loaded_file_test.rb).

```metorex
require_relative "loaded_file_runner"

puts LoadedFileRunner.load_and_report(File.join(__dir__, "loaded_file_raises.rb"))

begin
  load File.join(__dir__, "loaded_file_raises.rb")
rescue NameError => error
  puts error.backtrace.first(2).map { |line| line.sub(/\A.*\//, "") }
end
```
