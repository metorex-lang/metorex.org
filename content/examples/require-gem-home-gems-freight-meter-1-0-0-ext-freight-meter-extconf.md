---
title: "require/gem_home/gems/freight_meter-1.0.0/ext/freight_meter/extconf.rb"
slug: require-gem-home-gems-freight-meter-1-0-0-ext-freight-meter-extconf
description: "The metorex example program require/gem_home/gems/freight_meter-1.0.0/ext/freight_meter/extconf.rb and its output."
---

`tests/_examples/require/gem_home/gems/freight_meter-1.0.0/ext/freight_meter/extconf.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/freight_meter-1.0.0/ext/freight_meter/extconf.rb).

```metorex
require "mkmf"

$INCFLAGS << " -I$(srcdir)/../../include"
root = File.expand_path("../..", __dir__)
$srcs = Dir.glob("#{root}/src/*.c") + Dir.glob("#{__dir__}/*.c")
$distcleanfiles << "meter_version.h"
File.write("meter_version.h", "#define FREIGHT_METER_VERSION \"1.0.0\"\n")
append_cflags ["-std=gnu99"]
create_makefile "freight_meter/meter"
```
