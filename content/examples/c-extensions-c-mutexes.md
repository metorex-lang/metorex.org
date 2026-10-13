---
title: "c_extensions/c_mutexes.rb"
slug: c-extensions-c-mutexes
description: "The metorex example program c_extensions/c_mutexes.rb and its output."
---

`tests/_examples/c_extensions/c_mutexes.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_mutexes.rb).

```metorex
# A C extension making a Mutex, locking and unlocking it, sleeping on it,
# and running a C function while holding it.
require "tmpdir"
require_relative "build_helper"

directory = Dir.mktmpdir
require(build_extension("c_mutexes.c", "c_mutexes", directory))
mutexes = CMutexes.new

mutex = mutexes.make
p(mutex.class)
p(mutexes.locked(mutex))
p(mutexes.try_lock(mutex))
p(mutexes.try_lock(mutex))
report { mutexes.lock(mutex) }
p(mutexes.unlock(mutex).equal?(mutex))
report { mutexes.unlock(mutex) }
p(mutexes.lock(mutex).equal?(mutex))
p(mutexes.sleep_on(mutex, 0).class)
p(mutexes.locked(mutex))
mutex.unlock
report { mutexes.sleep_on(mutex, nil) }

p(mutexes.synchronize(mutex, -> { mutex.locked? }))
report { mutexes.synchronize(mutex, -> { raise ArgumentError, "stopped inside" }) }
p(mutex.locked?)

FileUtils.rm_rf(directory)
```

Output:

```
Thread::Mutex
false
true
false
ThreadError: deadlock; recursive locking
true
ThreadError: Attempt to unlock a mutex which is not locked
true
Integer
true
ThreadError: Attempt to unlock a mutex which is not locked
true
ArgumentError: stopped inside
false
```
