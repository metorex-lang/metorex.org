---
title: "stdlib_libraries/irb_session_no_parens.rb"
slug: stdlib-libraries-irb-session-no-parens
description: "The metorex example program stdlib_libraries/irb_session_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/irb_session_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/irb_session_no_parens.rb).

```metorex
# `binding.irb` reads Ruby from standard input and runs it with the
# binding's locals in scope. Read from a pipe, each statement is written out
# before what it answers. The session ends at `exit`, and the locals it
# changed stay changed.
require "rbconfig"

if ARGV.first == "session"
  total = 10
  binding.irb
  p [:after, total]
  exit
end

statements = <<~RUBY
  total ** 2
  total = 4
  def twice(number) = number * 2
  twice(total)
  [1,
  2]
  missing_name

  exit
RUBY
environment = { "IRBRC" => nil, "HOME" => nil, "XDG_CONFIG_HOME" => nil }
written = IO.popen([environment, RbConfig.ruby, __FILE__, "session"], "r+") do |pipe|
  pipe.write statements
  pipe.close_write
  pipe.read
end
session = written.split("Switch to inspect mode.\n", 2).last
puts session.gsub(/^\S*\(irb\)/, "(irb)").gsub(/^\tfrom .*\n/, "")
```

Output:

```
total ** 2
100
total = 4
4
def twice(number) = number * 2
:twice
twice(total)
8
[1,
  2]
[1, 2]
missing_name
(irb):7:in '<main>': undefined local variable or method 'missing_name' for main (NameError)

exit
[:after, 4]
```
