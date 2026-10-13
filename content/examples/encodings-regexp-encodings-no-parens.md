---
title: "encodings/regexp_encodings_no_parens.rb"
slug: encodings-regexp-encodings-no-parens
description: "The metorex example program encodings/regexp_encodings_no_parens.rb and its output."
---

`tests/_examples/encodings/regexp_encodings_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/regexp_encodings_no_parens.rb){target=_blank rel=noopener}.

```metorex
# The encoding a pattern matches in: the letter written after it, the pieces
# a match cuts out of a string that pairs its bytes, and the strings a
# pattern refuses to match.

euc = "a\xC3\xA9b".dup.force_encoding Encoding::EUC_JP
p euc.length
p euc[1].bytes
p euc[1, 2].bytes
piece = euc[1, 1]
p /./e.match(piece).to_a.map(&:bytes)
p /#{/./}/e.match(euc, 1).begin 0

sjis = "a\x82\xA0\xB1".dup.force_encoding Encoding::Windows_31J
p sjis
p /.\z/s.match(sjis)[0].bytes

p [/./e.encoding, /#{/./}/e.encoding, /./s.encoding, /#{/./}/u.encoding]
p /foo/ensuensuens == /foo/s
p Regexp.allocate.encoding

begin
  /\A\s*\z/.match " ".encode "UTF-16LE"
rescue Encoding::CompatibilityError => error
  p error.message
end

begin
  fixed = Regexp.new "".dup.force_encoding("US-ASCII"), Regexp::FIXEDENCODING
  fixed =~ "é"
rescue Encoding::CompatibilityError => error
  p error.message
end

begin
  broken = "\x80".dup.force_encoding "UTF-8"
  broken =~ /./
rescue ArgumentError => error
  p error.message
end

warned = []
collector = Object.new
collector.define_singleton_method :write do |text|
  warned << text
end
old_stderr = $stderr
$stderr = collector
/./n.match "é"
$stderr = old_stderr
p warned.map { |text| text.sub(/\A.*warning: /, "") }

bytes = <<~TEXT
  \101\x42 \303\251 \xFF
TEXT
p [bytes, bytes.valid_encoding?]
p "\303\251 \xFF".bytes
p "#{1} \xFF".bytes
```

Output:

```
3
[195, 169]
[195, 169, 98]
[[195, 169]]
1
"a\x{82A0}\xB1"
[177]
[#<Encoding:EUC-JP>, #<Encoding:EUC-JP>, #<Encoding:Windows-31J>, #<Encoding:UTF-8>]
true
#<Encoding:BINARY (ASCII-8BIT)>
"incompatible encoding regexp match (US-ASCII regexp with UTF-16LE string)"
"incompatible encoding regexp match (US-ASCII regexp with UTF-8 string)"
"invalid byte sequence in UTF-8"
["historical binary regexp match /.../n against UTF-8 string\n"]
["AB é \xFF\n", false]
[195, 169, 32, 255]
[49, 32, 255]
```
