---
title: "oop/singleton_class_rules_no_parens.rb"
slug: oop-singleton-class-rules-no-parens
description: "The metorex example program oop/singleton_class_rules_no_parens.rb and its output."
---

`tests/_examples/oop/singleton_class_rules_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/singleton_class_rules_no_parens.rb){target=_blank rel=noopener}.

```metorex
class Class
  def shared_by_every_class; end
end

class Invoice
  def total; end
  def self.find; end
end

invoice_singleton = Invoice.new.singleton_class
p invoice_singleton.methods.include? :find
p invoice_singleton.methods.include? :total
p invoice_singleton.methods.include? :shared_by_every_class
p Invoice.singleton_class.methods.include? :shared_by_every_class
p Invoice.methods.include? :total

p "draft".dup.singleton_class.superclass

[-> { Object.new.singleton_class.new }, -> { Object.new.singleton_class.allocate }].each do |attempt|
  begin
    attempt.call
  rescue TypeError => error
    puts error.message
  end
end

begin
  Invoice.total
rescue NoMethodError => error
  puts error.message
end
```

Output:

```
true
false
true
true
false
String
can't create instance of singleton class
can't create instance of singleton class
undefined method 'total' for class Invoice
```
