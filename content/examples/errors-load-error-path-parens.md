---
title: "errors/load_error/path_parens.rb"
slug: errors-load-error-path-parens
description: "The metorex example program errors/load_error/path_parens.rb and its output."
---

`tests/_examples/errors/load_error/path_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/load_error/path_parens.rb){target=_blank rel=noopener}.

```metorex
p LoadError.new.path
p LoadError.new("cannot load such file -- widgets").path

begin
  require "file_that_does_not_exist"
rescue LoadError => error
  p error.path
  puts(error.message)
end

begin
  require_relative "also_missing"
rescue LoadError => error
  puts(error.class)
  puts(error.path.end_with?("also_missing"))
end

p RuntimeError.new("boom").respond_to?(:path)
```

Output:

```
nil
nil
"file_that_does_not_exist"
cannot load such file -- file_that_does_not_exist
LoadError
true
false
```
