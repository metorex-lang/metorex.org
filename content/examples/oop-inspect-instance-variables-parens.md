---
title: "oop/inspect_instance_variables_parens.rb"
slug: oop-inspect-instance-variables-parens
description: "The metorex example program oop/inspect_instance_variables_parens.rb and its output."
---

`tests/_examples/oop/inspect_instance_variables_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/inspect_instance_variables_parens.rb).

```metorex
class Connection
  def initialize
    @host = "localhost"
    @port = 5432
    @open = true
  end
end

connection = Connection.new
puts(connection.inspect.sub(/0x[0-9a-f]+/, "0x"))
puts(connection.to_s.sub(/0x[0-9a-f]+/, "0x"))

class Bare
end

puts(Bare.new.inspect.sub(/0x[0-9a-f]+/, "0x"))

class Chosen
  def initialize
    @shown = "yes"
    @hidden = "no"
  end

  def instance_variables_to_inspect = [:@shown, :@missing]
end

puts(Chosen.new.inspect.sub(/0x[0-9a-f]+/, "0x"))

class NoneChosen
  def initialize
    @a = 1
  end

  def instance_variables_to_inspect = []
end

puts(NoneChosen.new.inspect.sub(/0x[0-9a-f]+/, "0x"))

class BadChoice
  def initialize
    @a = 1
  end

  def instance_variables_to_inspect = {}
end

begin
  BadChoice.new.inspect
rescue TypeError => error
  puts(error.message)
end

held = Connection.new
puts [held].inspect.sub(/0x[0-9a-f]+/, "0x")
puts({ at: held }.inspect.sub(/0x[0-9a-f]+/, "0x"))

require "stringio"

caught = StringIO.new
$stdout = caught
p held
$stdout = STDOUT
puts caught.string.sub(/0x[0-9a-f]+/, "0x")
```

Output:

```
#<Connection:0x @host="localhost", @port=5432, @open=true>
#<Connection:0x>
#<Bare:0x>
#<Chosen:0x @shown="yes">
#<NoneChosen:0x>
Expected #instance_variables_to_inspect to return an Array or nil, but it returned Hash
[#<Connection:0x @host="localhost", @port=5432, @open=true>]
{at: #<Connection:0x @host="localhost", @port=5432, @open=true>}
#<Connection:0x @host="localhost", @port=5432, @open=true>
```
