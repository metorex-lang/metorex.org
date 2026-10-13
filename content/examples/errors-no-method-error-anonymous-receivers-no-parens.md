---
title: "errors/no_method_error/anonymous_receivers_no_parens.rb"
slug: errors-no-method-error-anonymous-receivers-no-parens
description: "The metorex example program errors/no_method_error/anonymous_receivers_no_parens.rb and its output."
---

`tests/_examples/errors/no_method_error/anonymous_receivers_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/no_method_error/anonymous_receivers_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A NoMethodError for an instance of a class with no name names the class
# the way the class inspects, whether the method is missing or private.
klass = Class.new do
  private

  def hidden; end
end

[:hidden, :missing].each do |name|
  begin
    klass.new.public_send name
  rescue NoMethodError => error
    puts error.message.sub(/0x\h+/, "0xADDRESS")
  end
end
```

Output:

```
private method 'hidden' called for an instance of #<Class:0xADDRESS>
undefined method 'missing' for an instance of #<Class:0xADDRESS>
```
