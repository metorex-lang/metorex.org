---
title: "stdlib/marshal_wrapped_values.rb"
slug: stdlib-marshal-wrapped-values
description: "The metorex example program stdlib/marshal_wrapped_values.rb and its output."
---

`tests/_examples/stdlib/marshal_wrapped_values.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/marshal_wrapped_values.rb).

```metorex
# Marshal writes a String, Regexp, Array or Hash with what it carries: its
# encoding and instance variables, the modules it was extended with, and its
# class when that is a subclass.
module Tagged; end
class Words < Array; end
class Table < Hash; end

p(Marshal.dump("text"))
p(Marshal.dump("text".b))
p(Marshal.dump(:"→"))
p(Marshal.dump(/a./i))
p(Marshal.dump([].extend(Tagged)))
p(Marshal.dump(Words.new))
p(Marshal.dump(Hash.new(0)))
p(Marshal.dump({}.compare_by_identity))
p(Marshal.dump(Table.new))

noted = "note"
noted.instance_variable_set(:@by, "me")
p(Marshal.dump(noted))

begin
  Marshal.dump(Hash.new { |hash, key| key })
rescue TypeError => error
  p(error.message)
end
```

Output:

```
"\x04\bI\"\ttext\x06:\x06ET"
"\x04\b\"\ttext"
"\x04\bI:\b\xE2\x86\x92\x06:\x06ET"
"\x04\bI/\aa.\x01\x06:\x06EF"
"\x04\be:\vTagged[\x00"
"\x04\bC:\nWords[\x00"
"\x04\b}\x00i\x00"
"\x04\bC:\tHash{\x00"
"\x04\bC:\nTable{\x00"
"\x04\bI\"\tnote\a:\x06ET:\b@byI\"\ame\x06;\x00T"
"can't dump hash with default proc"
```
