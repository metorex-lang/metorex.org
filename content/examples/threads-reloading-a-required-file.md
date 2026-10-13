---
title: "threads/reloading_a_required_file.rb"
slug: threads-reloading-a-required-file
description: "The metorex example program threads/reloading_a_required_file.rb and its output."
---

`tests/_examples/threads/reloading_a_required_file.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/reloading_a_required_file.rb).

```metorex
# A file taken back out of the list of what has been loaded is loaded again,
# which is how one file can define a second thing under a second name.
require "tmpdir"

path = File.join Dir.tmpdir, "metorex_reload_#{Process.pid}.rb"
File.write path, "$counted = ($counted || 0) + 1\n"

require path
puts $counted

require path
puts $counted

puts $LOADED_FEATURES.include?(path)
$LOADED_FEATURES.delete path
puts $LOADED_FEATURES.include?(path)

require path
puts $counted

File.unlink path
```

Output:

```
1
1
true
false
2
```
