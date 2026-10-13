---
title: "runtime/dir_chdir_parens.rb"
slug: runtime-dir-chdir-parens
description: "The metorex example program runtime/dir_chdir_parens.rb and its output."
---

`tests/_examples/runtime/dir_chdir_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/dir_chdir_parens.rb).

```metorex
start = Dir.pwd

Dir.chdir "/tmp" do
  puts((Dir.pwd == "/tmp") || (Dir.pwd == "/private/tmp"))
end

puts(Dir.pwd == start)

Dir.chdir("/tmp")
puts((Dir.pwd == "/tmp") || (Dir.pwd == "/private/tmp"))
Dir.chdir(start)
puts(Dir.pwd == start)

begin
  Dir.chdir("/no/such/directory/here")
rescue SystemCallError => error
  puts(error.message.start_with?("No such file or directory"))
end

answer = Dir.chdir("/tmp") { 42 }
puts(answer)
```

Output:

```
true
true
true
true
true
42
```
