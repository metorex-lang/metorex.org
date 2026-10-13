---
title: "basics/readline_and_readlines_no_parens.rb"
slug: basics-readline-and-readlines-no-parens
description: "The metorex example program basics/readline_and_readlines_no_parens.rb and its output."
---

`tests/_examples/basics/readline_and_readlines_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/readline_and_readlines_no_parens.rb).

```metorex
puts Kernel.private_instance_methods(false).include? :gets
puts Kernel.private_instance_methods(false).include? :readline
puts Kernel.private_instance_methods(false).include? :readlines

puts EOFError.superclass.name
puts EOFError.ancestors.include? StandardError

# With no input to read, `gets` answers nil and `readlines` is empty, while
# `readline` refuses and raises.
puts gets.inspect
puts readlines.inspect

begin
  readline
rescue EOFError => error
  puts "#{error.class}: #{error.message}"
end

begin
  readline(1)
rescue EOFError => error
  puts "with a limit: #{error.message}"
end
```

Output:

```
true
true
true
IOError
true
nil
[]
EOFError: end of file reached
with a limit: end of file reached
```
