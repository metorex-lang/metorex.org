---
title: "stdlib/marshal_objects_no_parens.rb"
slug: stdlib-marshal-objects-no-parens
description: "The metorex example program stdlib/marshal_objects_no_parens.rb and its output."
---

`tests/_examples/stdlib/marshal_objects_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/marshal_objects_no_parens.rb).

```metorex
# Marshal writes objects by their class and instance variables, and refuses
# what it could not read back.
Point = Struct.new(:x, :y)
Size = Data.define(:width, :height)
module Labeled; end

class Account
  def initialize
    @owner = "ann".b
  end
end

class Snapshot
  def marshal_dump = [1, 2]
end

class Packed
  def _dump(_limit) = "packed".b
end

p Marshal.dump(Account.new)
p Marshal.dump(Account.new.extend(Labeled))
p Marshal.dump(Point.new(1, 2))
p Marshal.dump(Size.new(width: 3, height: 4))
p Marshal.dump(Account)
p Marshal.dump(Labeled)
p Marshal.dump(Snapshot.new)
p Marshal.dump(Packed.new)

refused = [
  -> { Marshal.dump(Class.new.new) },
  -> { Marshal.dump(Object.new.singleton_class) },
  -> { Marshal.dump(proc { }) },
  -> { Marshal.dump([[[]]], 1) },
  -> { Marshal.dump("text", Object.new) },
]
refused.each do |attempt|
  begin
    attempt.call
  rescue TypeError, ArgumentError => error
    p [error.class, error.message.sub(/0x\h+/, "0x...")]
  end
end

written = []
target = Object.new
target.define_singleton_method(:write) { |bytes| written << bytes }
target.define_singleton_method(:binmode) { written << :binmode }
Marshal.dump :note, target
p written
```

Output:

```
"\x04\bo:\fAccount\x06:\v@owner\"\bann"
"\x04\be:\fLabeledo:\fAccount\x06:\v@owner\"\bann"
"\x04\bS:\nPoint\a:\x06xi\x06:\x06yi\a"
"\x04\bS:\tSize\a:\nwidthi\b:\vheighti\t"
"\x04\bc\fAccount"
"\x04\bm\fLabeled"
"\x04\bU:\rSnapshot[\ai\x06i\a"
"\x04\bu:\vPacked\vpacked"
[TypeError, "can't dump anonymous class #<Class:0x...>"]
[TypeError, "singleton class can't be dumped"]
[TypeError, "no _dump_data is defined for class Proc"]
[ArgumentError, "exceed depth limit"]
[TypeError, "instance of IO needed"]
[:binmode, "\x04\b:\tnote"]
```
