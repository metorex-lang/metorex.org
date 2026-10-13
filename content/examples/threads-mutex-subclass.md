---
title: "threads/mutex_subclass.rb"
slug: threads-mutex-subclass
description: "The metorex example program threads/mutex_subclass.rb and its output."
---

`tests/_examples/threads/mutex_subclass.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/mutex_subclass.rb){target=_blank rel=noopener}.

```metorex
class Guard < Mutex; end
guard = Guard.new
guard.lock
p [guard.locked?, guard.owned?]
begin
  guard.synchronize {}
rescue ThreadError => error
  p error.message
end
guard.unlock
p guard.synchronize { :inside }
```

Output:

```
[true, true]
"deadlock; recursive locking"
:inside
```
