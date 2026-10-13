---
title: "object_space/gc_latest_info.rb"
slug: object-space-gc-latest-info
description: "The metorex example program object_space/gc_latest_info.rb and its output."
---

`tests/_examples/object_space/gc_latest_info.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/object_space/gc_latest_info.rb){target=_blank rel=noopener}.

```metorex
# GC.latest_gc_info reports the collector's last run: every reading in a new
# Hash, every reading added to a Hash given, or one reading by name. A run
# metorex makes is one the program asked for.
p(GC.latest_gc_info.keys)
GC.start
p(GC.latest_gc_info)
held = { kept: true }
p(GC.latest_gc_info(held).equal?(held))
p(held.size)
p([GC.latest_gc_info(:gc_by), GC.latest_gc_info(:state)])
begin
  GC.latest_gc_info(:unknown)
rescue ArgumentError => error
  puts(error.message)
end
begin
  GC.latest_gc_info("state")
rescue TypeError => error
  puts(error.message)
end
```

Output:

```
[:major_by, :need_major_by, :gc_by, :have_finalizer, :immediate_sweep, :state, :weak_references_count]
{major_by: :force, need_major_by: nil, gc_by: :method, have_finalizer: false, immediate_sweep: true, state: :none, weak_references_count: 0}
true
8
[:method, :none]
unknown key: unknown
non-hash or symbol given
```
