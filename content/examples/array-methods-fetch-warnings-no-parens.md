---
title: "array_methods/fetch_warnings_no_parens.rb"
slug: array-methods-fetch-warnings-no-parens
description: "The metorex example program array_methods/fetch_warnings_no_parens.rb and its output."
---

`tests/_examples/array_methods/fetch_warnings_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/array_methods/fetch_warnings_no_parens.rb){target=_blank rel=noopener}.

```metorex
module Warning
  def self.warn message, category: nil
    $stdout.print "warned: #{message.sub(/\A.*?warning: /, "")}"
  end
end
$VERBOSE = true

rates = [4, 9]
p rates.fetch(0) { :missing }
p rates.fetch(5) { |index| "no rate at #{index}" }
p rates.fetch(1, :fallback) { :block }
p rates.fetch(7, :fallback) { :block }
p rates.fetch 7, :fallback
```

Output:

```
4
"no rate at 5"
warned: block supersedes default value argument
9
warned: block supersedes default value argument
:block
:fallback
```
