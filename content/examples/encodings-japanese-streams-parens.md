---
title: "encodings/japanese_streams_parens.rb"
slug: encodings-japanese-streams-parens
description: "The metorex example program encodings/japanese_streams_parens.rb and its output."
---

`tests/_examples/encodings/japanese_streams_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/japanese_streams_parens.rb).

```metorex
# ISO-2022-JP writes its Japanese runs between escapes rather than tagging
# bytes, so a run of text comes back the way it was written. The other
# encodings the specs name each spell their own bytes too.
held = "abcあdef"
written = held.encode(Encoding::ISO_2022_JP)
p(written.bytes)
p(written.encode(Encoding::UTF_8) == held)

# Every named encoding rewrites the bytes rather than re-tagging them.
["Shift_JIS", "EUC-JP", "UTF-16BE", "IBM437", "macCyrillic", "IBM720"].each do |named|
  begin
    spelled = "é".encode named
    p([named, spelled.bytes])
  rescue Encoding::UndefinedConversionError
    p([named, :undefined])
  end
end

# A name keeps the encoding it was interned in, bytes and all.
name = "あ".encode("EUC-JP").to_sym
p(name.encoding)
p(name.to_s.bytes)

# A run of bytes its encoding cannot read names no symbol at all.
broken = [0xa4].pack("C*")
begin
  broken.force_encoding("EUC-JP").to_sym
rescue EncodingError => problem
  p(problem.class)
end
```

Output:

```
[97, 98, 99, 27, 36, 66, 36, 34, 27, 40, 66, 100, 101, 102]
true
["Shift_JIS", :undefined]
["EUC-JP", [143, 171, 177]]
["UTF-16BE", [0, 233]]
["IBM437", [130]]
["macCyrillic", :undefined]
["IBM720", [130]]
#<Encoding:EUC-JP>
[164, 162]
EncodingError
```
