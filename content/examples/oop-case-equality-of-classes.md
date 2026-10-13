---
title: "oop/case_equality_of_classes.rb"
slug: oop-case-equality-of-classes
description: "The metorex example program oop/case_equality_of_classes.rb and its output."
---

`tests/_examples/oop/case_equality_of_classes.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/case_equality_of_classes.rb){target=_blank rel=noopener}.

```metorex
module M; end
class C; end
class D < C; end

# `Left === right` asks whether the right stands as one of the left, and a
# class is an object of Class just as an instance is an object of its class.
[[Module, String], [Class, String], [String, String], [Module, M], [Class, M],
 [C, D], [C, C], [Object, C], [Comparable, Integer], [Module, Comparable]].each do |left, right|
  puts "#{left} === #{right} -> #{left === right}"
end

puts (Module === M).inspect
puts M.is_a?(Module).inspect

# A program that writes its own Kernel function means that one.
module Kernel
  def p(*objects)
    STDOUT.puts "written here: #{objects.inspect}"
    objects.length == 1 ? objects.first : objects
  end
end
p 1
p 1, 2
```

Output:

```
Module === String -> true
Class === String -> true
String === String -> false
Module === M -> true
Class === M -> false
C === D -> false
C === C -> false
Object === C -> true
Comparable === Integer -> false
Module === Comparable -> true
true
true
written here: [1]
written here: [1, 2]
```
