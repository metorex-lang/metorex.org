---
title: "ractors/passing_messages.rb"
slug: ractors-passing-messages
description: "The metorex example program ractors/passing_messages.rb and its output."
---

`tests/_examples/ractors/passing_messages.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/ractors/passing_messages.rb){target=_blank rel=noopener}.

```metorex
# A Ractor receives what is sent to a port it made. Its default port takes
# what `Ractor#send` sends, a value is copied on the way unless it is
# shareable, and one sent with `move: true` leaves nothing usable behind.
# `Ractor.select` answers the first port or Ractor with something to hand over.

Warning[:experimental] = false
p(Ractor.current.default_port)
port = Ractor::Port.new
p(port)
port << 1; port.send(2)
p(port.receive, port.receive)
r = Ractor.new(port) { |pt| pt << Ractor.receive * 10; :ok }
r.send(4)
p(port.receive, r.value)
p(r.default_port.class, Ractor.current.default_port.class)
reader = Ractor.new(port) { |pt| begin; pt.receive; rescue => e; [e.class, e.message]; end }
p(reader.value)
p(Ractor::Port.new)
p(reader.default_port)
port.close; p(port.closed?)
begin; port << 1; rescue => e; p([e.class, e.message]); end
begin; port.receive; rescue => e; p([e.class, e.message]); end
a = Ractor::Port.new; b = Ractor::Port.new
a << :x
p(Ractor.select(a, b))
r2 = Ractor.new { :value_done }
p(Ractor.select(r2).map { |held| held.is_a?(Ractor) ? held.class : held })
s = +"moved"
q = Ractor::Port.new
q.send(s, move: true)
v = q.receive
p(v, v.equal?(s))
begin; p(s); rescue => e; p([e.class, e.message]); end
begin; s.inspect; rescue => e; p([e.class, e.message]); end
begin; s.class; rescue => e; p([e.class, e.message]); end
p(Ractor::MovedObject.superclass)
x = [1]; q << x; y = q.receive; p(y.equal?(x), y == x)
p(Ractor::Port.instance_methods(false).sort)
w = Ractor::Port.new
begin; p(Ractor.select(w, timeout: 0.01)); rescue => e; p([e.class, e.message]); end
begin; Ractor.select; rescue => e; p([e.class, e.message]); end
```

Output:

```
#<Ractor::Port to:#1 id:0>
#<Ractor::Port to:#1 id:1>
1
2
40
:ok
Ractor::Port
Ractor::Port
[Ractor::Error, "only allowed from the creator Ractor of this port"]
#<Ractor::Port to:#1 id:4>
#<Ractor::Port to:#3 id:0>
true
[Ractor::ClosedError, "The port was already closed"]
[Ractor::ClosedError, "The port was already closed"]
[#<Ractor::Port to:#1 id:5>, :x]
[Ractor, :value_done]
"moved"
false
[NoMethodError, "undefined method 'inspect' for an instance of Ractor::MovedObject"]
[Ractor::MovedError, "can not send any methods to a moved object"]
[Ractor::MovedError, "can not send any methods to a moved object"]
BasicObject
false
true
[:<<, :close, :closed?, :inspect, :receive, :send]
[ArgumentError, "should be Ractor::Port or Ractor"]
[ArgumentError, "specify at least one Ractor::Port or Ractor"]
```
