---
title: "metaprogramming/implicit_blocks.rb"
slug: metaprogramming-implicit-blocks
description: "The metorex example program metaprogramming/implicit_blocks.rb and its output."
---

`tests/_examples/metaprogramming/implicit_blocks.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/metaprogramming/implicit_blocks.rb).

```metorex
# Implicit block capture - trailing blocks passed to methods

# Method that accepts a block via &block parameter
def greet(name, &block)
  if block_given?
    block.call(name)
  else
    "Hello, #{name}!"
  end
end

result1 = greet("Alice") do |n|
  "Howdy, #{n}!"
end
puts result1

result2 = greet("Bob") { |n| "Hey, #{n}!" }
puts result2

result3 = greet("Charlie")
puts result3

# Method that uses the block parameter
def repeat(times, &block)
  i = 0
  while i < times
    block.call(i)
    i = i + 1
  end
end

repeat(3) do |i|
  puts "Iteration: #{i}"
end

# block_given? with and without block
def maybe_block(&block)
  if block_given?
    block.call
  else
    "no block"
  end
end

puts maybe_block()
puts maybe_block { "got a block" }

# Storing a block and calling it later
def capture(&block)
  block
end

my_block = capture { |x| x * 2 }
puts my_block.call(5)
puts my_block.call(10)

# each with a block
[1, 2, 3].each do |n|
  puts n * n
end

# map with a block
squares = [1, 2, 3, 4].map { |n| n * n }
puts squares

# select with a block
evens = [1, 2, 3, 4, 5, 6].select { |n| n % 2 == 0 }
puts evens

# Range each with block
(1..5).each do |i|
  puts i
end
```

Output:

```
Howdy, Alice!
Hey, Bob!
Hello, Charlie!
Iteration: 0
Iteration: 1
Iteration: 2
no block
got a block
10
20
1
4
9
1
4
9
16
2
4
6
1
2
3
4
5
```
