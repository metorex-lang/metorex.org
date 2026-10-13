---
title: "stdlib_libraries/socket_connect_nonblock_no_parens.rb"
slug: stdlib-libraries-socket-connect-nonblock-no-parens
description: "The metorex example program stdlib_libraries/socket_connect_nonblock_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/socket_connect_nonblock_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/socket_connect_nonblock_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A connect told not to wait starts the connection and reports that it is
# under way. Once the socket can be written to, a second try finds it
# connected, which Linux reports by answering 0 and macOS by raising
# Errno::EISCONN. Without exceptions both answer 0.
require "socket"

server = TCPServer.new("127.0.0.1", 0)
address = Socket.sockaddr_in(server.addr[1], "127.0.0.1")
socket = Socket.new(:INET, :STREAM)
begin
  socket.connect_nonblock address
rescue IO::WaitWritable => error
  p [error.class, error.message]
end
IO.select(nil, [socket])
p socket.connect_nonblock(address, exception: false)
peer = server.accept
socket.write "connected"
p peer.recv(9)

waiting = Socket.new(:INET, :STREAM)
p waiting.connect_nonblock(address, exception: false)
p Socket.new(:INET, :STREAM).connect_address rescue p $!.message
```

Output:

```
[IO::EINPROGRESSWaitWritable, "Operation now in progress - connect(2) would block"]
0
"connected"
:wait_writable
"unbound IPv4 socket"
```
