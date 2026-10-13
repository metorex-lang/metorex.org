---
title: "site/language_classes.rb"
slug: site-language-classes
description: "The metorex example program site/language_classes.rb and its output."
---

`tests/_examples/site/language_classes.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/language_classes.rb){target=_blank rel=noopener}.

```metorex
class Account
  attr_reader :owner, :balance

  def initialize(owner, balance = 0)
    @owner = owner
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
    self
  end

  def to_s = "#{owner}: $#{balance}"
end

class SavingsAccount < Account
  def initialize(owner, balance = 0, rate:)
    super(owner, balance)
    @rate = rate
  end

  def add_interest = deposit(balance * @rate)
end

savings = SavingsAccount.new("Ada", 1000, rate: 0.05)
savings.deposit(500).add_interest
puts savings
p savings.is_a?(Account)
p SavingsAccount.ancestors.take(3)
```

Output:

```
Ada: $1575.0
true
[SavingsAccount, Account, Object]
```
