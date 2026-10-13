---
title: "c_extensions/c_debug_no_parens.rb"
slug: c-extensions-c-debug-no-parens
description: "The metorex example program c_extensions/c_debug_no_parens.rb and its output."
---

`tests/_examples/c_extensions/c_debug_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_debug_no_parens.rb).

```metorex
# A C extension opening the debug inspector and reading the self, class,
# binding and location of each frame on the call stack.
require "tmpdir"
require_relative "build_helper"

class Reporter
  def report_frames(debug)
    marker = "inside report_frames"
    debug.frames
  end
end

def describe_frame frame
  receiver, klass, binding, iseq, location = frame
  locals = binding ? binding.local_variables.sort & [:debug, :marker, :outer] : nil
  method = binding ? binding.eval("__method__") : nil
  [receiver.class, klass, locals, method, iseq && [iseq.class, iseq.label, iseq.first_lineno], location.label, location.lineno]
end

directory = Dir.mktmpdir
require build_extension("c_debug.c", "c_debug", directory)
debug = CDebug.new

outer = "at the top"
Reporter.new.report_frames(debug).each { |frame| p describe_frame(frame) }

first = debug.frames.first
p [first[0].equal?(debug), first[1], first[2]]
report { debug.frame_at 100 }
report { debug.frame_at(-1) }
p debug.frame_at(0).equal? debug

reporter_frame = Reporter.new.report_frames(debug)[1]
p reporter_frame[2].local_variable_get :marker
p reporter_frame[2].receiver.class

p CDebug::LOADED_FROM.first.values_at(1, 4).map { |held| held.is_a?(Thread::Backtrace::Location) ? held.label : held }

FileUtils.rm_rf directory
```

Output:

```
[CDebug, CDebug, nil, nil, nil, "CDebug#frames", 0]
[Reporter, Reporter, [:debug, :marker], :report_frames, [RubyVM::InstructionSequence, "report_frames", 7], "Reporter#report_frames", 9]
[Object, nil, [:debug, :outer], nil, [RubyVM::InstructionSequence, "<main>", 0], "<main>", 25]
[true, CDebug, nil]
ArgumentError: no such frame
ArgumentError: no such frame
true
"inside report_frames"
Reporter
[Kernel, "Kernel#require"]
```
