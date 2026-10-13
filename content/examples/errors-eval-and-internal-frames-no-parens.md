---
title: "errors/eval_and_internal_frames_no_parens.rb"
slug: errors-eval-and-internal-frames-no-parens
description: "The metorex example program errors/eval_and_internal_frames_no_parens.rb and its output."
---

`tests/_examples/errors/eval_and_internal_frames_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/eval_and_internal_frames_no_parens.rb){target=_blank rel=noopener}.

```metorex
def run_snippet code
  eval code, binding, "(snippet)", 7
end

begin
  run_snippet("unknown_name")
rescue NameError => error
  p(error.backtrace.first.sub(/\A.*?:/, "FILE:"))
end

begin
  1.tap { raise "inside tap" }
rescue => error
  p(error.backtrace.map { |line| line.sub(/\A[^:]*:/, "FILE:") })
end

class Vault
  private def secret = 1
  protected def guarded = 2
end
p (Vault.new.public_method(:secret) rescue $!)
p (Vault.new.public_method(:guarded) rescue $!)
p (Object.new.public_method(:exit) rescue $!)
```

Output:

```
"FILE:7:in 'Object#run_snippet'"
["FILE:12:in 'block in <main>'", "FILE:12:in 'Kernel#tap'", "FILE:12:in '<main>'"]
#<NameError: method 'secret' for class 'Vault' is private>
#<NameError: method 'guarded' for class 'Vault' is protected>
#<NameError: method 'exit' for class 'Object' is private>
```
