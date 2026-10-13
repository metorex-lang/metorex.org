---
title: "scanning/reading_a_string_no_parens.rb"
slug: scanning-reading-a-string-no-parens
description: "The metorex example program scanning/reading_a_string_no_parens.rb and its output."
---

`tests/_examples/scanning/reading_a_string_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/scanning/reading_a_string_no_parens.rb).

```metorex
# A StringScanner walks a string with a cursor, matching patterns at the
# place it has reached.
require 'strscan'

scanner = StringScanner.new "This is a test"

p scanner.scan(/\w+/)
p scanner.pos
p scanner.scan(/\s+/)
p scanner.scan(/\d+/)
p scanner.check(/is/)
p scanner.pos
p scanner.match?(/is/)
p scanner.skip(/is/)
p scanner.rest
p scanner.rest_size
p scanner.eos?

scanner.reset
p scanner.pos
p scanner.scan_until(/is/)
p scanner.pre_match
p scanner.post_match
p scanner.matched
p scanner.matched?
p scanner.matched_size
p scanner.unscan.pos

p scanner.scan "This"
p scanner.exist?(/test/)
p scanner.check_until(/a/)
p scanner.skip_until(/a/)
p scanner.rest

grouped = StringScanner.new "2024-05-06"
p grouped.scan(/(?<year>\d+)-(?<month>\d+)/)
p grouped[0]
p grouped[1]
p grouped[:year]
p grouped.captures
p grouped.named_captures
p grouped.values_at 0, 1, 2
p grouped.size

reading = StringScanner.new "abc"
p reading.getch
p reading.peek 2
p reading.peek_byte
p reading.scan_byte
p reading.beginning_of_line?
p reading.terminate.eos?
p reading.inspect

begin
  StringScanner.new("x").scan_until "literal"
rescue TypeError => error
  p error.class
end

begin
  StringScanner.new("x").unscan
rescue StringScanner::Error => error
  p error.class
end
```

Output:

```
"This"
4
" "
nil
"is"
5
2
2
" a test"
7
false
0
"This"
"Th"
" is a test"
"is"
true
2
0
"This"
10
" is a"
5
" test"
"2024-05"
"2024-05"
"2024"
"2024"
["2024", "05"]
{"year" => "2024", "month" => "05"}
["2024-05", "2024", "05"]
3
"a"
"bc"
98
98
false
true
"#<StringScanner fin>"
TypeError
ScanError
```
