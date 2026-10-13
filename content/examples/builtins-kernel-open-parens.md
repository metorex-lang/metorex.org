---
title: "builtins/kernel_open_parens.rb"
slug: builtins-kernel-open-parens
description: "The metorex example program builtins/kernel_open_parens.rb and its output."
---

`tests/_examples/builtins/kernel_open_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/kernel_open_parens.rb){target=_blank rel=noopener}.

```metorex
path = "/tmp/metorex_kernel_open_#{Process.pid}.txt"

File.open(path, "w") do |file|
  file.write "first line\nsecond line\n"
end

handle = open(path)
puts(handle.class)
puts(handle.gets)
puts(handle.gets)
puts(handle.gets.inspect)
handle.close

puts(open(path, "r") { |file| file.gets })

class Pathish
  def to_path
    ENV["METOREX_OPEN_PATH"]
  end
end

ENV["METOREX_OPEN_PATH"] = path
puts(open(Pathish.new, "r") { |file| file.gets })

class Openable
  def to_open(*arguments)
    arguments
  end
end

p(open(Openable.new, 1, 2, 3))
p(open(Openable.new) { |value| value })

begin
  open
rescue ArgumentError => error
  puts(error.message)
end

begin
  open(path, "r", 0, 0)
rescue ArgumentError => error
  puts(error.message)
end

puts(File::CREAT == File::Constants::CREAT)
puts(Kernel.private_instance_methods.include?(:open))
File.delete(path)
```

Output:

```
File
first line
second line
nil
first line
first line
[1, 2, 3]
[]
wrong number of arguments (given 0, expected 1..3)
wrong number of arguments (given 4, expected 1..3)
true
true
```
