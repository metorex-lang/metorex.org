---
title: "stdlib_libraries/logging_to_the_system.rb"
slug: stdlib-libraries-logging-to-the-system
description: "The metorex example program stdlib_libraries/logging_to_the_system.rb and its output."
---

`tests/_examples/stdlib_libraries/logging_to_the_system.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/logging_to_the_system.rb){target=_blank rel=noopener}.

```metorex
# The system log, and a binding as a scope a program can reach into.

require 'syslog'

p Syslog.opened?
Syslog.open "metorex_example", Syslog::LOG_PID
p Syslog.opened?
p Syslog.ident
p Syslog.options == Syslog::LOG_PID
p Syslog.facility == Syslog::LOG_USER
p Syslog.mask
Syslog.mask = Syslog::Constants.LOG_UPTO Syslog::LOG_WARNING
p Syslog.mask
Syslog.close
p Syslog.opened?
p Syslog.mask

# The mask bit one severity stands for.
p Syslog::Constants.LOG_MASK Syslog::LOG_DEBUG
p Syslog::Constants.LOG_MASK Syslog::LOG_WARNING

# Leaving a log nobody has opened is refused.
begin
  Syslog.close
rescue RuntimeError => problem
  p problem.message
end

# A binding names the locals in force where it was taken, and code run
# through it leaves what it binds behind.
first = 1
second = 2
held = binding
p held.local_variables.include? :first
p held.local_variable_get :first
held.local_variable_set :third, 3
p held.local_variable_get :third
p held.local_variable_defined? :third
p held.local_variable_defined? :fourth
held.eval "fourth = 4"
p held.local_variable_get :fourth
p held.source_location.last > 0
```

Output:

```
false
true
"metorex_example"
true
true
255
31
false
nil
128
16
"syslog not opened"
true
1
3
true
false
4
true
```
