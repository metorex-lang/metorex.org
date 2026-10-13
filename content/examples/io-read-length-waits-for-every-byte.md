---
title: "io/read_length_waits_for_every_byte.rb"
slug: io-read-length-waits-for-every-byte
description: "The metorex example program io/read_length_waits_for_every_byte.rb and its output."
---

`tests/_examples/io/read_length_waits_for_every_byte.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/io/read_length_waits_for_every_byte.rb).

```metorex
reader, writer = IO.pipe
pid = fork do
  reader.close
  writer.write("a" * 70_000)
  sleep 0.05
  writer.write("b" * 70_000)
  writer.close
  exit!(0)
end
writer.close
first = reader.read(100_000)
rest = reader.read(100_000)
p [first.size, first.count("b"), rest.size, reader.read(10)]
Process.wait(pid)
```

Output:

```
[100000, 30000, 40000, nil]
```
