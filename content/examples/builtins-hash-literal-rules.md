---
title: "builtins/hash_literal_rules.rb"
slug: builtins-hash-literal-rules
description: "The metorex example program builtins/hash_literal_rules.rb and its output."
---

`tests/_examples/builtins/hash_literal_rules.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/hash_literal_rules.rb).

```metorex
key = +"region"
settings = {key => "us-east"}
key.upcase!
p settings.keys.first
p settings.keys.first.frozen?
p key
p settings.each.size

defaults = nil
p({timeout: 5, **defaults})

class Overrides
  def to_hash
    {retries: 2}
  end
end
p({timeout: 5, **Overrides.new})

bare = BasicObject.new
def bare.to_hash
  {verbose: true}
end
p({**bare, timeout: 5})

class BadOverrides
  def to_hash
    :none
  end
end
[-> { {**BadOverrides.new} }, -> { {**42} }].each do |attempt|
  begin
    attempt.call
  rescue TypeError => error
    puts error.message
  end
end

def Warning.warn(message)
  puts message[/key .* is duplicated/]
end
merged = eval("{a: 1, **{a: 2, b: 3}}")
p merged

record = ->(name, **options) { [name, options] }
p record.call(:job, **nil)

limit = 3
count = 2
p(limit!=count)

["{:a ==> 1}", "{:a!=> 1}", "{\"\\xC3\": 1}", "{name!:}"].each do |source|
  begin
    eval(source)
  rescue SyntaxError
    puts "syntax error: #{source}"
  end
end
```

Output:

```
"region"
true
"REGION"
1
{timeout: 5}
{timeout: 5, retries: 2}
{verbose: true, timeout: 5}
can't convert BadOverrides to Hash (BadOverrides#to_hash gives Symbol)
no implicit conversion of Integer into Hash
key :a is duplicated
{a: 2, b: 3}
[:job, {}]
true
syntax error: {:a ==> 1}
syntax error: {:a!=> 1}
syntax error: {"\xC3": 1}
syntax error: {name!:}
```
