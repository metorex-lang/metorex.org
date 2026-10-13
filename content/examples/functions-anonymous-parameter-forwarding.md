---
title: "functions/anonymous_parameter_forwarding.rb"
slug: functions-anonymous-parameter-forwarding
description: "The metorex example program functions/anonymous_parameter_forwarding.rb and its output."
---

`tests/_examples/functions/anonymous_parameter_forwarding.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/anonymous_parameter_forwarding.rb){target=_blank rel=noopener}.

```metorex
def target(*args, **options, &given)
  [args, options, given.nil?].inspect
end

def forward_rest(*)
  target(*)
end
puts forward_rest(1, 2)

def forward_keywords(**)
  target(**)
end
puts forward_keywords(a: 1)

def forward_block(&)
  target(&)
end
puts forward_block { :ignored }

def forward_everything(...)
  target(...)
end
puts forward_everything(1, a: 2)

["*", "**", "&"].each do |anonymous|
  begin
    eval("def outer(#{anonymous}); proc { |#{anonymous}| target(#{anonymous}) }; end")
    puts "no error"
  rescue SyntaxError => refused
    puts refused.message.include?("also used within block")
  end
end
```

Output:

```
[[1, 2], {}, true]
[[], {a: 1}, true]
[[], {}, false]
[[1], {a: 2}, true]
true
true
true
```
