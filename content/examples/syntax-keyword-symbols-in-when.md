---
title: "syntax/keyword_symbols_in_when.rb"
slug: syntax-keyword-symbols-in-when
description: "The metorex example program syntax/keyword_symbols_in_when.rb and its output."
---

`tests/_examples/syntax/keyword_symbols_in_when.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/keyword_symbols_in_when.rb).

```metorex
def kind(event)
  case event
  when :call, :return then "method"
  when :if, :end, :class then "keyword"
  else "other"
  end
end

puts kind(:return)
puts kind(:end)
puts kind(:line)

case :nil
in :nil then puts "pattern"
end
```

Output:

```
method
keyword
other
pattern
```
