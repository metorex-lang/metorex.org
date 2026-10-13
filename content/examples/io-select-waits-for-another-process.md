---
title: "io/select_waits_for_another_process.rb"
slug: io-select-waits-for-another-process
description: "The metorex example program io/select_waits_for_another_process.rb and its output."
---

`tests/_examples/io/select_waits_for_another_process.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/io/select_waits_for_another_process.rb).

```metorex
require "etc"
p Etc.nprocessors.is_a?(Integer)
pipes = 2.times.map { IO.pipe }
pids = pipes.each_with_index.map do |(reader, writer), index|
  fork do
    pipes.each { |r, _| r.close }
    sleep(index.zero? ? 0.2 : 0.0)
    writer.write("worker #{index}\n")
    writer.close
    exit!(0)
  end
end
pipes.each { |_, w| w.close }
readers = pipes.map(&:first)
received = []
until readers.empty?
  ready, = IO.select(readers)
  ready.each do |reader|
    line = reader.gets
    if line
      received << line.chomp
    else
      readers.delete(reader)
    end
  end
end
pids.each { |pid| Process.wait(pid) }
p received
```

Output:

```
true
["worker 1", "worker 0"]
```
