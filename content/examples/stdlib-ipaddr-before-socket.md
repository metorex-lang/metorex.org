---
title: "stdlib/ipaddr_before_socket.rb"
slug: stdlib-ipaddr-before-socket
description: "The metorex example program stdlib/ipaddr_before_socket.rb and its output."
---

`tests/_examples/stdlib/ipaddr_before_socket.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/ipaddr_before_socket.rb).

```metorex
# ipaddr loads the socket library for the address families it names, so
# requiring it first leaves Socket the class the socket library defines.
require "ipaddr"
require "socket"

p(Socket.class)
p(Socket::AF_INET == IPAddr.new("10.0.0.1").family)
p(IPAddr.new("::1").ipv6?)
p(IPAddr.new("192.168.0.0/16").include?(IPAddr.new("192.168.1.2")))
p(Addrinfo.tcp("127.0.0.1", 80).ip_address)
```

Output:

```
Class
true
true
true
"127.0.0.1"
```
