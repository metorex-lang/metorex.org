---
title: "oop/undefined_copy_hook.rb"
slug: oop-undefined-copy-hook
description: "The metorex example program oop/undefined_copy_hook.rb and its output."
---

`tests/_examples/oop/undefined_copy_hook.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/undefined_copy_hook.rb){target=_blank rel=noopener}.

```metorex
# A class that undefines initialize_copy cannot finish a copy: dup and
# clone call it on the copy, and it is not there to answer.
class Uncopyable
  undef_method :initialize_copy
end

[:dup, :clone].each do |copying|
  begin
    Uncopyable.new.public_send(copying)
  rescue NoMethodError => error
    puts(error.message)
  end
end
```

Output:

```
undefined method 'initialize_copy' for an instance of Uncopyable
undefined method 'initialize_copy' for an instance of Uncopyable
```
