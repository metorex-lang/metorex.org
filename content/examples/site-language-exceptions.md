---
title: "site/language_exceptions.rb"
slug: site-language-exceptions
description: "The metorex example program site/language_exceptions.rb and its output."
---

`tests/_examples/site/language_exceptions.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/language_exceptions.rb).

```metorex
class PaymentError < StandardError
  def initialize(amount)
    super("payment of #{amount} declined")
  end
end

def charge(amount)
  raise PaymentError.new(amount) if amount > 100
  "charged #{amount}"
end

attempts = 0
begin
  attempts += 1
  puts charge(150 - attempts * 30)
rescue PaymentError => error
  puts "#{error.message} (attempt #{attempts})"
  retry if attempts < 3
ensure
  puts "done after #{attempts} attempts"
end

def parse_port(text)
  Integer(text)
rescue ArgumentError
  nil
end

p parse_port("8080")
p parse_port("eighty")
```

Output:

```
payment of 120 declined (attempt 1)
charged 90
done after 2 attempts
8080
nil
```
