---
title: "rescue/instance_exec_scope_test.rb"
slug: rescue-instance-exec-scope-test
description: "The metorex example program rescue/instance_exec_scope_test.rb and its output."
---

`tests/_examples/rescue/instance_exec_scope_test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rescue/instance_exec_scope_test.rb).

```metorex
class Env
  def initialize
    @name = "test_env"
  end
end

class Runner
  def initialize
    @env = Env.new
  end

  def protect(location, &block)
    begin
      @env.instance_exec(&block)
      return true
    rescue Object => exc
      puts "rescued: location=#{location}, exc=#{exc.class}"
      return false
    end
  end
end

r = Runner.new
result = r.protect("my_location") do
  "hello".bad_method
end
puts result
```

Output:

```
rescued: location=my_location, exc=NoMethodError
false
```
