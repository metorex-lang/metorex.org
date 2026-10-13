---
title: "constants/basic_object_class_exec_reads_lexical_constants.rb"
slug: constants-basic-object-class-exec-reads-lexical-constants
description: "The metorex example program constants/basic_object_class_exec_reads_lexical_constants.rb and its output."
---

`tests/_examples/constants/basic_object_class_exec_reads_lexical_constants.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/constants/basic_object_class_exec_reads_lexical_constants.rb){target=_blank rel=noopener}.

```metorex
module Outer
  Local = :outer_local

  def self.run
    BasicObject.class_exec do
      p Class
      p Local
    end
  end
end
Outer.run
```

Output:

```
Class
:outer_local
```
