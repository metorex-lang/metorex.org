---
title: "syntax/interpolated_statements_no_parens.rb"
slug: syntax-interpolated-statements-no-parens
description: "The metorex example program syntax/interpolated_statements_no_parens.rb and its output."
---

`tests/_examples/syntax/interpolated_statements_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/interpolated_statements_no_parens.rb).

```metorex
# The code inside #{...} is a run of statements whose value is the last
# one's, so a modifier, a semicolon, and a line break mean there what they
# mean anywhere else.
count = 1
p "keyword#{"s" if count > 1}"
p "#{count += 1; count * 10}"
p "total: #{
  doubled = count * 2
  doubled + 1
}"
p "#{"inner #{count}" unless count.zero?}"
p "#{begin; raise "no"; rescue; "rescued"; end}"
p :"symbol#{1 if true}"
```

Output:

```
"keyword"
"20"
"total: 5"
"inner 2"
"rescued"
:symbol1
```
