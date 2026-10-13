---
title: "oop/spec_temp_repro.rb"
slug: oop-spec-temp-repro
description: "The metorex example program oop/spec_temp_repro.rb and its output."
---

`tests/_examples/oop/spec_temp_repro.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/spec_temp_repro.rb).

```metorex
a = "/tmp/foo/bar".split %r[/|\\]
puts a.inspect

b = "/tmp/foo/bar".split(%r[/|\\])
puts b.inspect

c = File.expand_path("/tmp/foo/bar").split %r[/|\\]
puts c.inspect

d = File.expand_path("/tmp/foo/bar").split(%r[/|\\])
puts d.inspect
```
