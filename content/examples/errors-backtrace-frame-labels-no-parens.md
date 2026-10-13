---
title: "errors/backtrace/frame_labels_no_parens.rb"
slug: errors-backtrace-frame-labels-no-parens
description: "The metorex example program errors/backtrace/frame_labels_no_parens.rb and its output."
---

`tests/_examples/errors/backtrace/frame_labels_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/backtrace/frame_labels_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A backtrace names a method on a class with a dot and one on an instance
# with a hash, and a block run against another receiver sits where the call
# was made.
module Held
  class Raiser
    def self.from_a_class_method
      raise "from a class method"
    end

    def from_an_instance_method
      raise "from an instance method"
    end
  end
end

def labels_of(raised)
  raised.backtrace.first(2).map { |entry| entry.split(":in ").last }
end

begin
  Held::Raiser.from_a_class_method
rescue RuntimeError => raised
  p labels_of(raised)
end

begin
  Held::Raiser.new.from_an_instance_method
rescue RuntimeError => raised
  p labels_of(raised)
end

class Runner
  def self.protect(&block)
    Object.new.instance_exec &block
  end
end

seen = nil
Runner.protect { seen = caller(1).first.split(":in ").last }
p seen
```

Output:

```
["'Held::Raiser.from_a_class_method'", "'<main>'"]
["'Held::Raiser#from_an_instance_method'", "'<main>'"]
"'BasicObject#instance_exec'"
```
