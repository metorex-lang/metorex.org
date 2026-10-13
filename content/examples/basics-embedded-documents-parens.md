---
title: "basics/embedded_documents_parens.rb"
slug: basics-embedded-documents-parens
description: "The metorex example program basics/embedded_documents_parens.rb and its output."
---

`tests/_examples/basics/embedded_documents_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/embedded_documents_parens.rb).

```metorex
=begin
Lines between =begin and =end at the start of a line are a comment.
p("never printed")
=end
p("after the first document")
=begin with words after the marker
=end and words after this one too
rate = 7
=begin
  =end indented does not close it
p("still a comment")
=end
p(rate)
```

Output:

```
"after the first document"
7
```
