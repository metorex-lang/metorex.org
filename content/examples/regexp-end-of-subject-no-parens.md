---
title: "regexp/end_of_subject_no_parens.rb"
slug: regexp-end-of-subject-no-parens
description: "The metorex example program regexp/end_of_subject_no_parens.rb and its output."
---

`tests/_examples/regexp/end_of_subject_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/regexp/end_of_subject_no_parens.rb){target=_blank rel=noopener}.

```metorex
# `\z` stands at the very end of the subject, and `\Z` stands there too or
# just before a newline that ends it.
p "abc" =~ /c\z/
p "abc\n" =~ /c\z/
p "abc" =~ /c\Z/
p "abc\n" =~ /c\Z/
p "file.rb".sub(/\.rb\Z/, "")
p "undefined method 'foo' for nil" =~ /\Aundefined method 'foo' for nil\Z/
```

Output:

```
2
nil
2
2
"file"
0
```
