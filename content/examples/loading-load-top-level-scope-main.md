---
title: "loading/load_top_level_scope/main.rb"
slug: loading-load-top-level-scope-main
description: "The metorex example program loading/load_top_level_scope/main.rb and its output."
---

`tests/_examples/loading/load_top_level_scope/main.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/loading/load_top_level_scope/main.rb){target=_blank rel=noopener}.

```metorex
module Diff
end

module Library
  module Diff
  end

  module Loader
    def self.run(path)
      load path
    end
  end
end

Library::Loader.run(File.join(__dir__, "loaded.rb"))
```
