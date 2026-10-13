---
title: "require/autoload_reload_warning.rb"
slug: require-autoload-reload-warning
description: "The metorex example program require/autoload_reload_warning.rb and its output."
---

`tests/_examples/require/autoload_reload_warning.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/autoload_reload_warning.rb).

```metorex
module Namespace
  Holder = :placeholder
end

path = File.expand_path("autoload_reload/defines_constant.rb", File.dirname(__FILE__))

registry = Module.new { autoload :VALUE, path }
Namespace::Holder = registry
copy = registry.dup

puts registry.autoload?(:VALUE).nil?.inspect
puts copy.autoload?(:VALUE).nil?.inspect
puts registry::VALUE.inspect

begin
  copy::VALUE
rescue NameError
  puts "copy raises NameError"
end
```

Output:

```
false
false
:loaded
copy raises NameError
```
