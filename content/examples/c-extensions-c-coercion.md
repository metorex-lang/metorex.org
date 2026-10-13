---
title: "c_extensions/c_coercion.rb"
slug: c-extensions-c-coercion
description: "The metorex example program c_extensions/c_coercion.rb and its output."
---

`tests/_examples/c_extensions/c_coercion.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_coercion.rb).

```metorex
# A C extension comparing and coercing numbers the way MRI's numeric
# functions do, and reading C shorts and chars out of Ruby values.
require "tmpdir"
require_relative "build_helper"

class Pairing
  def initialize(answer)
    @answer = answer
  end

  def coerce(other)
    @answer.respond_to?(:call) ? @answer.call(other) : @answer
  end
end

class Signed
  def initialize(sign)
    @sign = sign
  end

  def >(other)
    @sign > other
  end

  def <(other)
    @sign < other
  end
end

directory = Dir.mktmpdir
require(build_extension("c_coercion.c", "c_coercion", directory))
coercion = CCoercion.new

report { coercion.compare_error(1, nil) }
report { coercion.compare_error("a", 2.5) }
report { coercion.compare_error(:a, :b) }
report { coercion.compare_error([], Object.new) }
report { coercion.divide_error }

p([coercion.sign(5), coercion.sign(-5), coercion.sign(0), coercion.sign(2**70), coercion.sign(-(2**70)), coercion.sign(2**70 - 2**70)])
p([coercion.sign(Signed.new(1)), coercion.sign(Signed.new(-1)), coercion.sign(Signed.new(0)), coercion.sign(1.5)])
report { coercion.sign(nil) }

p(coercion.binary(2, Pairing.new([10, 5])))
report { coercion.binary(2, Object.new) }
report { coercion.binary(2, nil) }
report { coercion.binary(2, Pairing.new([1])) }
report { coercion.binary(2, Pairing.new(nil)) }
p(coercion.compared(2, Pairing.new([1, 3])))
p(coercion.compared(2, Pairing.new(nil)))
p(coercion.compared(2, Object.new))
p(coercion.related(2, Pairing.new([1, 3])))
report { coercion.related(2, Pairing.new(nil)) }
report { coercion.related(2, Pairing.new(->(_) { [Object.new, 1] })) }

p([coercion.integer("42"), coercion.integer(3.9)])
report { coercion.integer("forty") }
p([coercion.short_of(32767), coercion.short_of(-32768), coercion.short_of(4.9)])
report { coercion.short_of(32768) }
report { coercion.short_of(-32769) }
p([coercion.character("Abc"), coercion.character(0xa7c), coercion.character(-1)])
report { coercion.character("") }
p([coercion.single_bit(0), coercion.single_bit(8), coercion.single_bit(-8), coercion.single_bit(6), coercion.single_bit(2**70), coercion.single_bit(2**70 + 1)])
p(coercion.long_long_size)

FileUtils.rm_rf(directory)
```

Output:

```
ArgumentError: comparison of Integer with nil failed
ArgumentError: comparison of String with 2.5 failed
ArgumentError: comparison of Symbol with :b failed
ArgumentError: comparison of Array with Object failed
ZeroDivisionError: divided by 0
[1, -1, 0, 1, -1, 0]
[1, -1, 0, 1]
ArgumentError: comparison of Integer with 2 failed: comparator returned nil
15
TypeError: Object can't be coerced into Integer
TypeError: nil can't be coerced into Integer
TypeError: coerce must return [x, y]
TypeError: coerce must return [x, y]
-1
nil
nil
true
ArgumentError: comparison of Integer with Pairing failed: coercion was not possible
NoMethodError: undefined method '<' for an instance of Object
[42, 3]
ArgumentError: invalid value for Integer(): "forty"
[32767, -32768, 4]
RangeError: integer 32768 too big to convert to 'short'
RangeError: integer -32769 too small to convert to 'short'
[65, 124, 255]
TypeError: no implicit conversion of String into Integer
[0, 1, 1, 0, 1, 0]
8
```
