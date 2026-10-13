---
title: "runtime/exec_missing_command_parens.rb"
slug: runtime-exec-missing-command-parens
description: "The metorex example program runtime/exec_missing_command_parens.rb and its output."
---

`tests/_examples/runtime/exec_missing_command_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/exec_missing_command_parens.rb).

```metorex
puts(Kernel.private_instance_methods.include?(:exec))

begin
  exec("definitely_not_a_command_xyz")
rescue Errno::ENOENT => error
  puts(error.message)
end

# A command that never started leaves a broken pipe raising, as before.
reader, writer = IO.pipe
reader.close
begin
  writer.write("lost")
rescue Errno::EPIPE => error
  puts(error.class)
end
```

Output:

```
true
No such file or directory - definitely_not_a_command_xyz
Errno::EPIPE
```
