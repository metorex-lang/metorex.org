---
title: "stdlib_libraries/benchmarks.rb"
slug: stdlib-libraries-benchmarks
description: "The metorex example program stdlib_libraries/benchmarks.rb and its output."
---

`tests/_examples/stdlib_libraries/benchmarks.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/benchmarks.rb).

```metorex
# Benchmark measures blocks and prints reports of the times they took. The
# times change from run to run, so the reports are printed with each time
# written as N.
require("benchmark")
require("stringio")

def masked
  captured = StringIO.new
  $stdout = captured
  answer = yield
  $stdout = STDOUT
  print(captured.string.gsub(/\d+\.\d{6}/, "N"))
  answer
end

fixed = Benchmark::Tms.new(1.5, 0.25, 0.125, 0.0625, 2.0, "fixed")
p(fixed.total, fixed.label, fixed.to_a, fixed.to_h)
print(fixed.to_s.gsub(/\d+\.\d{6}/, "N"))
print(fixed.format("%n: %5.2u|%5.2y|%5.2U|%5.2Y|%5.2t|%5.2r %s\n", "extra"))
sum = fixed + Benchmark::Tms.new(1, 1, 1, 1, 1)
p(sum.to_a, (fixed * 2).real, (fixed / 2).utime, (fixed - fixed).total, sum.label)
p(Benchmark::CAPTION, Benchmark::FORMAT, Benchmark::VERSION)
measured = Benchmark.measure("work") { 100.times { } }
p(measured.class, measured.label, measured.real.class, measured.real >= 0)
p(Benchmark.realtime { }.class, Benchmark.ms { }.class)
p(Benchmark.measure { }.label)
results = masked do
  Benchmark.bm(7, ">total:") do |x|
  first = x.report("first:") { 10.times { } }
  second = x.report("second:") { 20.times { } }
  [first + second]
  end
end
p(results.size, results.map(&:label))
reports = masked do
  Benchmark.bmbm do |x|
  x.report("one") { 5.times { } }
  x.report("longer label") { 5.times { } }
  end
end
p(reports.map(&:label))
added = Benchmark::Tms.new.add { }
p(added.class)
grown = Benchmark::Tms.new(1, 0, 0, 0, 1)
p(grown.add! { }.equal?(grown), grown.utime >= 1)
p((Benchmark::Job.new(0).item("x") rescue $!.message))
p(Benchmark.private_instance_methods(false).sort)
```

Output:

```
1.9375
"fixed"
["fixed", 1.5, 0.25, 0.125, 0.0625, 2.0]
{label: "fixed", utime: 1.5, stime: 0.25, cutime: 0.125, cstime: 0.0625, real: 2.0}
  N   N   N (  N)
fixed:  1.50| 0.25| 0.12| 0.06| 1.94|( 2.00) extra
["", 2.5, 1.25, 1.125, 1.0625, 3.0]
4.0
0.75
0.0
""
"      user     system      total        real\n"
"%10.6u %10.6y %10.6t %10.6r\n"
"0.5.0"
Benchmark::Tms
"work"
Float
true
Float
Float
""
              user     system      total        real
first:    N   N   N (  N)
second:   N   N   N (  N)
>total:   N   N   N (  N)
2
["first:", "second:"]
Rehearsal ------------------------------------------------
one            N   N   N (  N)
longer label   N   N   N (  N)
--------------------------------------- total: Nsec

                   user     system      total        real
one            N   N   N (  N)
longer label   N   N   N (  N)
["one", "longer label"]
Benchmark::Tms
true
true
"no block"
[:benchmark, :bm, :bmbm, :measure, :ms, :realtime]
```
