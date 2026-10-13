---
title: "introspection/block_frame_labels.rb"
slug: introspection-block-frame-labels
description: "The metorex example program introspection/block_frame_labels.rb and its output."
---

`tests/_examples/introspection/block_frame_labels.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/block_frame_labels.rb).

```metorex
# A block is a place of its own in a backtrace, named for the scope it was
# written in and for how many blocks deep it sits.
def outer
  1.times do
    puts caller_locations(0, 1)[0].label
    1.times do
      puts caller_locations(0, 1)[0].label
    end
  end
end

outer

# The scope travels with the block, so one called from somewhere else is
# still named for where it was written.
NAMED = proc { caller_locations(0, 1)[0].label }

module Holder
  def self.run
    NAMED.call
  end
end

puts Holder.run

# The base label drops what the block was reached through.
def base
  1.times do
    puts caller_locations(0, 1)[0].base_label
  end
end

base
```

Output:

```
block in Object#outer
block (2 levels) in Object#outer
block in <main>
base
```
