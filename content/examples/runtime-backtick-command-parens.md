---
title: "runtime/backtick_command_parens.rb"
slug: runtime-backtick-command-parens
description: "The metorex example program runtime/backtick_command_parens.rb and its output."
---

`tests/_examples/runtime/backtick_command_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/backtick_command_parens.rb){target=_blank rel=noopener}.

```metorex
target = "world"

output = `echo hello #{target}`
p(output)
p($?.exitstatus)
p($?.success?)
p($?.exited?)
p($?.stopped?)
p($?.class)

`exit 7`
p($?.exitstatus)
p($?.success?)

p(Kernel.`("echo through the module"))

class Command
  def to_str
    "echo coerced"
  end
end

p(Kernel.`(Command.new))

begin
  `nonexistent_command_xyz 2>/dev/null`
rescue Errno::ENOENT => error
  puts(error.message)
end

p(Kernel.private_instance_methods.include?(:`))
p(:`)
```

Output:

```
"hello world\n"
0
true
true
false
Process::Status
7
false
"through the module\n"
"coerced\n"
No such file or directory - nonexistent_command_xyz 2>/dev/null
true
:`
```
