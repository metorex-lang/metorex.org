---
title: "introspection/public_method_no_parens.rb"
slug: introspection-public-method-no-parens
description: "The metorex example program introspection/public_method_no_parens.rb and its output."
---

`tests/_examples/introspection/public_method_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/public_method_no_parens.rb){target=_blank rel=noopener}.

```metorex
class Vault
  def open_door
    :opened
  end

  def hidden
    :hidden
  end
  private :hidden

  def guarded
    :guarded
  end
  protected :guarded

  def self.build
    :built
  end
end

vault = Vault.new
opener = vault.public_method :open_door
puts opener.call.inspect
builder = Vault.public_method :build
puts builder.call.inspect

[:hidden, :guarded].each do |name|
  begin
    vault.public_method name
  rescue NameError => error
    puts "#{error.class}: #{error.message}"
  end
end

class Ghost
  def respond_to_missing?(name, include_private = false)
    return true if name == :publicly_handled
    include_private && name == :privately_handled
  end

  def method_missing(name, *args)
    "called #{name}"
  end
end

ghost = Ghost.new
handler = ghost.public_method :publicly_handled
puts handler.call
private_handler = ghost.method :privately_handled
puts private_handler.call

begin
  ghost.public_method :privately_handled
rescue NameError => error
  puts error.class
end
```

Output:

```
:opened
:built
NameError: method 'hidden' for class 'Vault' is private
NameError: method 'guarded' for class 'Vault' is protected
called publicly_handled
called privately_handled
NameError
```
