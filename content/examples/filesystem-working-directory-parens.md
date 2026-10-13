---
title: "filesystem/working_directory_parens.rb"
slug: filesystem-working-directory-parens
description: "The metorex example program filesystem/working_directory_parens.rb and its output."
---

`tests/_examples/filesystem/working_directory_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/filesystem/working_directory_parens.rb).

```metorex
# `Dir.chdir` names the directory the program works from, taking the name
# through `to_path`, and a `Dir` handle changes to the directory it names.
require "tmpdir"

Dir.mktmpdir do |scratch|
  Dir.mkdir(File.join(scratch, "inner"))

  named = Object.new
  named.define_singleton_method(:to_path) do
    File.join(scratch, "inner")
  end

  outside = Dir.pwd
  Dir.chdir(scratch) do
    p(Dir.pwd == File.realpath(scratch))
  end
  p(Dir.pwd == outside)

  p(Dir.chdir(named))
  p(File.basename(Dir.pwd))
  Dir.chdir(outside)

  handle = Dir.new(File.join(scratch, "inner"))
  p(handle.chdir { File.basename(Dir.pwd) })
  handle.close

  begin
    Dir.chdir(File.join(scratch, "missing"))
  rescue Errno::ENOENT => problem
    puts(problem.class)
  end
end
```

Output:

```
true
true
0
"inner"
"inner"
Errno::ENOENT
```
