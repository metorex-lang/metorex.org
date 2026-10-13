---
title: "stdlib_libraries/socket_recvmsg.rb"
slug: stdlib-libraries-socket-recvmsg
description: "The metorex example program stdlib_libraries/socket_recvmsg.rb and its output."
---

`tests/_examples/stdlib_libraries/socket_recvmsg.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/socket_recvmsg.rb){target=_blank rel=noopener}.

```metorex
# recvmsg answers a message, where it came from, and the flags it arrived
# with. A datagram names the socket that sent it, and a message read off a
# connection names no address at all.
require "socket"

server = Socket.new(:INET, :DGRAM)
server.bind(Socket.sockaddr_in(0, "127.0.0.1"))
client = Socket.new(:INET, :DGRAM)
client.connect(server.getsockname)
client.write("hello")
message, from, flags = server.recvmsg
p([message, from.ip_address, from.ip_port == client.local_address.ip_port, flags])
client.write("truncated")
p(server.recvmsg(2)[0])
p(server.recvmsg_nonblock(exception: false))

listener = Socket.new(:INET, :STREAM)
listener.bind(Socket.sockaddr_in(0, "127.0.0.1"))
listener.listen(1)
caller = Socket.new(:INET, :STREAM)
caller.connect(listener.getsockname)
caller.write("over a connection")
accepted, = listener.accept
read, empty, = accepted.recvmsg
p([read, empty.inspect, empty.afamily, empty.pfamily])
begin
  Socket.new(:INET, :STREAM).recvmsg_nonblock
rescue SystemCallError => error
  p(error.class)
end
caller.close
p(accepted.recvmsg)
```

Output:

```
["hello", "127.0.0.1", true, 0]
"tr"
:wait_readable
["over a connection", "#<Addrinfo: empty-sockaddr SOCK_STREAM>", 0, 0]
Errno::ENOTCONN
nil
```
