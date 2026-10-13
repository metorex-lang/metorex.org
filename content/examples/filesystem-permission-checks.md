---
title: "filesystem/permission_checks.rb"
slug: filesystem-permission-checks
description: "The metorex example program filesystem/permission_checks.rb and its output."
---

`tests/_examples/filesystem/permission_checks.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/filesystem/permission_checks.rb).

```metorex
# A file's permission bits answer `readable?`, `writable?` and `executable?`
# for the user and group the process acts as, and the `_real?` forms for the
# ones it was started as, which are the same here. Setting the real user id to
# the one already held is allowed, and to another one is refused.
require "tmpdir"

Dir.mktmpdir do |root|
  script = File.join(root, "deploy.sh")
  notes = File.join(root, "notes.txt")
  File.write(script, "")
  File.write(notes, "")
  File.chmod(0o755, script)
  File.chmod(0o400, notes)
  p([File.executable?(script), File.executable_real?(script)])
  p([File.executable?(notes), File.executable_real?(notes)])
  p([File.readable_real?(notes), File.writable_real?(notes)])
  stat = File.stat(notes)
  p([stat.readable?, stat.readable_real?, stat.writable?, stat.writable_real?])
end

Process.uid = Process.uid
p(Process.uid == Process.euid)
begin
  Process.uid = 0
rescue Errno::EPERM => error
  p(error.class)
end
```

Output:

```
[true, true]
[false, false]
[true, false]
[true, true, false, false]
true
Errno::EPERM
```
