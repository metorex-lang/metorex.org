---
title: "advanced/threads_keep_their_class_variables_no_parens.rb"
slug: advanced-threads-keep-their-class-variables-no-parens
description: "The metorex example program advanced/threads_keep_their_class_variables_no_parens.rb and its output."
---

`tests/_examples/advanced/threads_keep_their_class_variables_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/threads_keep_their_class_variables_no_parens.rb){target=_blank rel=noopener}.

```metorex
class Worker
  @@label = "worker"

  def work
    $in_work = true
    until $stop
    end
    @@label
  end
end

class Reader
  @@label = "reader"

  def read
    Thread.pass until $in_work
    label = @@label
    $stop = true
    label
  end
end

worker = Thread.new { Worker.new.work }
p Reader.new.read
p worker.value
```

Output:

```
"reader"
"worker"
```
