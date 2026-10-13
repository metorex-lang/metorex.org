---
title: "backtraces/loaded_file_runner.rb"
slug: backtraces-loaded-file-runner
description: "The metorex example program backtraces/loaded_file_runner.rb and its output."
---

`tests/_examples/backtraces/loaded_file_runner.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/backtraces/loaded_file_runner.rb).

```metorex
module LoadedFileRunner
  def self.load_and_report(path)
    load path
  rescue NameError => error
    error.backtrace.first(2).map { |line| line.sub(/\A.*\//, "") }
  end
end
```
