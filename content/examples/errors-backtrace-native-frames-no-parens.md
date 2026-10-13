---
title: "errors/backtrace/native_frames_no_parens.rb"
slug: errors-backtrace-native-frames-no-parens
description: "The metorex example program errors/backtrace/native_frames_no_parens.rb and its output."
---

`tests/_examples/errors/backtrace/native_frames_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/backtrace/native_frames_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A backtrace lists the native methods running between the raise and the
# rescue, inside blocks run against another receiver, inside threads and
# inside a Ractor.
def entries_of(raised)
  raised.backtrace.map { |entry| entry[entry.index(File.basename __FILE__)..] }
end

class Plain
  def converts = Integer "x"
end

def calls_missing = nil.no_such_method

begin
  Plain.new.converts
rescue ArgumentError => raised
  p entries_of raised
end

begin
  Object.new.instance_exec { Integer "x" }
rescue ArgumentError => raised
  p entries_of raised
end

begin
  Plain.new.instance_eval { Integer "x" }
rescue ArgumentError => raised
  p entries_of raised
end

begin
  Plain.class_eval { Integer "x" }
rescue ArgumentError => raised
  p entries_of raised
end

[1].each do
  Plain.class_exec 2 do |number| Integer "x" end
rescue ArgumentError => raised
  p entries_of raised
end

[1].each do
  [2].each { calls_missing }
rescue NoMethodError => raised
  p entries_of raised
end

begin
  [1].map { |number| number / 0 }
rescue ZeroDivisionError => raised
  p entries_of raised
end

thread = Thread.new { Object.new.instance_exec { Integer "x" } }
thread.report_on_exception = false
begin
  thread.join
rescue ArgumentError => raised
  p entries_of raised
end

def returns_from_class_eval
  Plain.class_eval { return 5 }
  6
end
p returns_from_class_eval

Warning[:experimental] = false
ractor = Ractor.new { Integer "x" }
begin
  ractor.value
rescue Ractor::RemoteError => raised
  p entries_of raised.cause
end
```

Output:

```
["native_frames_no_parens.rb:9:in 'Kernel#Integer'", "native_frames_no_parens.rb:9:in 'Plain#converts'", "native_frames_no_parens.rb:15:in '<main>'"]
["native_frames_no_parens.rb:21:in 'Kernel#Integer'", "native_frames_no_parens.rb:21:in 'block in <main>'", "native_frames_no_parens.rb:21:in 'BasicObject#instance_exec'", "native_frames_no_parens.rb:21:in '<main>'"]
["native_frames_no_parens.rb:27:in 'Kernel#Integer'", "native_frames_no_parens.rb:27:in 'block in <main>'", "native_frames_no_parens.rb:27:in 'BasicObject#instance_eval'", "native_frames_no_parens.rb:27:in '<main>'"]
["native_frames_no_parens.rb:33:in 'Kernel#Integer'", "native_frames_no_parens.rb:33:in 'block in <main>'", "native_frames_no_parens.rb:33:in 'Module#class_eval'", "native_frames_no_parens.rb:33:in '<main>'"]
["native_frames_no_parens.rb:39:in 'Kernel#Integer'", "native_frames_no_parens.rb:39:in 'block (2 levels) in <main>'", "native_frames_no_parens.rb:39:in 'Module#class_exec'", "native_frames_no_parens.rb:39:in 'block in <main>'", "native_frames_no_parens.rb:38:in 'Array#each'", "native_frames_no_parens.rb:38:in '<main>'"]
["native_frames_no_parens.rb:12:in 'Object#calls_missing'", "native_frames_no_parens.rb:45:in 'block (2 levels) in <main>'", "native_frames_no_parens.rb:45:in 'Array#each'", "native_frames_no_parens.rb:45:in 'block in <main>'", "native_frames_no_parens.rb:44:in 'Array#each'", "native_frames_no_parens.rb:44:in '<main>'"]
["native_frames_no_parens.rb:51:in 'Integer#/'", "native_frames_no_parens.rb:51:in 'block in <main>'", "native_frames_no_parens.rb:51:in 'Array#map'", "native_frames_no_parens.rb:51:in '<main>'"]
["native_frames_no_parens.rb:56:in 'Kernel#Integer'", "native_frames_no_parens.rb:56:in 'block (2 levels) in <main>'", "native_frames_no_parens.rb:56:in 'BasicObject#instance_exec'", "native_frames_no_parens.rb:56:in 'block in <main>'"]
5
["native_frames_no_parens.rb:71:in 'Kernel#Integer'", "native_frames_no_parens.rb:71:in 'block in <main>'"]
```
