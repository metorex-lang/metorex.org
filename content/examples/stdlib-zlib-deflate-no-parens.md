---
title: "stdlib/zlib_deflate_no_parens.rb"
slug: stdlib-zlib-deflate-no-parens
description: "The metorex example program stdlib/zlib_deflate_no_parens.rb and its output."
---

`tests/_examples/stdlib/zlib_deflate_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/zlib_deflate_no_parens.rb){target=_blank rel=noopener}.

```metorex
require "zlib"

# The bytes zlib itself writes, which a program storing compressed data and
# reading it back elsewhere depends on.
puts Zlib::Deflate.deflate(Array.new(10, 0).pack "C*").bytes.join ","
puts Zlib.deflate("1111111111").bytes.join ","
puts Zlib::Deflate.deflate("\0" * 32 * 1024).bytesize

writer = Zlib::Deflate.new
writer.set_dictionary "aaaaaaaaaa"
writer << "abcdefghij"
puts writer.finish.bytes.join ","

# A fixed code for a short run, a dynamic code where one pays for itself, and
# a stored block where neither does.
["abcabcabcabc", "The quick brown fox jumps over the lazy dog. " * 50].each do |text|
  packed = Zlib::Deflate.deflate(text)
  puts "#{text.bytesize} -> #{packed.bytesize}"
  puts Zlib.inflate(packed) == text
end

puts Zlib.gzip("12345abcde", level: 6).bytes.last(8).join ","
puts Zlib.gunzip(Zlib.gzip("round trip")) == "round trip"
```

Output:

```
120,156,99,96,128,1,0,0,10,0,1
120,156,51,52,132,1,0,10,145,1,235
52
120,187,20,225,3,203,75,76,74,78,73,77,75,207,200,204,2,0,21,134,3,248
12 -> 13
true
2250 -> 72
true
157,5,0,36,10,0,0,0
true
```
