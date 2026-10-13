---
title: "metaprogramming/get_source.rb"
slug: metaprogramming-get-source
description: "The metorex example program metaprogramming/get_source.rb and its output."
---

`tests/_examples/metaprogramming/get_source.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/get_source.rb){target=_blank rel=noopener}.

```metorex
# get_source - retrieve a Method object for a named method

class Dog
  def speak
    "Woof!"
  end

  def fetch(item)
    "Fetching #{item}!"
  end
end

dog = Dog.new

# get_source returns a Method object for user-defined methods
m = dog.get_source(:speak)
puts m.name

m2 = dog.get_source(:fetch)
puts m2.name

# get_source returns nil for undefined methods
result = dog.get_source(:nonexistent)
puts result.nil?

# get_source works with string names too
m3 = dog.get_source("speak")
puts m3.name

# get_source works on class objects themselves
class Cat
  def purr
    "Purr..."
  end
end

m4 = Cat.new.get_source(:purr)
puts m4.name

# get_source with inherited methods
class Kitten < Cat
end

k = Kitten.new
m5 = k.get_source(:purr)
puts m5.name
```

Output:

```
speak
fetch
true
speak
purr
purr
```
