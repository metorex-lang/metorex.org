---
title: "methods/bare_names_over_kernel.rb"
slug: methods-bare-names-over-kernel
description: "The metorex example program methods/bare_names_over_kernel.rb and its output."
---

`tests/_examples/methods/bare_names_over_kernel.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/bare_names_over_kernel.rb).

```metorex
# A bare name inside a class calls the method the class defines under that
# name, ahead of a Kernel function of the same name, whatever parameters it
# takes, and a method that needs arguments refuses the call.
class Report
  def format(pattern = "%s", *values)
    "report #{pattern % values.first.to_s}"
  end

  def to_s
    format
  end
end

print(Report.new)
puts
p("#{Report.new}")

class Speaker
  def puts(words)
    words
  end

  def speak
    puts
  end
end

begin
  Speaker.new.speak
rescue ArgumentError => error
  p(error.message)
end
```

Output:

```
report 
"report "
"wrong number of arguments (given 0, expected 1)"
```
