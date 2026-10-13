---
title: "stdlib_libraries/socket_options_no_parens.rb"
slug: stdlib-libraries-socket-options-no-parens
description: "The metorex example program stdlib_libraries/socket_options_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/socket_options_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/socket_options_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Socket.new opens a descriptor straight away, so a socket's settings are
# the operating system's to read and change before it is bound. A value is
# written as a C int when it is a number or a boolean, and as raw bytes
# when it is a String.
require "socket"

socket = Socket.new(:INET, :STREAM)
p socket.getsockopt(:SOCKET, :TYPE).int == Socket::SOCK_STREAM
p socket.setsockopt(:SOCKET, :REUSEADDR, true)
p socket.getsockopt(:SOCKET, :REUSEADDR).bool
p socket.setsockopt(:IP, :TTL, 64)
p socket.getsockopt(:IP, :TTL).int
socket.setsockopt Socket::Option.linger(true, 10)
p socket.getsockopt(:SOCKET, :LINGER).linger.last

begin
  socket.setsockopt(:SOCKET, :LINGER, 0)
rescue SystemCallError => error
  p [error.class, error.message]
end
begin
  socket.setsockopt(:SOCKET, :SNDBUF, nil)
rescue TypeError => error
  p error.message
end
socket.close
```

Output:

```
true
0
true
0
64
10
[Errno::EINVAL, "Invalid argument - setsockopt(2)"]
"no implicit conversion of nil into String"
```
