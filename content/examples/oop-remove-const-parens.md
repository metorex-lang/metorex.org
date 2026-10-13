---
title: "oop/remove_const_parens.rb"
slug: oop-remove-const-parens
description: "The metorex example program oop/remove_const_parens.rb and its output."
---

`tests/_examples/oop/remove_const_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/remove_const_parens.rb){target=_blank rel=noopener}.

```metorex
module Holder
  KEPT = :kept
  DOOMED = :doomed
  ALSO = :also
end

class Heir
  include(Holder)
end

class NameSource
  def to_str
    "ALSO"
  end
end

puts(Holder.send(:remove_const, :DOOMED).inspect)
puts(Holder.send(:remove_const, NameSource.new).inspect)
puts(Holder.constants.inspect)

["name", "__CONSTX__", "@Name", "Name=", "Missing"].each do |name|
  begin
    Holder.send(:remove_const, name)
    puts "#{name}: removed"
  rescue NameError
    puts "#{name}: NameError"
  end
end

begin
  Heir.send(:remove_const, :KEPT)
rescue NameError
  puts "inherited: NameError"
end

module Lazy
  autoload(:Later, "a_file")
end
puts(Lazy.send(:remove_const, :Later).inspect)

puts(Module.private_methods.include?(:remove_const).inspect)
puts(Module.public_instance_methods.include?(:alias_method).inspect)
```

Output:

```
:doomed
:also
[:KEPT]
name: NameError
__CONSTX__: NameError
@Name: NameError
Name=: NameError
Missing: NameError
inherited: NameError
nil
true
true
```
