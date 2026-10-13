---
title: "oop/class_body_clauses_no_parens.rb"
slug: oop-class-body-clauses-no-parens
description: "The metorex example program oop/class_body_clauses_no_parens.rb and its output."
---

`tests/_examples/oop/class_body_clauses_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/class_body_clauses_no_parens.rb).

```metorex
answered = eval(<<~RUBY)
  class WithEnsure
    :body
  ensure
    :ensure
  end
RUBY
puts answered.to_s

module WithRescue
  raise "stopped"
rescue RuntimeError => error
  puts error.message
ensure
  puts "module ensured"
end

held = Object.new
class << held
  raise "singleton stopped"
rescue RuntimeError => error
  puts error.message
end

puts (class << true; self; end).to_s
puts (class << nil; self; end).to_s
begin
  class << 1
    :never
  end
rescue TypeError => error
  puts error.message
end
```

Output:

```
body
stopped
module ensured
singleton stopped
TrueClass
NilClass
can't define singleton
```
