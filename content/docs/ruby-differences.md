---
title: Differences from MRI
slug: ruby-differences
description: Where Metorex answers differently from MRI, each shown with a sample and the output of both.
order: 8
aliases: [/ruby-differences]
---

Metorex runs the ruby/spec suite with no failures, so a program that uses only what the suite checks behaves the same under both. The places below are where Metorex answers differently from MRI. Each sample was run under Metorex and under MRI, and both outputs are shown.

## The Version Description

`RUBY_VERSION`, `RUBY_ENGINE`, and `RUBY_ENGINE_VERSION` match MRI's, so version checks in a library pass. `RUBY_DESCRIPTION`, which `-v` prints, names Metorex.

```ruby
puts RUBY_DESCRIPTION
p [RUBY_ENGINE, RUBY_VERSION, RUBY_ENGINE_VERSION]
```

Metorex:

```
metorex 4.0.7 (ruby-compatible) [arm64-darwin]
["ruby", "4.0.7", "4.0.7"]
```

MRI:

```
ruby 4.0.7 (2026-09-15 revision 229531a6cf) +PRISM [arm64-darwin27]
["ruby", "4.0.7", "4.0.7"]
```

## Instruction Sequences

Metorex compiles to instructions of its own rather than YARV's. `RubyVM::InstructionSequence#disasm` lists those instructions with their operands, the local variable a slot operand names, and the line. `#to_a` lists each instruction as its name and operands.

```ruby
source = "total = 2 + 3"
iseq = RubyVM::InstructionSequence.compile(source)
puts iseq.disasm
```

Metorex:

```
== disasm: #<ISeq:<compiled>@<compiled>:1 (1,0)-(1,13)>
0000 Unhoist slot: 0  ; total               (   1)[Li]
0001 LoadInteger to: 0, value: 2            (   1)
0002 LoadInteger to: 1, value: 3            (   1)
0003 Add to: 0, left: 0, right: 1           (   1)
0004 SetLocal from: 0, slot: 0  ; total     (   1)
0005 Return from: 0                         (   1)
```

MRI:

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

## Virtual Machine Statistics

`RubyVM.stat` answers `constant_cache_invalidations` and `constant_cache_misses` from Metorex's own constant caches: the times a constant or an autoload changed, and the constant reads that looked the constant up. `next_shape_id` counts the object shapes Metorex has made, which share the names of objects' instance variables. It answers `global_cvar_state` and `shape_cache_size` at zero, since Metorex keeps neither. It also answers keys MRI does not have: `units_compiled` and `instructions_compiled`, the units of code Metorex has compiled so far and the instructions they hold, and `method_cache_hits` and `method_cache_misses`, the calls a call site answered from the methods it keeps by the receiver's class and those that looked the method up.

```ruby
stat = RubyVM.stat
kept = %i[global_cvar_state shape_cache_size]
p stat.slice(*kept).values.all?(&:zero?)
units = stat[:units_compiled]
p units && stat[:instructions_compiled] > units
p stat.fetch(:method_cache_hits, 0) > 0
```

Metorex:

```
true
true
true
```

MRI:

```
false
false
false
```

## The Garbage Collector

Metorex counts references to each object and frees it when the count reaches zero, and a cycle collector frees objects that refer to each other. `GC.config` names that collector.

```ruby
p GC.config[:implementation]
```

Metorex:

```
"metorex"
```

MRI:

```
"default"
```

## Native Thread IDs

Every Metorex thread runs on the one operating system thread the interpreter runs on, taking turns. `Thread#native_thread_id` answers that thread's id for the thread running now, and nil for a thread waiting its turn.

```ruby
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

MRI:

```
true
Integer
```

## Libraries Loaded at Startup

Metorex loads `error_highlight` and `did_you_mean` as it starts, with or without `--disable-gems`. MRI loads them through RubyGems, so `--disable-gems` leaves them out there. Under Metorex `--disable=error_highlight` and `--disable=did_you_mean` leave each one out.

```ruby
p defined?(ErrorHighlight)
p defined?(DidYouMean)
```

Run with `--disable-gems`, Metorex:

```
"constant"
"constant"
```

MRI:

```
nil
nil
```

## Naming RSpec

Rex, the spec framework built into Metorex, loads the first time a program names `RSpec`, and the examples the program defined run as it ends. Under MRI the program has to require `rspec/autorun` from the RSpec gems first.

```ruby
RSpec.describe "a ledger" do
  it "sums its entries" do
    expect([12, 30].sum).to eq(42)
  end
end
```

Metorex:

```
.

Finished in 0.00511 seconds (files took 0.05178 seconds to load)
1 example, 0 failures
```

MRI:

```
rspec_named.rb:1:in '<main>': uninitialized constant RSpec (NameError)

RSpec.describe "a ledger" do
^^^^^
```
