---
title: "stdlib/marshal_extended_values.rb"
slug: stdlib-marshal-extended-values
description: "The metorex example program stdlib/marshal_extended_values.rb and its output."
---

`tests/_examples/stdlib/marshal_extended_values.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/marshal_extended_values.rb){target=_blank rel=noopener}.

```metorex
module Audited
  def audited? = true
end

# A value such as an Array or a String answers `is_a?` for the modules it
# was extended with, and keeps them through Marshal.
readings = [Object.new].extend(Audited)
p readings.is_a?(Audited)
loaded = Marshal.load(Marshal.dump(readings))
p loaded.is_a?(Audited)
p loaded[0].is_a?(Audited)
label = "meter".dup.extend(Audited)
p Marshal.load(Marshal.dump(label)).audited?

# A user-marshaled object is extended before `marshal_load` runs.
class Snapshot
  attr_reader :saw_module
  def marshal_dump = :data
  def marshal_load(_data)
    @saw_module = respond_to?(:audited?)
  end
end
copied = Marshal.load(Marshal.dump(Snapshot.new.extend(Audited)))
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
