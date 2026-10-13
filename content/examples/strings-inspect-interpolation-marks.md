---
title: "strings/inspect_interpolation_marks.rb"
slug: strings-inspect-interpolation-marks
description: "The metorex example program strings/inspect_interpolation_marks.rb and its output."
---

`tests/_examples/strings/inspect_interpolation_marks.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/inspect_interpolation_marks.rb){target=_blank rel=noopener}.

```metorex
# `inspect` escapes a `#` that would start an interpolation, whatever the
# string's encoding, so the answer reads back as the same text.
p("\#{total}".b)
p("\#$stdout".b)
p("\#@count".b)
p("#plain".b)
p("\#{total}".force_encoding("EUC-JP"))
p("\#{\xA4\xA2".force_encoding("EUC-JP"))
p("\#$stdout".force_encoding("Shift_JIS"))
p("\#{total}")
```

Output:

```
"\#{total}"
"\#$stdout"
"\#@count"
"#plain"
"\#{total}"
"\#{\x{A4A2}"
"\#$stdout"
"\#{total}"
```
