---
title: "encodings/encoding_names.rb"
slug: encodings-encoding-names
description: "The metorex example program encodings/encoding_names.rb and its output."
---

`tests/_examples/encodings/encoding_names.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/encoding_names.rb){target=_blank rel=noopener}.

```metorex
# Each encoding answers the names Ruby gives it: its own, then the aliases
# that stand for it. Encoding.find takes any of them, and Encoding.name_list
# lists them in the order Ruby registered them.
# The names that follow the machine's locale are left out, since they name
# whatever encoding the locale does.
LOCALE_NAMES = %w[locale external filesystem]

%w[US-ASCII UTF-8 Shift_JIS ISO-2022-JP UTF-7 GB2312 IBM720 Big5-HKSCS].each do |name|
  encoding = Encoding.find(name)
  puts("#{encoding.name}: #{(encoding.names - LOCALE_NAMES).inspect}")
end

%w[646 eucJP CP932 ebcdic-cp-us Big5-HKSCS:2008 EUC-CN cp720].each do |alias_name|
  puts("#{alias_name} -> #{Encoding.find(alias_name).name}")
end

p(Encoding.name_list.first(12))
p(Encoding.name_list.last(5))
p(Encoding.list.size)
p(Encoding.aliases["646"])
p(Encoding::CP720)
p("text".force_encoding("eucJP").encoding)
```

Output:

```
US-ASCII: ["US-ASCII", "ASCII", "ANSI_X3.4-1968", "646"]
UTF-8: ["UTF-8", "CP65001"]
Shift_JIS: ["Shift_JIS"]
ISO-2022-JP: ["ISO-2022-JP", "ISO2022-JP"]
UTF-7: ["UTF-7", "CP65000"]
GB2312: ["GB2312", "EUC-CN", "eucCN"]
IBM720: ["IBM720", "CP720"]
Big5-HKSCS: ["Big5-HKSCS", "Big5-HKSCS:2008"]
646 -> US-ASCII
eucJP -> EUC-JP
CP932 -> Windows-31J
ebcdic-cp-us -> IBM037
Big5-HKSCS:2008 -> Big5-HKSCS
EUC-CN -> GB2312
cp720 -> IBM720
["ASCII-8BIT", "UTF-8", "US-ASCII", "UTF-16BE", "UTF-16LE", "UTF-32BE", "UTF-32LE", "UTF-16", "UTF-32", "UTF8-MAC", "EUC-JP", "Windows-31J"]
["SJIS-SoftBank", "locale", "external", "filesystem", "internal"]
103
"US-ASCII"
#<Encoding:IBM720>
#<Encoding:EUC-JP>
```
