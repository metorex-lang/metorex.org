---
title: "methods/files/simpler.rb"
slug: methods-files-simpler
description: "The metorex example program methods/files/simpler.rb and its output."
---

`tests/_examples/methods/files/simpler.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/files/simpler.rb).

```metorex
def files(patterns)
  list = []
  patterns.each do |pattern|
    case pattern
    when "x"
      list += ["X"]
    else
      list += [pattern]
    end
  end
  list
end

out = files(["foo"])
puts out.length
```
