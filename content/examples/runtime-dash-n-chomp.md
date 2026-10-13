---
title: "runtime/dash_n_chomp.rb"
slug: runtime-dash-n-chomp
description: "The metorex example program runtime/dash_n_chomp.rb and its output."
---

`tests/_examples/runtime/dash_n_chomp.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/dash_n_chomp.rb){target=_blank rel=noopener}.

```metorex
$_ = "abc\n"
chomp
puts $_

$_ = "abc\r"
chomp
puts $_

$_ = "abc\r\n"
chomp
puts $_

$_ = "abc\n\n"
chomp
puts $_.inspect

$_ = "abcde"
$/ = "cde"
chomp
puts $_

$/ = "\n"
$_ = "abc\n"
chop
puts $_.inspect

$_ = "abc"
Kernel.chomp
puts $_

puts Kernel.private_method_defined? :chomp
puts Kernel.private_method_defined? :chop
```

Output:

```
abc
abc
abc
"abc\n"
ab
"abc"
abc
true
true
```
