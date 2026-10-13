---
title: "oop/public_instance_method_parens.rb"
slug: oop-public-instance-method-parens
description: "The metorex example program oop/public_instance_method_parens.rb and its output."
---

`tests/_examples/oop/public_instance_method_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/public_instance_method_parens.rb){target=_blank rel=noopener}.

```metorex
module Base
  def open_method
  end

  protected

  def guarded
  end

  private

  def hidden
  end
end

module Layer
  include(Base)

  def layer_method
  end
end

from_base = Layer.public_instance_method(:open_method)
puts(from_base.owner.inspect)
puts((from_base.owner == Base).inspect)

from_layer = Layer.public_instance_method(:layer_method)
puts((from_layer.owner == Layer).inspect)
puts((Base.public_instance_method("open_method") == Base.public_instance_method(:open_method)).inspect)

[:guarded, :hidden, :missing].each do |name|
  begin
    Base.public_instance_method(name)
  rescue NameError => error
    puts "#{name}: #{error.name.inspect}"
  end
end

begin
  Module.new.public_instance_method(nil)
rescue TypeError => error
  puts(error.message)
end

puts(Module.new.method(:public_instance_method).arity.inspect)
```

Output:

```
Base
true
true
true
guarded: :guarded
hidden: :hidden
missing: :missing
nil is not a symbol nor a string
1
```
