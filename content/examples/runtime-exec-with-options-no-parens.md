---
title: "runtime/exec_with_options_no_parens.rb"
slug: runtime-exec-with-options-no-parens
description: "The metorex example program runtime/exec_with_options_no_parens.rb and its output."
---

`tests/_examples/runtime/exec_with_options_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/exec_with_options_no_parens.rb).

```metorex
# Process.exec refuses what cannot start, and otherwise replaces this process
# with the command, run the way its options say.
begin
  Process.exec ""
rescue Errno::ENOENT => error
  p error.class
end
begin
  Process.exec __dir__
rescue Errno::EACCES => error
  p error.class
end
begin
  Process.exec "echo\0"
rescue ArgumentError => error
  p error.message
end
begin
  Process.exec ["/bin/sh"], "-c", "true"
rescue ArgumentError => error
  p error.message
end
$stdout.flush
environment = { "GREETING" => "from the environment" }
Process.exec environment, ["/bin/sh", "named_shell"], "-c", 'echo "$0 $GREETING $(pwd)"', chdir: "/"
puts "not reached"
```

Output:

```
Errno::ENOENT
Errno::EACCES
"string contains null byte"
"wrong first argument"
named_shell from the environment /
```
