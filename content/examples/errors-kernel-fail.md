---
title: "errors/kernel_fail.rb"
slug: errors-kernel-fail
description: "The metorex example program errors/kernel_fail.rb and its output."
---

`tests/_examples/errors/kernel_fail.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/kernel_fail.rb).

```metorex
begin
  fail
rescue RuntimeError => error
  puts error.class
end

begin
  fail "the duck is not irish."
rescue => error
  puts error.message
end

class MissingWidget < RuntimeError
end

begin
  fail MissingWidget
rescue MissingWidget => error
  puts error.class
end

begin
  fail MissingWidget, "no widget here"
rescue MissingWidget => error
  puts error.message
end

class Builder
  def exception(message)
    StandardError.new message
  end
end

begin
  fail Builder.new, "built by hand"
rescue StandardError => error
  puts "#{error.class}: #{error.message}"
end

class Sender
  def go
    send :fail, "sent along"
  end
end

begin
  Sender.new.go
rescue RuntimeError => error
  puts error.message
end

puts Kernel.private_instance_methods.include?(:fail)
```

Output:

```
RuntimeError
the duck is not irish.
MissingWidget
no widget here
StandardError: built by hand
sent along
true
```
