---
title: "algorithms/palindrome_check.rb"
slug: algorithms-palindrome-check
description: "The metorex example program algorithms/palindrome_check.rb and its output."
---

`tests/_examples/algorithms/palindrome_check.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/algorithms/palindrome_check.rb){target=_blank rel=noopener}.

```metorex
text = "racecar"
chars = []

text.each_char do |char|
  chars.push(char)
end

reversed_text = ""

chars.each do |char|
  reversed_text = char + reversed_text
end

is_palindrome = text == reversed_text
puts is_palindrome
```
