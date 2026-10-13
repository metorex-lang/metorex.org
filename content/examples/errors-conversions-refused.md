---
title: "errors/conversions_refused.rb"
slug: errors-conversions-refused
description: "The metorex example program errors/conversions_refused.rb and its output."
---

`tests/_examples/errors/conversions_refused.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/conversions_refused.rb).

```metorex
# nil, true, false and a String answer to_f and to_r, yet a number is not
# read from them where Ruby wants one.
attempts = {
  "1.coerce(nil)" => -> { 1.coerce(nil) },
  "1.coerce(true)" => -> { 1.coerce(true) },
  "1.coerce(:name)" => -> { 1.coerce(:name) },
  "1.coerce(1..2)" => -> { 1.coerce(1..2) },
  "1.fdiv(nil)" => -> { 1.fdiv(nil) },
  "1.fdiv(\"2\")" => -> { 1.fdiv("2") },
  "[nil].pack(\"D\")" => -> { [nil].pack("D") },
  "[\"1.5\"].pack(\"e\")" => -> { ["1.5"].pack("e") },
  "[true].pack(\"f\")" => -> { [true].pack("f") },
  "sleep(\"2\")" => -> { sleep("2") },
  "Time.at(0) + nil" => -> { Time.at(0) + nil },
  "Time.at(0) - nil" => -> { Time.at(0) - nil },
}
attempts.each do |written, attempt|
  attempt.call
rescue TypeError => error
  puts("#{written}: #{error.message}")
end
p(1.coerce("2"))
```

Output:

```
1.coerce(nil): can't convert nil into Float
1.coerce(true): can't convert true into Float
1.coerce(:name): can't convert Symbol into Float
1.coerce(1..2): can't convert Range into Float
1.fdiv(nil): nil can't be coerced into Integer
1.fdiv("2"): String can't be coerced into Integer
[nil].pack("D"): can't convert nil into Float
["1.5"].pack("e"): can't convert String into Float
[true].pack("f"): can't convert true into Float
sleep("2"): can't convert String into time interval
Time.at(0) + nil: can't convert NilClass into an exact number
Time.at(0) - nil: can't convert NilClass into an exact number
[2.0, 1.0]
```
