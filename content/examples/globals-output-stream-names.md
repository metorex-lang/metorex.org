---
title: "globals/output_stream_names.rb"
slug: globals-output-stream-names
description: "The metorex example program globals/output_stream_names.rb and its output."
---

`tests/_examples/globals/output_stream_names.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/globals/output_stream_names.rb){target=_blank rel=noopener}.

```metorex
require("stringio")

captured = StringIO.new
$stdout = captured
$>.write("through $>\n")
$stdout = STDOUT
p(captured.string)
p($>.equal?($stdout))
p(global_variables.include?(:$>))

p((Dir.glob("*", unknown_option: 1) rescue $!))
p(Dir.glob("*", base: __dir__, flags: File::FNM_DOTMATCH).include?("."))

class String
  def shout = upcase + "!"
end
p(Object.const_source_location(:String))
p("ready".shout)

p case 3 when 1..5 then :low end
p begin 4 end
```

Output:

```
"through $>\n"
true
true
#<ArgumentError: unknown keyword: :unknown_option>
true
[]
"READY!"
:low
4
```
