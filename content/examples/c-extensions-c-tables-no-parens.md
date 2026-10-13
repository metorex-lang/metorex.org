---
title: "c_extensions/c_tables_no_parens.rb"
slug: c-extensions-c-tables-no-parens
description: "The metorex example program c_extensions/c_tables_no_parens.rb and its output."
---

`tests/_examples/c_extensions/c_tables_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_tables_no_parens.rb).

```metorex
# A C extension keeping its own data in st_table hash tables keyed by
# numbers, by strings, by strings without case, and by a type of its own.
require "tmpdir"
require_relative "build_helper"

directory = Dir.mktmpdir
require build_extension("c_tables.c", "c_tables", directory)
tables = CTables.new

p tables.numbers
p tables.strings
p tables.custom

FileUtils.rm_rf directory
```

Output:

```
[0, 1, 1, 11, 0, 4, [111, 220, 330], 3, 1, 40, 0, 0, 1, 0, 0]
[1, 0, 1]
[1, 1]
```
