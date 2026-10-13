---
title: "stdlib_libraries/shipped_libraries_no_parens.rb"
slug: stdlib-libraries-shipped-libraries-no-parens
description: "The metorex example program stdlib_libraries/shipped_libraries_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/shipped_libraries_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/shipped_libraries_no_parens.rb).

```metorex
# The libraries metorex carries, reached with require the way any other
# library is.
require 'base64'
require 'shellwords'
require 'abbrev'
require 'singleton'
require 'observer'
require 'securerandom'
require 'stringio'
require 'ostruct'
require 'prime'

p Base64.encode64 "Now is the time for all good coders\nto learn Ruby"
p Base64.strict_encode64 "hello"
p Base64.decode64 "aGVsbG8="
p Base64.strict_decode64 "aGVsbG8="
p Base64.urlsafe_encode64 "hello?"
p Base64.urlsafe_encode64("hello?", padding: false)
p Base64.urlsafe_decode64 "aGVsbG8_"

p Shellwords.shellsplit "ruby -e 'puts 1' --name value"
p Shellwords.shellescape "a b"
p Shellwords.shelljoin ["ruby", "a b"]
p "one 'two three'".shellsplit

p Abbrev.abbrev ["ruby"]
p ["car", "cone"].abbrev

class Settings
  include Singleton

  def initialize
    @count = 0
  end

  def count
    @count
  end
end

p Settings.instance.equal? Settings.instance
p Settings.instance.count

begin
  Settings.new
rescue NoMethodError => error
  p error.class
end

begin
  Settings.instance.dup
rescue TypeError => error
  p error.class
end

class Ticker
  include Observable

  def tick(value)
    changed
    notify_observers(value)
  end
end

class Watcher
  attr_reader :seen

  def update(value)
    @seen = value
  end
end

ticker = Ticker.new
watcher = Watcher.new
p ticker.count_observers
ticker.add_observer watcher
p ticker.count_observers
ticker.tick :moved
p watcher.seen
ticker.delete_observer watcher
p ticker.count_observers

p SecureRandom.hex.length
p SecureRandom.hex(4).length
p SecureRandom.hex(0)
p SecureRandom.uuid.length
p SecureRandom.random_number(10).class

buffer = StringIO.new("example")
p buffer.size
p buffer.length
p buffer.getc
p buffer.pos
p buffer.read(3)
p buffer.tell
p buffer.eof?
p buffer.fileno
p buffer.pid
p buffer.tty?
p buffer.sync
p buffer.flush.equal? buffer
buffer.close_read
p buffer.closed?
buffer.close_write
p buffer.closed?

lines = StringIO.new("first\nsecond\n")
p lines.gets
p lines.lineno
p lines.readlines
p lines.rewind
p lines.each_line.to_a
p StringIO.new("abc").each_char.to_a
p StringIO.new("abc").each_byte.to_a
p StringIO.new("abc").readchar
p StringIO.new("abc").readbyte

written = StringIO.new
written.write "one"
written.print " ", "two"
written.putc 33
written.puts
written << "three"
p written.string
p written.pos

placed = StringIO.new("example")
placed.pos = 10
placed << "end"
p placed.string.bytes.length
p placed.seek(2)
p placed.pos
p placed.truncate(4)
p placed.string

reading = StringIO.new("locked", "r")
begin
  reading.write "x"
rescue IOError => error
  p error.class
end

record = OpenStruct.new(name: "Ada", year: 1843)
p record.name
p record.year
record.field = "computing"
p record.field
p record[:name]
record[:city] = "London"
p record.city
p record.to_h
p record.inspect
p record.respond_to?(:name)
record.delete_field :name
p record.respond_to?(:name)
p record[:name]
p OpenStruct.new(a: 1) == OpenStruct.new(a: 1)
p OpenStruct.new.to_s

p Prime.prime? 2
p Prime.prime? 15
p Prime.first 5
p Prime.prime_division 360
p Prime.int_from_prime_division [[2, 3], [3, 2]]
p Prime.prime_division -10
p 7.prime?
p 12.prime_division
p Integer.from_prime_division [[2, 2], [5, 1]]

walk = Prime.instance.each
p walk.next
p walk.next
walk.rewind
p walk.next
```

Output:

```
"Tm93IGlzIHRoZSB0aW1lIGZvciBhbGwgZ29vZCBjb2RlcnMKdG8gbGVhcm4g\nUnVieQ==\n"
"aGVsbG8="
"hello"
"hello"
"aGVsbG8_"
"aGVsbG8_"
"hello?"
["ruby", "-e", "puts 1", "--name", "value"]
"a\\ b"
"ruby a\\ b"
["one", "two three"]
{"ruby" => "ruby", "rub" => "ruby", "ru" => "ruby", "r" => "ruby"}
{"car" => "car", "ca" => "car", "cone" => "cone", "con" => "cone", "co" => "cone"}
true
0
NoMethodError
TypeError
0
1
:moved
0
32
8
""
36
Integer
7
7
"e"
1
"xam"
4
false
nil
nil
false
true
true
false
true
"first\n"
1
["second\n"]
0
["first\n", "second\n"]
["a", "b", "c"]
[97, 98, 99]
"a"
97
"one two!\nthree"
14
13
0
2
0
"exam"
IOError
"Ada"
1843
"computing"
"Ada"
"London"
{name: "Ada", year: 1843, field: "computing", city: "London"}
"#<OpenStruct name=\"Ada\", year=1843, field=\"computing\", city=\"London\">"
true
false
nil
true
"#<OpenStruct>"
true
false
[2, 3, 5, 7, 11]
[[2, 3], [3, 2], [5, 1]]
72
[[-1, 1], [2, 1], [5, 1]]
true
[[2, 2], [3, 1]]
20
2
3
2
```
