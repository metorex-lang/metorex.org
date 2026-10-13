---
title: "signals/what_answers_a_signal_no_parens.rb"
slug: signals-what-answers-a-signal-no-parens
description: "The metorex example program signals/what_answers_a_signal_no_parens.rb and its output."
---

`tests/_examples/signals/what_answers_a_signal_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/signals/what_answers_a_signal_no_parens.rb).

```metorex
# The same run written without parentheses where they can be left off.
#
# `Signal.trap` says what answers a signal. It takes anything that answers to
# `call` when the signal arrives, hands back what it read there before, and
# refuses the signals a program has no say over.

Signal.trap :HUP, "IGNORE"

answers = Object.new
def answers.call(number)
  puts "answered #{number == Signal.list['HUP']}"
end

p Signal.trap(:HUP, answers)
Process.kill :HUP, Process.pid

# A signal nothing was ever written for is the operating system's to answer.
p Signal.trap("PROF", "DEFAULT")

# The name may be written long or short, as a Symbol or a String, or as the
# number the operating system knows it by.
p Signal.trap(:SIGHUP, "DEFAULT").equal? answers
p Signal.trap(Signal.list["HUP"], "DEFAULT")

# What the interpreter keeps for itself is refused, and so is a number or a
# value that names no signal at all.
begin
  Signal.trap "SEGV", -> {}
rescue ArgumentError => refused
  p refused.message
end

begin
  Signal.trap(300) { }
rescue ArgumentError => refused
  p refused.message
end

begin
  Signal.trap(nil) { }
rescue ArgumentError => refused
  p refused.message
end

# `EXIT` names what to run as the program ends, ahead of what `at_exit` left.
at_exit { puts("at_exit") }
Signal.trap :EXIT, proc { puts "on the way out" }
```

Output:

```
"IGNORE"
answered true
"SYSTEM_DEFAULT"
true
"DEFAULT"
"can't trap reserved signal: SIGSEGV"
"invalid signal number (300)"
"bad signal type NilClass"
on the way out
at_exit
```
