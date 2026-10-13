---
title: "errors/exit_rescued.rb"
slug: errors-exit-rescued
description: "The metorex example program errors/exit_rescued.rb and its output."
---

`tests/_examples/errors/exit_rescued.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/exit_rescued.rb).

```metorex
begin
  exit
rescue SystemExit => error
  puts error.message
  puts error.status
  puts error.success?
end

begin
  exit 42
rescue SystemExit => error
  puts error.status
  puts error.success?
end

begin
  exit(-1)
rescue SystemExit => error
  puts error.status
  puts error.success?
end

begin
  exit false
rescue SystemExit => error
  puts error.status
  puts error.success?
end

begin
  exit(true)
rescue SystemExit => error
  puts error.status
  puts error.success?
end

def leaves
  exit 7
ensure
  puts "ensure ran"
end

begin
  leaves
rescue SystemExit => error
  puts error.status
end

begin
  begin
    exit 3
  rescue StandardError
    puts "should not rescue here"
  end
rescue SystemExit => error
  puts "SystemExit is not a StandardError"
  puts error.class
end
```

Output:

```
exit
0
true
42
false
-1
false
1
false
0
true
ensure ran
7
SystemExit is not a StandardError
SystemExit
```
