---
title: "filesystem/file_for_descriptor_no_parens.rb"
slug: filesystem-file-for-descriptor-no-parens
description: "The metorex example program filesystem/file_for_descriptor_no_parens.rb and its output."
---

`tests/_examples/filesystem/file_for_descriptor_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/filesystem/file_for_descriptor_no_parens.rb){target=_blank rel=noopener}.

```metorex
# File.for_fd with no mode uses the descriptor the way it was opened.
path = "/tmp/metorex_file_for_descriptor_#{Process.pid}.txt"
opened = File.open path, "w+"
adopted = File.for_fd opened.fileno
adopted.autoclose = false
p adopted.write("written through the descriptor")
adopted.close
opened.close
p File.read path
File.delete path
```

Output:

```
30
"written through the descriptor"
```
