---
title: "constants/class_exec_block_lexical_lookup.rb"
slug: constants-class-exec-block-lexical-lookup
description: "The metorex example program constants/class_exec_block_lexical_lookup.rb and its output."
---

`tests/_examples/constants/class_exec_block_lexical_lookup.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/constants/class_exec_block_lexical_lookup.rb){target=_blank rel=noopener}.

```metorex
module Diff
  module LCS
    def self.name_here = "top-level Diff::LCS"
  end
end

module Library
  module Diff
  end

  class Base
  end

  module Helpers
  end
end

class Spec < Library::Base
  include Library::Helpers
end

Spec.class_exec do
  p Diff::LCS.name_here
end

Class.new(Library::Base).class_exec do
  p Diff::LCS.name_here
end

module Library
  class Base
    def self.make(&block)
      Class.new(self).tap { |made| made.module_exec(&block) }
    end
  end
end

Library::Base.make do
  p Diff::LCS.name_here
end
```

Output:

```
"top-level Diff::LCS"
"top-level Diff::LCS"
"top-level Diff::LCS"
```
