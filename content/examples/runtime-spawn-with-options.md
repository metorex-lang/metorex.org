---
title: "runtime/spawn_with_options.rb"
slug: runtime-spawn-with-options
description: "The metorex example program runtime/spawn_with_options.rb and its output."
---

`tests/_examples/runtime/spawn_with_options.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/runtime/spawn_with_options.rb){target=_blank rel=noopener}.

```metorex
# Process.spawn reads its options Hash the way Ruby does.
require "tmpdir"
path = File.join(Dir.tmpdir, "metorex_spawn_with_options_#{Process.pid}.txt")
name = Object.new
def name.to_str = "GREETING"
pid = Process.spawn({ name => "hello" }, "echo $GREETING; echo gone >&2", [:out, :err] => path, umask: 0o077)
Process.wait(pid)
p(File.read(path))
File.delete(path)
[
  -> { Process.spawn("true", pgroup: -1) },
  -> { Process.spawn("true", pgroup: :yes) },
  -> { Process.spawn("true", nonesuch: 1) },
  -> { Process.spawn("true", "chdir" => "/") },
  -> { Process.spawn({ "A=B" => "1" }, "true") },
  -> { Process.spawn(:true) },
  -> { Process.spawn({}, {}) },
].each do |attempt|
  begin
    attempt.call
  rescue ArgumentError, TypeError => error
    p([error.class, error.message])
  end
end
```

Output:

```
"hello\ngone\n"
[ArgumentError, "negative process group ID : -1"]
[TypeError, "no implicit conversion of Symbol into Integer"]
[ArgumentError, "wrong exec option symbol: nonesuch"]
[ArgumentError, "wrong exec option"]
[ArgumentError, "environment name contains a equal : A=B"]
[TypeError, "no implicit conversion of Symbol into String"]
[ArgumentError, "wrong number of arguments (given 0, expected 1+)"]
```
