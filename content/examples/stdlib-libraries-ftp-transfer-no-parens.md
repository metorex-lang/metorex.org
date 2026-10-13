---
title: "stdlib_libraries/ftp_transfer_no_parens.rb"
slug: stdlib-libraries-ftp-transfer-no-parens
description: "The metorex example program stdlib_libraries/ftp_transfer_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/ftp_transfer_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/ftp_transfer_no_parens.rb){target=_blank rel=noopener}.

```metorex
require 'socket'
require 'net/ftp'

# The same as `ftp_transfer.rb`, written without parentheses.
# A server answering the handful of commands a listing and a download need.
listener = TCPServer.new('127.0.0.1', 0)
serving = Thread.new do
  control = listener.accept
  control.print("220 ready\r\n")
  data = nil
  while (line = control.gets)
    line = line.chomp
    case line
    when /\APORT (.*)\z/
      parts = Regexp.last_match(1).split(',')
      data = TCPSocket.new(parts[0, 4].join('.'), parts[4].to_i * 256 + parts[5].to_i)
      control.print("200 port opened\r\n")
    when /\ALIST/
      control.print("150 opening\r\n")
      data.print("one.rb\r\n")
      data.print("two.rb\r\n")
      data.close
      control.print("226 transfer complete\r\n")
    when /\ARETR/
      control.print("125 sending\r\n")
      data.print("first line\r\nsecond line\r\n")
      data.close
      control.print("226 transfer complete\r\n")
    when /\AMDTM/
      control.print("213 19980705132316\r\n")
    when /\AQUIT/
      control.print("221 bye\r\n")
      break
    else
      control.print("200 ok\r\n")
    end
  end
  control.close
end

session = Net::FTP.new
session.passive = false
session.connect '127.0.0.1', listener.addr[1]

p session.list('files')

lines = []
session.retrlines('RETR notes.txt') { |line| lines << line }
p lines

p session.mtime('notes.txt')
p session.quit

serving.join
listener.close
```

Output:

```
["one.rb", "two.rb"]
["first line", "second line"]
1998-07-05 13:23:16 UTC
nil
```
