---
title: "builtins/defined_extended.rb"
slug: builtins-defined-extended
description: "The metorex example program builtins/defined_extended.rb and its output."
---

`tests/_examples/builtins/defined_extended.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/defined_extended.rb){target=_blank rel=noopener}.

```metorex
# defined? with various expressions
x = 42
puts(defined?(x))

# Method/class
def hello; end
puts(defined?(hello))
puts(defined?(String))
puts(defined?(NonexistentThing))

# Global
$gvar = 1
puts(defined?($gvar))
puts(defined?($nonexistent))

# Instance variable
class Checker
  def initialize
    @val = 10
  end

  def check_ivar
    puts(defined?(@val))
    puts(defined?(@missing))
  end
end
Checker.new.check_ivar()

# Literals
puts(defined?(42))
puts(defined?("hi"))
puts(defined?(nil))
puts(defined?(true))

# yield
def with_block
  puts(defined?(yield))
end

def without_block
  puts(defined?(yield))
end

with_block { "hi" }
without_block()

# Scope resolution
puts(defined?(MSpec::VERSION))
```

Output:

```
local-variable
method
constant

global-variable

instance-variable

expression
expression
nil
true
yield


```
