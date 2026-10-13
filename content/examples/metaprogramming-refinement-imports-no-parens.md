---
title: "metaprogramming/refinement_imports_no_parens.rb"
slug: metaprogramming-refinement-imports-no-parens
description: "The metorex example program metaprogramming/refinement_imports_no_parens.rb and its output."
---

`tests/_examples/metaprogramming/refinement_imports_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/refinement_imports_no_parens.rb).

```metorex
require 'zlib'

text_helpers = Module.new do
  def indent level
    " " * level + self
  end

  def indent_with_dot level
    indent(level) + "."
  end
end

padded = Module.new do
  refine String do
    import_methods text_helpers
  end
end

Module.new do
  using padded
  puts "foo".indent_with_dot 3
  puts String.instance_method(:indent).owner.equal?(padded.refinements.first)
end

doubler = Class.new do
  def scale number
    2 * number
  end
end

quadrupling = Module.new do
  def scale number
    super * 2
  end
end

scaled = Module.new do
  refine doubler do
    import_methods quadrupling
  end
end

written = Module.new do
  refine doubler do
    def scale number
      super + 1
    end
  end
end

Module.new do
  using scaled
  puts doubler.new.scale 2
end

Module.new do
  using written
  puts doubler.new.scale 2
end

Module.new do
  refine String do
    [Integer, Kernel, Zlib].each do |source|
      begin
        import_methods source
      rescue TypeError, ArgumentError => error
        puts "#{error.class}: #{error.message.sub(/#\w+\z/, '#...')}"
      end
    end
  end
end

holder = Class.new do
  include Zlib

  def checksum text
    crc32 text
  end
end
puts holder.new.checksum("abc") == Zlib.crc32("abc")
puts Zlib.method(:crc32).source_location.first

def Warning.warn message
  puts message[/has ancestors.*/]
end
with_ancestors = Module.new do
  include Comparable
end
Module.new do
  refine String do
    import_methods with_ancestors
  end
end
```

Output:

```
   foo.
true
8
5
TypeError: wrong argument type Class (expected Module)
ArgumentError: Can't import method which is not defined with Ruby code: Kernel#...
ArgumentError: Can't import method which is not defined with Ruby code: Zlib#...
true
<metorex>/zlib.rb
has ancestors, but Refinement#import_methods doesn't import their methods
```
