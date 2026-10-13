---
title: "callables/method_proc_blocks_no_parens.rb"
slug: callables-method-proc-blocks-no-parens
description: "The metorex example program callables/method_proc_blocks_no_parens.rb and its output."
---

`tests/_examples/callables/method_proc_blocks_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/callables/method_proc_blocks_no_parens.rb){target=_blank rel=noopener}.

```metorex
def entries_from &block
  seen = []
  block.call { |key, value| seen << [key, value] }
  seen
end

class RateTable < Hash
  def entries_seen = entries_from(&method(:each))
end

table = RateTable.new
table["shipping"] = 4
p table.entries_seen
p entries_from(&{ "tariff" => 9 }.method(:each))

def forward amount, &block
  block.call amount
end
p method(:forward).to_proc.call(3) { |amount| amount * 10 }

def pair_of key, value
  [key, value]
end
begin
  { "tariff" => 9 }.each(&method(:pair_of))
rescue ArgumentError => error
  p error.message
end
takes_block = ->(amount, &block) { block.call amount }
begin
  takes_block.call
rescue ArgumentError => error
  p error.message
end
```

Output:

```
[["shipping", 4]]
[["tariff", 9]]
30
"wrong number of arguments (given 1, expected 2)"
"wrong number of arguments (given 0, expected 1)"
```
