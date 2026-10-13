---
title: "c_extensions/c_data_no_parens.rb"
slug: c-extensions-c-data-no-parens
description: "The metorex example program c_extensions/c_data_no_parens.rb and its output."
---

`tests/_examples/c_extensions/c_data_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_data_no_parens.rb).

```metorex
# A C extension wrapping C pointers in objects: typed by an rb_data_type_t
# with a parent, or untyped with a free function, made through a class's
# allocator, and checked by type.
require "tmpdir"
require "objspace"
require_relative "build_helper"

directory = Dir.mktmpdir
require build_extension("c_data.c", "c_data", directory)
data = CData.new

class CDataCounter
  attr_reader :label

  def initialize label
    @label = label
  end
end

class CDataSubcounter < CDataCounter
end

counter = CDataCounter.new("first")
p [counter.count, counter.label, counter.increment.count]
p [CDataSubcounter.new("second").count, CDataCounter.allocate.count]
p ObjectSpace.memsize_of(counter) > 106

typed = data.wrap_typed(1024)
p [data.as_base(typed), data.describe(typed)]
p data.describe(counter)
data.replace typed, 7
p data.as_base(typed)
report { data.as_other typed }
report { data.as_base "text" }
report { data.as_base nil }

untyped = data.wrap_untyped(42)
made = data.make_untyped(9)
p [data.untyped_value(untyped), data.untyped_value(made), data.describe(untyped)]
report { data.as_base untyped }

p [data.check_type(untyped, CData::T_DATA), data.check_type("text", CData::T_STRING)]
report { data.check_type typed, CData::T_DATA }
report { data.check_type 1, CData::T_STRING }
report { data.check_type nil, CData::T_DATA }
report { data.data_ptr_of Object.new }

FileUtils.rm_rf directory
```

Output:

```
[5, "first", 6]
[5, 5]
true
[1024, [true, "counter", true, true]]
[true, "counter", true, true]
7
TypeError: wrong argument type counter (expected other)
TypeError: wrong argument type String (expected base)
TypeError: wrong argument type nil (expected base)
[42, 9, [false, nil, false, true]]
TypeError: wrong argument type Object (expected base)
[true, true]
TypeError: wrong argument type Object (expected Data)
TypeError: wrong argument type Integer (expected String)
TypeError: wrong argument type nil (expected Data)
TypeError: wrong argument type Object (expected Data)
```
