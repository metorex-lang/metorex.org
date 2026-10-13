---
title: "introspection/body_frames_parens.rb"
slug: introspection-body-frames-parens
description: "The metorex example program introspection/body_frames_parens.rb and its output."
---

`tests/_examples/introspection/body_frames_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/body_frames_parens.rb).

```metorex
# A class or module body names itself in a backtrace by the class or module
# alone, without the namespace it was written in.
module Outer
  module Inner
    p(caller_locations(0, 1)[0].base_label)
  end

  class Held
    p(caller_locations(0, 1)[0].base_label)
  end

  class << Object.new
    p(caller_locations(0, 1)[0].base_label)
  end
end

def named_frame
  caller_locations(0, 1)[0].base_label
end

p(named_frame)
```

Output:

```
"<module:Inner>"
"<class:Held>"
"singleton class"
"named_frame"
```
