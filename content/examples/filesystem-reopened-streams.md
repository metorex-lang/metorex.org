---
title: "filesystem/reopened_streams.rb"
slug: filesystem-reopened-streams
description: "The metorex example program filesystem/reopened_streams.rb and its output."
---

`tests/_examples/filesystem/reopened_streams.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/filesystem/reopened_streams.rb){target=_blank rel=noopener}.

```metorex
# `IO#reopen` points a stream at another place without changing the object.
# Given a path it opens that file, and given another stream it takes both the
# descriptor and the class of that stream.
require "tmpdir"

first = File.join Dir.tmpdir, "metorex_reopened_first.txt"
second = File.join Dir.tmpdir, "metorex_reopened_second.txt"

File.write first, "first line\n"
File.write second, "second line\n"

reading = File.open first, "r"
held = reading.object_id
p reading.gets
p reading.reopen(second).equal?(reading)
p reading.object_id == held
p reading.gets
p reading.path == second
reading.close

# Written with no mode of its own, the file is opened the way the stream
# already was, so one opened for writing makes the file.
writing = File.open first, "w"
writing.reopen second
writing.print "written through"
writing.close
p File.read second

# Pointed at another stream, the object takes that stream's class.
File.write first, "back again\n"
plain = IO.new IO.sysopen(first, "r"), "r"
named = File.open second, "r"
p named.class
p named.reopen(plain).class
p named.gets
named.close
plain.close

# A stream pointed somewhere else is open again even when it was closed.
closed = File.open first, "r"
closed.close
p closed.closed?
closed.reopen second
p closed.closed?
p closed.close_on_exec?
closed.close

File.delete first
File.delete second
```

Output:

```
"first line\n"
true
true
"second line\n"
true
"written through"
File
IO
"back again\n"
true
false
true
```
