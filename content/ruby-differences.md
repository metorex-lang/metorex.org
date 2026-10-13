---
title: Differences from MRI
slug: ruby-differences
description: Where Metorex answers differently from MRI 4.0.6, each shown with a sample and the output of both.
layout: page
---

Metorex runs the ruby/spec suite with no failures, so a program that uses only what the suite checks behaves the same under both. The places below are where Metorex answers differently on purpose. Each sample was run under Metorex and under MRI 4.0.6, and both outputs are shown.

## The version description

`RUBY_VERSION`, `RUBY_ENGINE`, and `RUBY_ENGINE_VERSION` match MRI's, so version checks in a library pass. `RUBY_DESCRIPTION`, which `-v` prints, names Metorex.

```metorex
puts RUBY_DESCRIPTION
p [RUBY_ENGINE, RUBY_VERSION, RUBY_ENGINE_VERSION]
```

Metorex:

```
metorex 4.0.6 (ruby-compatible) [arm64-darwin]
["ruby", "4.0.6", "4.0.6"]
```

MRI 4.0.6:

```
ruby 4.0.6 (2026-07-14 revision 03b6d3f889) +PRISM [arm64-darwin25]
["ruby", "4.0.6", "4.0.6"]
```

## Instruction sequences

Metorex runs the syntax tree rather than compiling it to instructions, so `RubyVM::InstructionSequence#disasm` and `#to_a` list the tree's nodes.

```metorex
puts RubyVM::InstructionSequence.compile("total = 2 + 3").disasm
```

Metorex:

```
== disasm: #<ISeq:<compiled>@<compiled>:1 (1,0)-(1,13)>
0000 lasgn :total
0001 opcall :+
0002 integer 2
0003 list nil
0004 integer 3
0005 leave
```

MRI 4.0.6:

```
== disasm: #<ISeq:<compiled>@<compiled>:1 (1,0)-(1,13)>
local table (size: 1, argc: 0 [opts: 0, rest: -1, post: 0, block: -1, kw: -1@-1, kwrest: -1])
[ 1] total@0
0000 putobject                              2                         (   1)[Li]
0002 putobject                              3
0004 opt_plus                               <calldata!mid:+, argc:1, ARGS_SIMPLE>[CcCr]
0006 dup
0007 setlocal_WC_0                          total@0
0009 leave
```

## Virtual machine statistics

`RubyVM.stat` answers MRI's keys, each at zero, since Metorex keeps none of the inline caches or object shapes they count.

```metorex
p RubyVM.stat.values.all?(&:zero?)
```

Metorex:

```
true
```

MRI 4.0.6:

```
false
```

## The garbage collector

Metorex frees an object when the last reference to it goes, and `GC.config` names that collector.

```metorex
p GC.config[:implementation]
```

Metorex:

```
"metorex"
```

MRI 4.0.6:

```
"default"
```

## Native thread ids

Every Metorex thread runs on the one operating system thread the interpreter runs on, taking turns. `Thread#native_thread_id` answers that thread's id for the thread running now, and nil for a thread waiting its turn.

```metorex
waiting = Thread.new { sleep 0.2 }
sleep 0.05
p Thread.current.native_thread_id.is_a?(Integer)
p waiting.native_thread_id.class
```

Metorex:

```
true
NilClass
```

MRI 4.0.6:

```
true
Integer
```

## Libraries loaded at startup

Metorex loads `error_highlight` and `did_you_mean` as it starts, whatever the options. MRI loads them through RubyGems, so `--disable-gems` leaves them out there. Under Metorex `--disable=error_highlight` and `--disable=did_you_mean` leave each one out.

```metorex
p defined?(ErrorHighlight)
p defined?(DidYouMean)
```

Run with `--disable-gems`, Metorex:

```
"constant"
"constant"
```

MRI 4.0.6:

```
nil
nil
```

## Naming RSpec

Rex, the spec framework built into Metorex, loads the first time a program names `RSpec`, and the examples the program defined run as it ends. Under MRI the program has to require `rspec/autorun` from the RSpec gems first.

```metorex
RSpec.describe "a ledger" do
  it("sums its entries") { expect([12, 30].sum).to eq(42) }
end
```

Metorex:

```
.

Finished in 0.00511 seconds (files took 0.05178 seconds to load)
1 example, 0 failures
```

MRI 4.0.6:

```
rspec_named.rb:1:in '<main>': uninitialized constant RSpec (NameError)

RSpec.describe "a ledger" do
^^^^^
```

The samples other than the last are `tests/_examples/site/differences_*.rb` in the [metorex repository](https://github.com/metorex-lang/metorex){target=_blank rel=noopener}, where the test suite checks the Metorex output.
