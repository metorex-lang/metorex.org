---
title: "dsl/keyword_arg_options.rb"
slug: dsl-keyword-arg-options
description: "The metorex example program dsl/keyword_arg_options.rb and its output."
---

`tests/_examples/dsl/keyword_arg_options.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/dsl/keyword_arg_options.rb).

```metorex
def receive_options(name, options = nil)
  if options.nil?
    puts "options is nil"
  else
    puts "options.class = #{options.class}"
    puts "options[:shared] = #{options[:shared]}"
    puts "options[\"shared\"] = #{options["shared"]}"
  end
end

receive_options("a", shared: true)
receive_options("b", { shared: true })
receive_options("c")
```

Output:

```
options.class = Hash
options[:shared] = true
options["shared"] = 
options.class = Hash
options[:shared] = true
options["shared"] = 
options is nil
```
