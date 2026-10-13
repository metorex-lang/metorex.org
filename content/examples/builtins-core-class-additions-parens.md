---
title: "builtins/core_class_additions_parens.rb"
slug: builtins-core-class-additions-parens
description: "The metorex example program builtins/core_class_additions_parens.rb and its output."
---

`tests/_examples/builtins/core_class_additions_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/core_class_additions_parens.rb).

```metorex
# Constants and readings the core classes carry.
p(File::NULL)
p(File.include?(File::Constants))
p(File.superclass)
p(IO.include?(Enumerable))

p(Encoding::BINARY.equal?(Encoding::ASCII_8BIT))
p(Encoding::EUC_JP.name)
p(Encoding.find("ISO-8859-1").name)
p(Encoding::UTF_8.inspect)
p(Encoding::ISO_2022_JP.dummy?)
p(Encoding.list.all? { |found| found == Encoding.find(found.name) })

p(Process::Tms.new(1, 2, 3, 4).utime)
p(Process.warmup)
Process.maxgroups = 12
p(Process.maxgroups)

before = GC.count
GC.start
p(GC.count > before)
p(GC.total_time.is_a?(Integer))
p(GC::Profiler.enabled?)
p(GC::Profiler.result)

group = ThreadGroup.new
p(group.enclosed?)
group.enclose
p(group.enclosed?)
p(Thread.main.group.equal?(ThreadGroup::Default))
p(Thread.ignore_deadlock)

p(Complex(1, 2).send(:marshal_dump))
p(Rational(1, 2).send(:marshal_dump))
p(Regexp.linear_time?(/a+/))
```

Output:

```
"/dev/null"
true
IO
true
true
"EUC-JP"
"ISO-8859-1"
"#<Encoding:UTF-8>"
true
true
1
true
12
true
true
false
""
false
true
true
false
[1, 2]
[1, 2]
true
```
