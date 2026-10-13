---
title: "errors/script_errors_past_bare_rescue.rb"
slug: errors-script-errors-past-bare-rescue
description: "The metorex example program errors/script_errors_past_bare_rescue.rb and its output."
---

`tests/_examples/errors/script_errors_past_bare_rescue.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/script_errors_past_bare_rescue.rb).

```metorex
# A bare `rescue` and the `rescue` modifier catch StandardError and what
# descends from it. LoadError and NotImplementedError are ScriptErrors, so
# they go past both to a handler that names them.
def attempt
  begin
    yield
  rescue => error
    "bare rescue caught #{error.class}"
  end
rescue ScriptError => error
  "ScriptError handler caught #{error.class}"
end

p(attempt { require("no_such_feature_for_this_example") })
p(attempt { raise(NotImplementedError, "not here") })
p(attempt { raise(ArgumentError, "bad") })
p(attempt { Integer("x") })
p(LoadError.ancestors.include?(StandardError))
p(NotImplementedError.ancestors.include?(ScriptError))

value = begin
  (require("no_such_feature_for_this_example") rescue :modifier_caught)
rescue LoadError
  :passed_the_modifier
end
p(value)
p((raise(ArgumentError) rescue :modifier_caught))
```

Output:

```
"ScriptError handler caught LoadError"
"ScriptError handler caught NotImplementedError"
"bare rescue caught ArgumentError"
"bare rescue caught ArgumentError"
false
true
:passed_the_modifier
:modifier_caught
```
