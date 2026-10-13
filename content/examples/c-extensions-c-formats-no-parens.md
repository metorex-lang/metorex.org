---
title: "c_extensions/c_formats_no_parens.rb"
slug: c-extensions-c-formats-no-parens
description: "The metorex example program c_extensions/c_formats_no_parens.rb and its output."
---

`tests/_examples/c_extensions/c_formats_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_formats_no_parens.rb).

```metorex
# A C extension formatting text the way rb_sprintf, rb_raise and rb_warn do,
# with PRIsVALUE writing a VALUE's to_s, or its inspect with the + flag.
require "tmpdir"
require "stringio"
require_relative "build_helper"

class Odd
  def to_s
    5
  end
end

directory = Dir.mktmpdir
require build_extension("c_formats.c", "c_formats", directory)
formats = CFormats.new

p formats.numbers
p formats.floats
p formats.texts "café"
p formats.texts("café").encoding
p formats.texts :sym
p formats.numbers.encoding
p formats.pointer_text
p formats.unknown
p formats.appended(+"one")
report { formats.raised ArgumentError, [1, 2] }
report { formats.raised KeyError, nil }

$stderr = StringIO.new
$VERBOSE = false
formats.warned "this"
$VERBOSE = true
formats.warned "that"
$VERBOSE = nil
formats.warned "nothing"
warned = $stderr.string
$stderr = STDERR
puts warned.gsub(/^.*\//, "").gsub(File.basename(__FILE__), "example.rb")
$VERBOSE = false

p formats.bytes
p formats.bytes.map(&:encoding).uniq
p formats.as_strings 12
p formats.as_strings "text"
p formats.as_strings(Odd.new)[0].start_with? "#<Odd"

FileUtils.rm_rf directory
```

Output:

```
"-7|   42|3   |00009|123456789012|-5|4000000000|ff|FF|10|17|-2|z|%"
"3.14|1.500000e+03|0.0001|   2.500|1.250000"
"plain|abc|ab    |[café]|[\"café\"]"
#<Encoding:UTF-8>
"plain|abc|ab    |[sym]|[:sym]"
#<Encoding:BINARY (ASCII-8BIT)>
true
"y and "
"one and 2 more"
ArgumentError: bad [1, 2] at 7
KeyError: bad  at 7
example.rb:31: warning: careful with this
example.rb:33: warning: careful with that
example.rb:33: warning: only when verbose: 1
["a\x00b", "c string", ""]
[#<Encoding:BINARY (ASCII-8BIT)>]
["12", "12"]
["text", "\"text\""]
true
```
