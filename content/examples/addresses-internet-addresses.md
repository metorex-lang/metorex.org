---
title: "addresses/internet_addresses.rb"
slug: addresses-internet-addresses
description: "The metorex example program addresses/internet_addresses.rb and its output."
---

`tests/_examples/addresses/internet_addresses.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/addresses/internet_addresses.rb).

```metorex
# An IP address held as the number it stands for, together with the mask that
# says how much of it names the network.
require 'ipaddr'

here = IPAddr.new("192.168.1.2/24")

p here.to_s
p here.to_string
p here.inspect
p here.ipv4?
p here.ipv6?
p here.family == Socket::AF_INET
p here.prefix
p here.to_i
p here.reverse

# IPv6 is written with its longest run of zero groups left out.
wide = IPAddr.new("3ffe:0505:0002:0000:0000:0000:0000:0001")
p wide.to_s
p wide.to_string
p IPAddr.new.to_s
p IPAddr.new("0:0:0:1::").to_s
p IPAddr.new("3ffe:505:2::/48").to_s
p IPAddr.new("3ffe:505:2::/ffff:ffff:ffff::").to_s
p IPAddr.new("3ffe:505:2::f").ip6_arpa

# An IPv4 address written inside an IPv6 one keeps its dotted form.
p IPAddr.new("::192.168.1.2").to_s
p IPAddr.new("::ffff:192.168.1.2").to_s
p IPAddr.new("::ffff:192.168.1.2").ipv4_mapped?
p IPAddr.new("::ffff:192.168.1.2").native.to_s
p IPAddr.new("192.168.1.2").ipv4_compat.to_s

network = IPAddr.new("192.168.2.0/24")
p network.include?(IPAddr.new("192.168.2.255"))
p network.include?(IPAddr.new("192.168.3.0"))
p network == IPAddr.new("192.168.2.0/24")
p network == "sometext"
p (IPAddr.new("3ffe:505:2::") | IPAddr.new("0:0:0:1::")).to_s
p (IPAddr.new("3ffe:505:2::") & IPAddr.new("ffff:ffff::")).to_s
p (IPAddr.new("3ffe:505:2::") >> 16).to_s
p (~IPAddr.new).to_s
p IPAddr.new("3ffe:505:2::/48").mask(32).to_s

begin
  IPAddr.new("[192.168.1.2]/120")
rescue IPAddr::Error => problem
  p problem.class
end
```

Output:

```
"192.168.1.0"
"192.168.1.0"
"#<IPAddr: IPv4:192.168.1.0/255.255.255.0>"
true
false
true
24
3232235776
"0.1.168.192.in-addr.arpa"
"3ffe:505:2::1"
"3ffe:0505:0002:0000:0000:0000:0000:0001"
"::"
"0:0:0:1::"
"3ffe:505:2::"
"3ffe:505:2::"
"f.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.2.0.0.0.5.0.5.0.e.f.f.3.ip6.arpa"
"::192.168.1.2"
"::ffff:192.168.1.2"
true
"192.168.1.2"
"::192.168.1.2"
true
false
true
false
"3ffe:505:2:1::"
"3ffe:505::"
"0:3ffe:505:2::"
"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff"
"3ffe:505::"
IPAddr::InvalidAddressError
```
