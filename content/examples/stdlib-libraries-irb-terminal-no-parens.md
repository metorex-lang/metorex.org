---
title: "stdlib_libraries/irb_terminal_no_parens.rb"
slug: stdlib-libraries-irb-terminal-no-parens
description: "The metorex example program stdlib_libraries/irb_terminal_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/irb_terminal_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/irb_terminal_no_parens.rb).

```metorex
# irb on a terminal reads each line through reline, which completes a name
# on Tab, and `exit` ends the session.
require "pty"
require "rbconfig"
require "tmpdir"

transcript = +""
status = nil
Dir.mktmpdir do |home|
  environment = {"HOME" => home, "TERM" => "xterm-256color", "IRBRC" => nil, "XDG_CONFIG_HOME" => nil}
  PTY.spawn(environment, RbConfig.ruby, "-e", "require 'irb'; IRB.start") do |reader, writer, pid|
    read_until = lambda do |pattern|
      deadline = Process.clock_gettime(Process::CLOCK_MONOTONIC) + 60
      until transcript.match?(pattern) || Process.clock_gettime(Process::CLOCK_MONOTONIC) > deadline
        next unless IO.select([reader], nil, nil, 0.2)
        begin
          transcript << reader.read_nonblock(4096)
        rescue IO::WaitReadable
        rescue EOFError, Errno::EIO
          break
        end
      end
    end
    read_until.(/irb\(main\):001/)
    ["rate = 7\r", "rat\t * 2\r", "[1, 2].fir\t\r"].each_with_index do |line, index|
      writer.write(line)
      read_until.(/irb\(main\):#{format("%03d", index + 2)}/)
    end
    writer.write("exit\r")
    read_until.(/exit\r\r\n/)
    Process.wait(pid)
    status = $?.exitstatus
  end
end

shown = transcript.b.gsub(/\e\[[0-9;?]*[A-Za-z]/n, "").delete("\r")
shown = shown[shown.index("irb(main):001")..]
puts shown.lines.map(&:chomp).reject(&:empty?).uniq
p status
```

Output:

```
irb(main):001> irb(main):001> rate = 7
=> 7
irb(main):002> irb(main):002> rate * 2
=> 14
irb(main):003> irb(main):003> [1, 2].first
=> 1
irb(main):004> irb(main):004> exit
0
```
