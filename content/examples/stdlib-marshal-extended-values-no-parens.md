---
title: "stdlib/marshal_extended_values_no_parens.rb"
slug: stdlib-marshal-extended-values-no-parens
description: "The metorex example program stdlib/marshal_extended_values_no_parens.rb and its output."
---

`tests/_examples/stdlib/marshal_extended_values_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/marshal_extended_values_no_parens.rb){target=_blank rel=noopener}.

```metorex
module Audited
  def audited? = true
end

# A value such as an Array or a String answers `is_a?` for the modules it
# was extended with, and keeps them through Marshal.
readings = [Object.new].extend Audited
p readings.is_a? Audited
dumped = Marshal.dump readings
loaded = Marshal.load dumped
p loaded.is_a? Audited
p loaded[0].is_a? Audited
label = "meter".dup.extend Audited
dumped = Marshal.dump label
p Marshal.load(dumped).audited?

# A user-marshaled object is extended before `marshal_load` runs.
class Snapshot
  attr_reader :saw_module
  def marshal_dump = :data
  def marshal_load _data
    @saw_module = respond_to? :audited?
  end
end
snapshot = Snapshot.new.extend Audited
dumped = Marshal.dump snapshot
copied = Marshal.load dumped
p copied.saw_module
```

Output:

```
true
true
false
true
false
```
