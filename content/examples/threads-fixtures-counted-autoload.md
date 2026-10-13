---
title: "threads/fixtures/counted_autoload.rb"
slug: threads-fixtures-counted-autoload
description: "The metorex example program threads/fixtures/counted_autoload.rb and its output."
---

`tests/_examples/threads/fixtures/counted_autoload.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/threads/fixtures/counted_autoload.rb){target=_blank rel=noopener}.

```metorex
# Loaded once per name the autoload was registered under. The module is only
# finished after the pause, so a thread that reads it before then would see a
# module without its method.
which = $counted_loads.increment_and_get
eval <<-SOURCE
  module Counted#{which}
    sleep 0.02
    def self.ready
      :ready
    end
  end
SOURCE
```
