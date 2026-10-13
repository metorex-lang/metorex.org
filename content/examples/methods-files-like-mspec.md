---
title: "methods/files/like_mspec.rb"
slug: methods-files-like-mspec
description: "The metorex example program methods/files/like_mspec.rb and its output."
---

`tests/_examples/methods/files/like_mspec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/files/like_mspec.rb){target=_blank rel=noopener}.

```metorex
def entries(p)
  [p + "_spec.rb"]
end

def files(patterns)
  list = []
  patterns.each do |pattern|
    case pattern[0]
    when ?^
      list -= entries(pattern[1..-1])
    when ?:
      key = pattern[1..-1].to_sym
      list += files([key.to_s])
    else
      list += entries(pattern)
    end
  end
  list
end

out = files(["foo"])
puts out.length
puts out.first
```
