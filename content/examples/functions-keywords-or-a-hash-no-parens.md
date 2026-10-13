---
title: "functions/keywords_or_a_hash_no_parens.rb"
slug: functions-keywords-or-a-hash-no-parens
description: "The metorex example program functions/keywords_or_a_hash_no_parens.rb and its output."
---

`tests/_examples/functions/keywords_or_a_hash_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/functions/keywords_or_a_hash_no_parens.rb).

```metorex
gather = proc { |*args, **kwargs| [args, kwargs] }
p gather.call({})
p gather.call **{}
p gather.call({limit: 3})
p gather.call limit: 3

def pass_along *args, **kwargs
  yield(*args, **kwargs)
end

empty = {}
p(pass_along(**empty) { |*seen| seen })
p(pass_along(empty) { |*seen| seen })

def fetch_rows *tables, limit:
  [tables, limit]
end

p fetch_rows :users, limit: 5
[
  -> { fetch_rows(limit: 1, offset: 2) },
  -> { fetch_rows(limit: 1, true => false) },
  -> { fetch_rows(limit: 1, offset: 2, order: 3) },
].each do |attempt|
  begin
    attempt.call
  rescue ArgumentError => error
    puts error.message
  end
end

flagged = Hash.ruby2_keywords_hash limit: 1
def echo value
  value
end
p echo(flagged).equal? flagged
p Hash.ruby2_keywords_hash? flagged

def twice(value) = yield(yield(value))
p(twice(2) { |held| held * 3 })
p fetch_rows *[:users, :posts], limit: 2
```

Output:

```
[[{}], {}]
[[], {}]
[[{limit: 3}], {}]
[[], {limit: 3}]
[]
[{}]
[[:users], 5]
unknown keyword: :offset
unknown keyword: true
unknown keywords: :offset, :order
true
true
18
[[:users, :posts], 2]
```
