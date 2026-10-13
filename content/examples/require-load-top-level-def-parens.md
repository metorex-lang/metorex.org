---
title: "require/load_top_level_def_parens.rb"
slug: require-load-top-level-def-parens
description: "The metorex example program require/load_top_level_def_parens.rb and its output."
---

`tests/_examples/require/load_top_level_def_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/load_top_level_def_parens.rb){target=_blank rel=noopener}.

```metorex
module Loader
  def self.run
    load File.expand_path("autoload_lib/loaded_definition.rb", __dir__)
  end
end

Loader.run
puts(nesting_where_defined.inspect)
puts(defined_at_top_level)
```

Output:

```
[]
top_level
```
