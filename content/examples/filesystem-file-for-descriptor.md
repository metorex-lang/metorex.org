---
title: "filesystem/file_for_descriptor.rb"
slug: filesystem-file-for-descriptor
description: "The metorex example program filesystem/file_for_descriptor.rb and its output."
---

`tests/_examples/filesystem/file_for_descriptor.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/filesystem/file_for_descriptor.rb).

```metorex
# File.for_fd with no mode uses the descriptor the way it was opened.
path = "/tmp/metorex_file_for_descriptor_#{Process.pid}.txt"
opened = File.open(path, "w+")
adopted = File.for_fd(opened.fileno)
adopted.autoclose = false
p(adopted.write("written through the descriptor"))
adopted.close
opened.close
p(File.read(path))
File.delete(path)
```

Output:

```
30
"written through the descriptor"
```
