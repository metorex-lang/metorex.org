---
title: "require/caller_in_required_file_no_parens.rb"
slug: require-caller-in-required-file-no-parens
description: "The metorex example program require/caller_in_required_file_no_parens.rb and its output."
---

`tests/_examples/require/caller_in_required_file_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/caller_in_required_file_no_parens.rb){target=_blank rel=noopener}.

```metorex
# The innermost frame `caller` and `caller_locations` report names the file
# the running method was written in, not the file that called it.
require_relative "source_file_lib/caller_sites"

def described location
  [File.basename(location.path), location.lineno, location.label]
end

ledger = Ledger.new
p described(ledger.own_site)
p ledger.own_entry.sub(/\A.*\//, "")
p described(kernel_site)
p described(binding.site_of_break)
p described(kernel_site up_level: 1)
```

Output:

```
["caller_sites.rb", 3, "Ledger#own_site"]
"caller_sites.rb:7:in 'Ledger#own_entry'"
["caller_sites.rb", 13, "Kernel#kernel_site"]
["caller_sites.rb", 13, "Kernel#kernel_site"]
["caller_in_required_file_no_parens.rb", 14, "<main>"]
```
