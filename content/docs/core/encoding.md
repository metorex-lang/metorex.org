---
title: "Encoding"
slug: encoding
description: "The methods ruby/spec describes in core/encoding, and which Metorex implements."
---

ruby/spec describes 46 methods in `core/encoding`, and Metorex implements 45 of them. The parameters are what `Method#parameters` answers under Metorex.

## Encoding

- **`Encoding#_dump`**: implemented, parameters `[[:rest]]`.
- **`Encoding._load`**: implemented, parameters `[[:req, :args]]`.
- **`Encoding.aliases`**: implemented, parameters `[[:req, :args]]`. Returns the hash of available encoding alias and original encoding name. [An example calling it](/examples/encodings-encoding-names).
- **`Encoding#ascii_compatible?`**: implemented, parameters `[]`. Returns whether ASCII-compatible or not.
- **`Encoding.compatible?`**: implemented, parameters `[[:req, :args]]`. Checks the compatibility of two objects. [An example calling it](/examples/encodings-negotiation).
- **`Encoding.default_external`**: implemented, parameters `[[:req, :args]]`. Returns default external encoding. [An example calling it](/examples/encodings-c-locale).
- **`Encoding.default_external=`**: implemented, parameters `[[:req, :args]]`. Sets default external encoding.
- **`Encoding.default_internal`**: implemented, parameters `[[:req, :args]]`. Returns default internal encoding. [An example calling it](/examples/encodings-missing-converters).
- **`Encoding.default_internal=`**: implemented, parameters `[[:req, :args]]`. Sets default internal encoding or removes default internal encoding when passed nil.
- **`Encoding#dummy?`**: implemented, parameters `[]`. Returns true for dummy encodings. [An example calling it](/examples/encodings-converting-through-jis).
- **`Encoding.find`**: implemented, parameters `[[:rest]]`. Search the encoding with specified *name*. [An example calling it](/examples/encodings-c-locale).
- **`Encoding#inspect`**: implemented, parameters `[]`. Returns a string which represents the encoding for programmers. [An example calling it](/examples/encodings-c-locale).
- **`Encoding.list`**: implemented, parameters `[[:req, :args]]`. Returns the list of loaded encodings. [An example calling it](/examples/encodings-encoding-names).
- **`Encoding.locale_charmap`**: implemented, parameters `[]`. Returns the locale charmap name.
- **`Encoding#name`**: implemented, parameters `[]`. The name of the encoding. [An example calling it](/examples/encodings-encoding-names).
- **`Encoding.name_list`**: implemented, parameters `[]`. Returns the list of available encoding names. [An example calling it](/examples/encodings-encoding-names).
- **`Encoding#names`**: implemented, parameters `[]`. Returns the list of name and aliases of the encoding. [An example calling it](/examples/encodings-encoding-names).
- **`Encoding#replicate`**: not implemented.
- **`Encoding#to_s`**: implemented, parameters `[]`. The name of the encoding. [An example calling it](/examples/encodings-encoding-fallbacks).

## Encoding::Converter

- **`Encoding::Converter.asciicompat_encoding`**: implemented, parameters `[[:req, :held]]`. Returns the corresponding ASCII compatible encoding. [An example calling it](/examples/builtins-encoding-converter-paths).
- **`Encoding::Converter#convert`**: implemented, parameters `[[:req, :text]]`. Convert source_string and return destination_string. [An example calling it](/examples/builtins-encoding-converter-converting).
- **`Encoding::Converter#convpath`**: implemented, parameters `[]`. Returns the conversion path of ec. [An example calling it](/examples/builtins-encoding-converter-paths).
- **`Encoding::Converter#destination_encoding`**: implemented, parameters `[]`. Returns the destination encoding as an Encoding object. [An example calling it](/examples/builtins-encoding-converter-paths).
- **`Encoding::Converter#finish`**: implemented, parameters `[]`. Finishes the converter. [An example calling it](/examples/encodings-converting-through-jis).
- **`Encoding::Converter#insert_output`**: implemented, parameters `[[:req]]`. Inserts string into the encoding converter.
- **`Encoding::Converter#inspect`**: implemented, parameters `[]`. Returns a printable version of *ec* `ec = Encoding::Converter.new("iso-8859-1", "utf-8")`. [An example calling it](/examples/addresses-internet-addresses).
- **`Encoding::Converter#last_error`**: implemented, parameters `[]`. Returns an exception object for the last conversion. [An example calling it](/examples/encodings-converter-stepwise).
- **`Encoding::Converter.new`**: implemented, parameters `[[:rest]]`. possible options elements: [An example calling it](/examples/builtins-encoding-converter-converting).
- **`Encoding::Converter#primitive_convert`**: implemented, parameters `[[:req, :source], [:req, :destination], [:opt, :destination_byteoffset], [:opt, :destination_bytesize], [:opt, :options]]`. possible opt elements: [An example calling it](/examples/encodings-converter-stepwise).
- **`Encoding::Converter#primitive_errinfo`**: implemented, parameters `[]`. primitive_errinfo returns important information regarding the last error as a 5-element array: [An example calling it](/examples/encodings-converter-stepwise).
- **`Encoding::Converter#putback`**: implemented, parameters `[[:opt, :count]]`. Put back the bytes which will be converted. [An example calling it](/examples/encodings-held-back-bytes).
- **`Encoding::Converter#replacement`**: implemented, parameters `[]`. Returns the replacement string. [An example calling it](/examples/builtins-encoding-converter-paths).
- **`Encoding::Converter#replacement=`**: implemented, parameters `[[:req, :held]]`. Sets the replacement string.
- **`Encoding::Converter.search_convpath`**: implemented, parameters `[[:req, :source], [:req, :destination], [:opt, :options]]`. Returns a conversion path. [An example calling it](/examples/builtins-encoding-converter-paths).
- **`Encoding::Converter#source_encoding`**: implemented, parameters `[]`. Returns the source encoding as an Encoding object. [An example calling it](/examples/builtins-encoding-converter-paths).

## Encoding::InvalidByteSequenceError

- **`Encoding::InvalidByteSequenceError#destination_encoding`**: implemented, parameters `[]`. Returns the destination encoding as an encoding object. [An example calling it](/examples/builtins-encoding-converter-paths).
- **`Encoding::InvalidByteSequenceError#destination_encoding_name`**: implemented, parameters `[]`. Returns the destination encoding name as a string. [An example calling it](/examples/builtins-encoding-converter-converting).
- **`Encoding::InvalidByteSequenceError#error_bytes`**: implemented, parameters `[]`. Returns the discarded bytes when Encoding::InvalidByteSequenceError occurs. [An example calling it](/examples/builtins-encoding-converter-converting).
- **`Encoding::InvalidByteSequenceError#incomplete_input?`**: implemented, parameters `[]`. Returns true if the invalid byte sequence error is caused by premature end of string.
- **`Encoding::InvalidByteSequenceError#readagain_bytes`**: implemented, parameters `[]`. Returns the bytes to be read again when Encoding::InvalidByteSequenceError occurs. [An example calling it](/examples/builtins-encoding-converter-converting).
- **`Encoding::InvalidByteSequenceError#source_encoding`**: implemented, parameters `[]`. Returns the source encoding as an encoding object. [An example calling it](/examples/builtins-encoding-converter-paths).

## Encoding::UndefinedConversionError

- **`Encoding::UndefinedConversionError#destination_encoding`**: implemented, parameters `[]`. Returns the destination encoding as an encoding object. [An example calling it](/examples/builtins-encoding-converter-paths).
- **`Encoding::UndefinedConversionError#destination_encoding_name`**: implemented, parameters `[]`. Returns the destination encoding name as a string. [An example calling it](/examples/builtins-encoding-converter-converting).
- **`Encoding::UndefinedConversionError#error_char`**: implemented, parameters `[]`. Returns the one-character string which cause Encoding::UndefinedConversionError. [An example calling it](/examples/builtins-encoding-converter-converting).
- **`Encoding::UndefinedConversionError#source_encoding`**: implemented, parameters `[]`. Returns the source encoding as an encoding object. [An example calling it](/examples/builtins-encoding-converter-paths).
- **`Encoding::UndefinedConversionError#source_encoding_name`**: implemented, parameters `[]`. Returns the source encoding name as a string. [An example calling it](/examples/builtins-encoding-converter-converting).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
