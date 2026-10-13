---
title: "methods/module_respond_to_missing_is_for_instances.rb"
slug: methods-module-respond-to-missing-is-for-instances
description: "The metorex example program methods/module_respond_to_missing_is_for_instances.rb and its output."
---

`tests/_examples/methods/module_respond_to_missing_is_for_instances.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/module_respond_to_missing_is_for_instances.rb){target=_blank rel=noopener}.

```metorex
module Finder
  def respond_to_missing?(name, include_private = false)
    name.to_s.start_with?("find_") || super
  end
end

module Tools
  include Finder
end

class Searcher
  include Finder
end

p Finder.respond_to?(:find_all)
p Finder.respond_to?(:other, true)
p Tools.respond_to?(:find_all)
p Tools.respond_to?(:ruby2_keywords, true)
p Searcher.new.respond_to?(:find_all)
p Searcher.new.respond_to?(:other)
```

Output:

```
false
false
false
true
true
false
```
