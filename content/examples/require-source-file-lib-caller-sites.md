---
title: "require/source_file_lib/caller_sites.rb"
slug: require-source-file-lib-caller-sites
description: "The metorex example program require/source_file_lib/caller_sites.rb and its output."
---

`tests/_examples/require/source_file_lib/caller_sites.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/source_file_lib/caller_sites.rb).

```metorex
class Ledger
  def own_site
    caller_locations(0, 1).first
  end

  def own_entry
    caller(0, 1).first
  end
end

module Kernel
  def kernel_site(up_level: 0)
    caller_locations(up_level, 1).first
  end
end

class Binding
  alias site_of_break kernel_site
end
```
