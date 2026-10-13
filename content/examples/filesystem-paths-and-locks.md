---
title: "filesystem/paths_and_locks.rb"
slug: filesystem-paths-and-locks
description: "The metorex example program filesystem/paths_and_locks.rb and its output."
---

`tests/_examples/filesystem/paths_and_locks.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/filesystem/paths_and_locks.rb){target=_blank rel=noopener}.

```metorex
# `dirname` drops the last part of a path, and a level says how many parts
# to drop.
puts File.dirname("/home/jason/poot.txt")
puts File.dirname("/home/jason/poot.txt", 2)
puts File.dirname("/////foo/bar/")
puts File.dirname("poot.txt")
puts File.dirname("/foo/../.")

# A lock on a whole file, taken and let go.
path = File.join(Dir.tmpdir, "metorex_lock_example")
File.write(path, "held")
File.open(path, "r+") do |stream|
  puts stream.flock(File::LOCK_EX).to_s
  puts stream.flock(File::LOCK_UN).to_s
end
File.delete(path)
```

Output:

```
/home/jason
/home
/foo
.
/foo/..
0
0
```
