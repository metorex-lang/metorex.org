---
title: "functions/splat_class_parens.rb"
slug: functions-splat-class-parens
description: "The metorex example program functions/splat_class_parens.rb and its output."
---

`tests/_examples/functions/splat_class_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/splat_class_parens.rb).

```metorex
class Logger
  def initialize(prefix)
    @prefix = prefix
  end

  def log(*messages)
    messages.each do |m|
      puts @prefix + ": " + m
    end
  end
end

l = Logger.new("APP")
l.log("start", "running", "stop")

# Splat forwarding
def forward(*args)
  puts args.length
  args.each do |a|
    puts a
  end
end

forward 1, 2, 3
```

Output:

```
APP: start
APP: running
APP: stop
3
1
2
3
```
