---
title: "require/load_semantics_parens.rb"
slug: require-load-semantics-parens
description: "The metorex example program require/load_semantics_parens.rb and its output."
---

`tests/_examples/require/load_semantics_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/load_semantics_parens.rb){target=_blank rel=noopener}.

```metorex
$load_count = 0
lib = File.expand_path("load_lib/counted.rb", __dir__)

load(lib)
load(lib)
puts($load_count)
puts($LOADED_FEATURES.include?(lib))

require(lib)
puts($load_count)
require(lib)
puts($load_count)

class PathLike
  def to_path
    File.expand_path "load_lib/counted.rb", File.dirname(__FILE__)
  end
end

load(PathLike.new)
puts($load_count)

begin
  load("./does_not_exist_here.rb")
rescue LoadError => error
  puts(error.message)
end

begin
  load(42)
rescue TypeError => error
  puts(error.message)
end

puts(File::Separator)
puts(Process.euid == Process.uid)
puts(Kernel.private_instance_methods.include?(:load))

wrapper = Module.new
load(File.expand_path("load_lib/wrapped.rb", __dir__), wrapper)
puts(Object.const_defined?(:WRAPPED_CONSTANT))
puts(wrapper.const_get(:WRAPPED_CONSTANT))
puts(wrapper.instance_methods.include?(:wrapped_method))
# A method written at the top level of a wrapped load is private there.
puts(wrapper.private_instance_methods.include?(:wrapped_method))
```

Output:

```
2
false
3
3
4
cannot load such file -- ./does_not_exist_here.rb
no implicit conversion of Integer into String
/
true
true
false
wrapped
false
true
```
