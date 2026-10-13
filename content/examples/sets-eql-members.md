---
title: "sets/eql_members.rb"
slug: sets-eql-members
description: "The metorex example program sets/eql_members.rb and its output."
---

`tests/_examples/sets/eql_members.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/sets/eql_members.rb).

```metorex
require "set"

class TariffCode
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def hash
    code.hash
  end

  def eql?(other)
    other.is_a?(TariffCode) && code == other.code
  end
end

codes = Set.new([TariffCode.new("8471"), TariffCode.new("8471"), TariffCode.new("9403")])
p(codes.size)
p(codes.include?(TariffCode.new("9403")))
codes << TariffCode.new("9403")
p(codes.size)
p(codes.add?(TariffCode.new("8471")))
codes.delete(TariffCode.new("8471"))
p(codes.map(&:code))
p([TariffCode.new("1"), TariffCode.new("1")].to_set.size)
other = Set[TariffCode.new("9403"), TariffCode.new("0101")]
p((codes & other).map(&:code))
p((codes | other).map(&:code).sort)
p(codes.subset?(other))
```

Output:

```
2
true
2
nil
["9403"]
1
["9403"]
["0101", "9403"]
true
```
