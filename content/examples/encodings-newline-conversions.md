---
title: "encodings/newline_conversions.rb"
slug: encodings-newline-conversions
description: "The metorex example program encodings/newline_conversions.rb and its output."
---

`tests/_examples/encodings/newline_conversions.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/newline_conversions.rb){target=_blank rel=noopener}.

```metorex
# `encode` rewrites line endings when asked. `universal_newline:` reads CR LF
# and a lone CR as LF, and `crlf_newline:` and `cr_newline:` write each LF as
# CR LF or as CR. `newline:` names the same conversions, `:lf` among them,
# and is read ahead of the flags.
text = "a\r\nb\rc\nd"
p text.encode universal_newline: true
p text.encode crlf_newline: true
p text.encode cr_newline: true
p text.encode cr_newline: false
p text.encode newline: :lf
p text.encode newline: :crlf, universal_newline: true
p text.encode("UTF-16LE", universal_newline: true).encode "UTF-8"

# More than one flag names no converter, and `newline:` takes only the names
# it knows.
def refusal
  yield
rescue StandardError => problem
  [problem.class, problem.message]
end

p refusal { text.encode universal_newline: true, crlf_newline: true }
p refusal { text.encode crlf_newline: true, cr_newline: true }
p refusal { text.encode newline: :other }
p refusal { text.encode newline: "crlf" }
```

Output:

```
"a\nb\nc\nd"
"a\r\r\nb\rc\r\nd"
"a\r\rb\rc\rd"
"a\r\nb\rc\nd"
"a\nb\nc\nd"
"a\r\r\nb\rc\r\nd"
"a\nb\nc\nd"
[Encoding::ConverterNotFoundError, "code converter not found (universal_newline,crlf_newline)"]
[Encoding::ConverterNotFoundError, "code converter not found (crlf_newline,cr_newline)"]
[ArgumentError, "unexpected value for newline option: other"]
[ArgumentError, "unexpected value for newline option"]
```
