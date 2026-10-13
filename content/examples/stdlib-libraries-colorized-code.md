---
title: "stdlib_libraries/colorized_code.rb"
slug: stdlib-libraries-colorized-code
description: "The metorex example program stdlib_libraries/colorized_code.rb and its output."
---

`tests/_examples/stdlib_libraries/colorized_code.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/colorized_code.rb){target=_blank rel=noopener}.

```metorex
# IRB::Color colors Ruby source for a terminal: keywords, constants, numbers,
# strings, symbols, comments and the names of methods defined and called.
require("irb/color")
require("rbconfig")
require("tmpdir")

source = <<~'CODE'
  # A comment
  require "set"
  module Shipping
    class Crate < Struct.new(:width, :height)
      RATE = 1.5
      def volume(depth = 2) = width * height * depth
      def label
        "#{width}x#{height} #@name $0 #$1"
      end
      alias size volume
      undef label
    end
  end
  crate = Shipping::Crate.new 3, 4r
  p crate.volume, :sym, :"quoted #{1}", %i[a b], %w[c d], {key: 1, "str": 2}
  p nil, true, false, self, __FILE__, __LINE__, ?a, 2i, 0x1f, 1e3, $stdout, $~
  puts `echo hi` if defined?(crate) && !false or not true
  x = /ab+c/i =~ "abbc"
  value = [1, 2].map { it ** 2 }.sum rescue 0
  first, crate.width = 1, 2
  case value when 5 then p 1 else p 2 end
  y = <<~TEXT
    heredoc #{value}
  TEXT
  =begin
  doc
  =end
  __END__
  trailing
CODE

IRB::Color.colorize_code(source, colorable: true).each_line { |line| p(line) }
p(IRB::Color.colorize_code(source, colorable: false).equal?(source))
p(IRB::Color.colorize_code("width + depth\n", colorable: true, local_variables: [:width]))
p(IRB::Color.colorize_code("def (\n\tx\x01", colorable: true, ignore_error: true))
p(IRB::Color.colorize_code("\uFEFF# marked\n", colorable: true))
p(IRB::Color.colorize("text", [:RED, :BOLD], colorable: true))
p(IRB::Color.colorize("text", [:RED], colorable: false))
p(IRB::Color.clear(colorable: true), IRB::Color.clear(colorable: false))
p(IRB::Color.inspect_colorable?([1, "a", {b: nil}, 1..2, String]))
p(IRB::Color.inspect_colorable?(Object.new), IRB::Color.inspect_colorable?(Class.new))

Dir.mktmpdir do |directory|
  path = File.join(directory, "sample.rb")
  File.write(path, "p :piped\n")
  print(IO.popen([RbConfig.ruby, "-run", "-e", "colorize", "--", path], &:read))
end
```

Output:

```
"\e[34m\e[1m# A comment\e[0m\n"
"\e[36mrequire\e[0m \e[31m\e[1m\"\e[0m\e[31mset\e[0m\e[31m\e[1m\"\e[0m\n"
"\e[32mmodule\e[0m \e[34m\e[1m\e[4mShipping\e[0m\n"
"  \e[32mclass\e[0m \e[34m\e[1m\e[4mCrate\e[0m < \e[34m\e[1m\e[4mStruct\e[0m.\e[36mnew\e[0m(\e[33m:\e[0m\e[33mwidth\e[0m, \e[33m:\e[0m\e[33mheight\e[0m)\n"
"    \e[34m\e[1m\e[4mRATE\e[0m = \e[35m\e[1m1.5\e[0m\n"
"    \e[32mdef\e[0m \e[36m\e[1mvolume\e[0m(depth = \e[34m\e[1m2\e[0m) = \e[36mwidth\e[0m * \e[36mheight\e[0m * depth\n"
"    \e[32mdef\e[0m \e[36m\e[1mlabel\e[0m\n"
"      \e[31m\e[1m\"\e[0m\e[31m\#{\e[0m\e[36mwidth\e[0m\e[31m}\e[0m\e[31mx\e[0m\e[31m\#{\e[0m\e[36mheight\e[0m\e[31m}\e[0m\e[31m \e[0m\e[31m#\e[0m@name\e[31m $0 \e[0m\e[31m#\e[0m\e[32m\e[1m$1\e[0m\e[31m\e[1m\"\e[0m\n"
"    \e[32mend\e[0m\n"
"    \e[32malias\e[0m \e[36m\e[1msize\e[0m \e[36m\e[1mvolume\e[0m\n"
"    \e[32mundef\e[0m \e[33mlabel\e[0m\n"
"  \e[32mend\e[0m\n"
"\e[32mend\e[0m\n"
"crate = \e[34m\e[1m\e[4mShipping\e[0m::\e[34m\e[1m\e[4mCrate\e[0m.\e[36mnew\e[0m \e[34m\e[1m3\e[0m, \e[34m\e[1m4r\e[0m\n"
"\e[36mp\e[0m crate.\e[36mvolume\e[0m, \e[33m:\e[0m\e[33msym\e[0m, \e[33m:\"\e[0m\e[33mquoted \e[0m\e[33m\#{\e[0m\e[34m\e[1m1\e[0m\e[33m}\e[0m\e[33m\"\e[0m, \e[33m%i[\e[0m\e[33ma\e[0m \e[33mb\e[0m\e[33m]\e[0m, \e[31m\e[1m%w[\e[0m\e[31mc\e[0m \e[31md\e[0m\e[31m\e[1m]\e[0m, {\e[35mkey:\e[0m \e[34m\e[1m1\e[0m, \e[35m\"str\":\e[0m \e[34m\e[1m2\e[0m}\n"
"\e[36mp\e[0m \e[36m\e[1mnil\e[0m, \e[36m\e[1mtrue\e[0m, \e[36m\e[1mfalse\e[0m, \e[36m\e[1mself\e[0m, \e[36m\e[1m__FILE__\e[0m, \e[36m\e[1m__LINE__\e[0m, \e[34m\e[1m?a\e[0m, \e[34m\e[1m2i\e[0m, \e[34m\e[1m0x1f\e[0m, \e[35m\e[1m1e3\e[0m, \e[32m\e[1m$stdout\e[0m, \e[32m\e[1m$~\e[0m\n"
"\e[36mputs\e[0m \e[31m\e[1m`\e[0m\e[31mecho hi\e[0m\e[31m\e[1m`\e[0m \e[32mif\e[0m \e[32mdefined?\e[0m(crate) && !\e[36m\e[1mfalse\e[0m \e[32mor\e[0m \e[32mnot\e[0m \e[36m\e[1mtrue\e[0m\n"
"x = \e[31m\e[1m/\e[0m\e[31mab+c\e[0m\e[31m\e[1m/i\e[0m =~ \e[31m\e[1m\"\e[0m\e[31mabbc\e[0m\e[31m\e[1m\"\e[0m\n"
"value = [\e[34m\e[1m1\e[0m, \e[34m\e[1m2\e[0m].\e[36mmap\e[0m { it ** \e[34m\e[1m2\e[0m }.\e[36msum\e[0m \e[32mrescue\e[0m \e[34m\e[1m0\e[0m\n"
"first, crate.width = \e[34m\e[1m1\e[0m, \e[34m\e[1m2\e[0m\n"
"\e[32mcase\e[0m value \e[32mwhen\e[0m \e[34m\e[1m5\e[0m \e[32mthen\e[0m \e[36mp\e[0m \e[34m\e[1m1\e[0m \e[32melse\e[0m \e[36mp\e[0m \e[34m\e[1m2\e[0m \e[32mend\e[0m\n"
"y = \e[31m<<~TEXT\e[0m\n"
"\e[31m  heredoc \e[0m\e[31m\#{\e[0mvalue\e[31m}\e[0m\e[31m\e[0m\n"
"\e[31mTEXT\e[0m\n"
"\e[34m\e[1m=begin\e[0m\n"
"\e[34m\e[1mdoc\e[0m\n"
"\e[34m\e[1m=end\e[0m\n"
"\e[32m__END__\e[0m\n"
"trailing\n"
true
"width + \e[36mdepth\e[0m\n"
"def (\n  x^A"
"﻿\e[34m\e[1m# marked\e[0m\n"
"\e[31m\e[1mtext\e[0m"
"text"
"\e[0m"
""
true
false
false
p :piped
```
