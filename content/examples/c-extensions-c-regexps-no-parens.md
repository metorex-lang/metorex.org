---
title: "c_extensions/c_regexps_no_parens.rb"
slug: c-extensions-c-regexps-no-parens
description: "The metorex example program c_extensions/c_regexps_no_parens.rb and its output."
---

`tests/_examples/c_extensions/c_regexps_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_regexps_no_parens.rb).

```metorex
# A C extension making Regexps, matching with them, reading matches and
# $~, comparing bytes without case, and converting values with StringValue.
require "tmpdir"
require_relative "build_helper"

class Text
  def to_str
    "converted"
  end
end

directory = Dir.mktmpdir
require build_extension("c_regexps.c", "c_regexps", directory)
regexps = CRegexps.new

made = regexps.make "b+", Regexp::IGNORECASE
p made
p "aBBc" =~ made
p regexps.make("\xFF".b, 0).source.bytes
p regexps.compile "x(y)"
p regexps.options(/z/mx)

p regexps.match(/é(.)/, "aaéb")
p regexps.last[1]
p regexps.match(/q/, "aaa")
p regexps.last

found = /(a)(b)?(c)/.match "ac"
p [regexps.nth(1, found), regexps.nth(2, found), regexps.nth(3, found), regexps.nth(4, found)]
p [regexps.nth(-1, found), regexps.nth(-3, found), regexps.nth(-4, found), regexps.nth(1, nil)]

regexps.set_last(/k/.match "k")
p $~[0]
regexps.set_last nil
p $~

p [regexps.compare("Hello", "HELLO", 5), regexps.compare("abc", "ABD", 3), regexps.compare("x", "y", 0)]

p regexps.string_value Text.new
report { regexps.string_value 5 }
p regexps.string_pointer "A"
p regexps.c_string_length "four"
report { regexps.c_string_length "a\0b" }
report { regexps.c_string_length "ab\0".encode("UTF-16LE") }
p regexps.c_string_length "ab".encode("UTF-16LE")

FileUtils.rm_rf directory
```

Output:

```
/b+/i
1
[255]
/x(y)/
6
2
"b"
nil
nil
["a", nil, "c", nil]
["c", "a", nil, nil]
"k"
nil
[0, -1, 0]
"converted"
TypeError: no implicit conversion of Integer into String
65
4
ArgumentError: string contains null byte
ArgumentError: string contains null char
1
```
