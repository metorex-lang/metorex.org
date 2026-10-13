---
title: "oop/undef_keyword.rb"
slug: oop-undef-keyword
description: "The metorex example program oop/undef_keyword.rb and its output."
---

`tests/_examples/oop/undef_keyword.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/undef_keyword.rb).

```metorex
class Base
  def greet
    "hello"
  end

  def farewell
    "bye"
  end
end

class Quiet < Base
  undef greet, :farewell
end

puts Base.new.greet
puts Quiet.new.respond_to?(:greet)
puts Quiet.new.respond_to? :farewell

begin
  Quiet.new.greet
rescue NoMethodError
  puts "greet undefined"
end
```

Output:

```
hello
false
false
greet undefined
```
