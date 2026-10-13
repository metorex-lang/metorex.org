---
title: "threads/thread_names_and_backtraces.rb"
slug: threads-thread-names-and-backtraces
description: "The metorex example program threads/thread_names_and_backtraces.rb and its output."
---

`tests/_examples/threads/thread_names_and_backtraces.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/thread_names_and_backtraces.rb).

```metorex
# A named thread shows its name in `to_s`, which is UTF-8 text when the
# name is not plain ASCII.
worker = Thread.new { :done }
worker.join
worker.name = "pump-1"
p worker.to_s.include?("@pump-1")
p worker.to_s.encoding
worker.name = "pümp"
p worker.to_s.encoding

# `Thread#raise` with a backtrace calls the exception's own
# `set_backtrace` in the thread that raised it.
class TracedError < StandardError
  attr_accessor :log
  def initialize(*arguments)
    @log = []
    super
  end

  def set_backtrace(lines)
    @log << [Thread.current == Thread.main, lines]
    super
  end
end
sleeper = Thread.new { sleep }
Thread.pass until sleeper.stop?
handed = TracedError.new
sleeper.report_on_exception = false
sleeper.raise(handed, "stopped", ["pump.rb:9"])
begin
  sleeper.join
rescue TracedError => caught
  p caught.backtrace
end
p handed.log
```

Output:

```
true
#<Encoding:BINARY (ASCII-8BIT)>
#<Encoding:UTF-8>
["pump.rb:9"]
[[true, ["pump.rb:9"]]]
```
