---
title: "stdlib/erb_trim_modes.rb"
slug: stdlib-erb-trim-modes
description: "The metorex example program stdlib/erb_trim_modes.rb and its output."
---

`tests/_examples/stdlib/erb_trim_modes.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/erb_trim_modes.rb).

```metorex
# An ERB trim mode decides what a tag leaves behind: `>` drops the newline
# after a tag that ends a line, `<>` only when the tag opens the line too,
# `-` trims where `<%-` and `-%>` say to, and `%` reads a whole line of code.
require "erb"

template = "<ul>\n<% [1, 2].each do |item| %>\n<li><%= item %></li>\n<% end %>\n</ul>\n"
p ERB.new(template).result
p ERB.new(template, trim_mode: ">").result
p ERB.new(template, trim_mode: "<>").result

explicit = "<ul>\n<%- [1, 2].each do |item| -%>\n<li><%= item %></li>\n<%- end -%>\n</ul>\n"
p ERB.new(explicit, trim_mode: "-").result

percent = "<ul>\n% [1, 2].each do |item|\n<li><%= item %></li>\n% end\n</ul>\n%%done\n"
p ERB.new(percent, trim_mode: "%").result
```

Output:

```
"<ul>\n\n<li>1</li>\n\n<li>2</li>\n\n</ul>\n"
"<ul>\n<li>1</li>\n<li>2</li>\n</ul>\n"
"<ul>\n<li>1</li>\n<li>2</li>\n</ul>\n"
"<ul>\n<li>1</li>\n<li>2</li>\n</ul>\n"
"<ul>\n<li>1</li>\n<li>2</li>\n</ul>\n%done\n"
```
