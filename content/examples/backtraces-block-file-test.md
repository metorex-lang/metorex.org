---
title: "backtraces/block_file_test.rb"
slug: backtraces-block-file-test
description: "The metorex example program backtraces/block_file_test.rb and its output."
---

`tests/_examples/backtraces/block_file_test.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/backtraces/block_file_test.rb).

```metorex
require_relative "block_file_runner"

def short(path)
  File.basename(path.to_s)
end

location = BlockFileRunner.call_block { BlockFileRunner.locate }
puts "call: #{short(location.path)}:#{location.lineno}"

location = BlockFileRunner.exec_block { BlockFileRunner.locate }
puts "instance_exec: #{short(location.path)}:#{location.lineno}"

begin
  BlockFileRunner.exec_block { raise "boom" }
rescue => error
  puts "raised: #{error.backtrace.first.sub(/\A.*\//, '')}"
end

location = BlockFileRunner.module_exec_block { BlockFileRunner.locate }
puts "module_exec: #{short(location.path)}:#{location.lineno}"

location = BlockFileRunner.class_exec_block { BlockFileRunner.locate }
puts "class_exec: #{short(location.path)}:#{location.lineno}"

begin
  BlockFileRunner.module_exec_block { raise "boom" }
rescue => error
  puts "module_exec raised: #{error.backtrace.first.sub(/\A.*\//, '')}"
end
```

Output:

```
call: block_file_test.rb:7
instance_exec: block_file_test.rb:10
raised: block_file_test.rb:14:in 'block in <main>'
module_exec: block_file_test.rb:19
class_exec: block_file_test.rb:22
module_exec raised: block_file_test.rb:26:in 'block in <main>'
```
