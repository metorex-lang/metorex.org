---
title: "tabular_data/comma_separated.rb"
slug: tabular-data-comma-separated
description: "The metorex example program tabular_data/comma_separated.rb and its output."
---

`tests/_examples/tabular_data/comma_separated.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/tabular_data/comma_separated.rb){target=_blank rel=noopener}.

```metorex
# Comma separated values are read into rows of fields, where an empty field
# is nil and a quoted one may carry the separator itself.
require 'csv'

p CSV.parse("name,age\nruby,30\n")
p CSV.parse("foo,,baz")
p CSV.parse("")
p CSV.parse("\n\nbar")
p CSV.parse("foo;bar", col_sep: ";")
p CSV.parse('"Johnson, Dwayne",actor')
p CSV.parse_line("a,b,c")

p CSV.generate_line(["foo", "bar"])
p CSV.generate_line([])
p CSV.generate_line(["foo", nil, "bar"])
p CSV.generate_line(["a,b", 'say "hi"'])
p CSV.generate_line(["foo", "bar"], col_sep: ";")

# A quote that opens no field is malformed, unless the reader is asked to
# take the text as it stands.
begin
  CSV.parse('"quoted" field')
rescue CSV::MalformedCSVError => problem
  p problem.message
end
p CSV.parse('"Johnson, Dwayne",Dwayne "The Rock" Johnson', liberal_parsing: true)

sheet = CSV.new("")
p sheet.liberal_parsing?
sheet << ["a", 1]
sheet.add_row ["b", 2]
p sheet.string
p sheet.read
p sheet.col_sep

rows = []
CSV.new("x,1\ny,2\n").each { |row| rows.push(row) }
p rows
```

Output:

```
[["name", "age"], ["ruby", "30"]]
[["foo", nil, "baz"]]
[]
[[], [], ["bar"]]
[["foo", "bar"]]
[["Johnson, Dwayne", "actor"]]
["a", "b", "c"]
"foo,bar\n"
"\n"
"foo,,bar\n"
"\"a,b\",\"say \"\"hi\"\"\"\n"
"foo;bar\n"
"Any value after quoted field isn't allowed in line 1."
[["Johnson, Dwayne", "Dwayne \"The Rock\" Johnson"]]
false
"a,1\nb,2\n"
[["a", "1"], ["b", "2"]]
","
[["x", "1"], ["y", "2"]]
```
