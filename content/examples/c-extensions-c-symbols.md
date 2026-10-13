---
title: "c_extensions/c_symbols.rb"
slug: c-extensions-c-symbols
description: "The metorex example program c_extensions/c_symbols.rb and its output."
---

`tests/_examples/c_extensions/c_symbols.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_symbols.rb).

```metorex
# A C extension making Symbols from C strings and Ruby strings, reading their
# names back, telling what kind of name one is, and reading encodings.
require "tmpdir"
require_relative "build_helper"

class Spelled
  def to_str
    "spelled"
  end
end

directory = Dir.mktmpdir
require(build_extension("c_symbols.c", "c_symbols", directory))
symbols = CSymbols.new

p([symbols.is_symbol(:name), symbols.is_symbol("name")])
p(symbols.from_bytes("abcdef", 3))
omega = symbols.in_encoding("Ω", Encoding::UTF_8)
p([omega, omega.encoding])
p(symbols.in_encoding("plain", Encoding::UTF_8).encoding)
p(symbols.constant)
p(symbols.zero_ids)
p(symbols.name_of(:named))
p(symbols.name_of("wide".encode(Encoding::UTF_16LE).to_sym).encoding)
p(symbols.from_string("from_string"))
p(symbols.existing("named"))
unseen = "never_made_#{12345 * 7}"
p(symbols.existing(unseen))
p(Symbol.all_symbols.map(&:to_s).include?(unseen))
p([symbols.kinds(:Const), symbols.kinds(:@ivar), symbols.kinds(:@@cvar), symbols.kinds(:plain), symbols.kinds(:"@1")])
p(symbols.text_of(:text))
p([symbols.to_symbol(:held), symbols.to_symbol("given"), symbols.to_symbol(Spelled.new)])
report { symbols.to_symbol(5) }
p([symbols.encoding_name("text"), symbols.encoding_name(:text), symbols.encoding_name(/x/n),
   symbols.encoding_name(Encoding::EUC_JP), symbols.encoding_name(5)])
p(symbols.encoding_name($stdout))
p(symbols.named_encodings)

FileUtils.rm_rf(directory)
```

Output:

```
[true, false]
:abc
[:Ω, #<Encoding:UTF-8>]
#<Encoding:US-ASCII>
:made_constant
[true, false]
"named"
#<Encoding:UTF-16LE>
:from_string
:named
nil
false
[[true, false, false], [false, true, false], [false, false, true], [false, false, false], [false, false, false]]
"text"
[:held, :given, :spelled]
TypeError: 5 is not a symbol nor a string
["UTF-8", "US-ASCII", "US-ASCII", "EUC-JP", nil]
nil
[#<Encoding:UTF-8>, #<Encoding:US-ASCII>, #<Encoding:BINARY (ASCII-8BIT)>]
```
