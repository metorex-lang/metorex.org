---
title: "backtraces/block_file_runner.rb"
slug: backtraces-block-file-runner
description: "The metorex example program backtraces/block_file_runner.rb and its output."
---

`tests/_examples/backtraces/block_file_runner.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/backtraces/block_file_runner.rb).

```metorex
module BlockFileRunner
  def self.call_block(&block)
    block.call
  end

  def self.exec_block(&block)
    Object.new.instance_exec(&block)
  end

  def self.locate
    caller_locations(1, 1).first
  end
end

module BlockFileRunner
  def self.module_exec_block(&block)
    Module.new.module_exec(&block)
  end

  def self.class_exec_block(&block)
    Class.new.class_exec(&block)
  end
end
```
