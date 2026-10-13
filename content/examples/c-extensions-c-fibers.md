---
title: "c_extensions/c_fibers.rb"
slug: c-extensions-c-fibers
description: "The metorex example program c_extensions/c_fibers.rb and its output."
---

`tests/_examples/c_extensions/c_fibers.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_fibers.rb){target=_blank rel=noopener}.

```metorex
# A C extension making a Fiber whose body is a C block function, and
# resuming, yielding, transferring and raising from C.
require "tmpdir"
require_relative "build_helper"

directory = Dir.mktmpdir
require(build_extension("c_fibers.c", "c_fibers", directory))
fibers = CFibers.new

made = fibers.fiber_new(:data)
p(made.class)
p(made.resume(1, 2))
p(fibers.alive(made))
p(fibers.fiber_new(:none).resume)
p(fibers.current == Fiber.current)

stepped = Fiber.new { |first| fibers.yield([first * 10]) + 1 }
p(fibers.resume(stepped, [4]))
p(fibers.resume(stepped, [5]))
p(fibers.alive(stepped))

main = Fiber.current
handed = Fiber.new { |value| main.transfer(value * 2) }
p(fibers.transfer(handed, [21]))

waiting = Fiber.new do
  Fiber.yield
rescue => error
  "rescued #{error.message}"
end
waiting.resume
p(fibers.raise_in(waiting, ["stopped"]))

p([fibers.entry([1, 2, 3], 0), fibers.entry([1, 2, 3], -1), fibers.entry([1, 2, 3], 3), fibers.entry([1], -2)])

FileUtils.rm_rf(directory)
```

Output:

```
Fiber
[1, :data, 2, [1, 2]]
false
[nil, :none, 0, []]
true
40
6
false
42
"rescued stopped"
[1, 3, nil, nil]
```
