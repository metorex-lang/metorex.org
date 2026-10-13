---
title: "errors/no_method_error/missing_setter.rb"
slug: errors-no-method-error-missing-setter
description: "The metorex example program errors/no_method_error/missing_setter.rb and its output."
---

`tests/_examples/errors/no_method_error/missing_setter.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/no_method_error/missing_setter.rb).

```metorex
# Assigning through a setter an object does not define raises NoMethodError,
# the same error a missing method of any other name raises.
class Reading
  attr_reader :value

  def initialize
    @value = 1
  end
end

reading = Reading.new
begin
  reading.value = 2
rescue NoMethodError => error
  puts error.message
  puts error.name.inspect
  puts error.receiver.equal?(reading)
end
puts reading.value
```

Output:

```
undefined method 'value=' for an instance of Reading
:value=
true
1
```
