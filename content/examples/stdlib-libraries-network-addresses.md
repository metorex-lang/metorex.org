---
title: "stdlib_libraries/network_addresses.rb"
slug: stdlib-libraries-network-addresses
description: "The metorex example program stdlib_libraries/network_addresses.rb and its output."
---

`tests/_examples/stdlib_libraries/network_addresses.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/network_addresses.rb).

```metorex
# Network addresses and the connections made to them.

require 'socket'

# An Addrinfo names one endpoint: where it is, what port it sits on, and
# how it is reached.
held = Addrinfo.tcp "127.0.0.1", 80
p held.ip_address
p held.ip_port
p held.ip_unpack
p held.afamily == Socket::AF_INET
p held.inspect
p Addrinfo.tcp("::1", 80).inspect
p Addrinfo.udp("127.0.0.1", 80).inspect
p Addrinfo.ip("127.0.0.1").inspect
p Addrinfo.unix("/tmp/held.sock").inspect

# An address says what kind it is.
p Addrinfo.ip("127.0.0.1").ipv4_loopback?
p Addrinfo.ip("10.0.0.1").ipv4_private?
p Addrinfo.ip("224.0.0.1").ipv4_multicast?
p Addrinfo.ip("::1").ipv6_loopback?
p Addrinfo.ip("ff02::1").ipv6_mc_linklocal?
p Addrinfo.ip("fe80::1").ipv6_linklocal?
p Addrinfo.ip("::ffff:127.0.0.1").ipv6_v4mapped?

# The struct the operating system takes an address in reads back out.
p Socket.unpack_sockaddr_in Socket.sockaddr_in(80, "127.0.0.1")
p Addrinfo.new(held.to_sockaddr).ip_address

# A connection made to a socket this program is listening on.
server = TCPServer.new "127.0.0.1", 0
port = server.addr[1]
client = TCPSocket.new "127.0.0.1", port
client.write "hello"
accepted = server.accept
p accepted.read(5)
p accepted.peeraddr[2]
p server.addr[0]
accepted.close
client.close
server.close
p server.closed?
```

Output:

```
"127.0.0.1"
80
["127.0.0.1", 80]
true
"#<Addrinfo: 127.0.0.1:80 TCP>"
"#<Addrinfo: [::1]:80 TCP>"
"#<Addrinfo: 127.0.0.1:80 UDP>"
"#<Addrinfo: 127.0.0.1>"
"#<Addrinfo: /tmp/held.sock SOCK_STREAM>"
true
true
true
true
true
true
true
[80, "127.0.0.1"]
"127.0.0.1"
"hello"
"127.0.0.1"
"AF_INET"
true
```
