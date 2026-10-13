---
title: "strings/byte_searches_parens.rb"
slug: strings-byte-searches-parens
description: "The metorex example program strings/byte_searches_parens.rb and its output."
---

`tests/_examples/strings/byte_searches_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/strings/byte_searches_parens.rb).

```metorex
# `byteindex` and `byterindex` answer where a needle sits, counted in bytes,
# reading from an offset forwards or backwards.
p("blablabla".byteindex("bla"))
p("blablabla".byterindex("bla"))
p("blablabla".byteindex("bla", 1))
p("blablabla".byterindex("bla", 5))
p("ありがとう".byteindex("が"))
p("ありがとう".byteindex(/が/))
p("blablabla".byteindex("zz"))
p("ありがとう".index("が"))
p("ありがとう".rindex("が"))
p("helloYOU.".byteindex(/\GYOU/, 5))

begin
  "わ".byteindex("", 1)
rescue IndexError => problem
  puts(problem.message)
end

begin
  "abc".byteindex(97)
rescue TypeError => problem
  puts(problem.message)
end
```

Output:

```
0
6
3
3
6
6
nil
2
2
5
offset 1 does not land on character boundary
no implicit conversion of Integer into String
```
