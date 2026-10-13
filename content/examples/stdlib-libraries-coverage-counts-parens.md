---
title: "stdlib_libraries/coverage_counts_parens.rb"
slug: stdlib-libraries-coverage-counts-parens
description: "The metorex example program stdlib_libraries/coverage_counts_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/coverage_counts_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/coverage_counts_parens.rb){target=_blank rel=noopener}.

```metorex
# Coverage counts how often each line of a file loaded while it is measuring
# runs. A line carrying nothing to run is left out of the count.
require "coverage"

p(Coverage.supported?(:lines))
p(Coverage.running?)

Coverage.start
p(Coverage.running?)

load File.expand_path("coverage_counted_class.rb", __dir__)

p(Coverage.result.values.first)
p(Coverage.running?)

# Naming the modes outright reports each one under its own name. The methods
# mode names every method the file defines, called or not.
Coverage.start(:all)
load File.expand_path("coverage_counted_class.rb", __dir__)
measured = Coverage.result.values.first
p(measured[:lines])
p(measured[:branches])
p(measured[:methods].map { |where, times| [where[1], where[2], where[4], times] }.sort)
```

Output:

```
true
false
true
[1, 1, 1, nil, nil, 1, 0, nil, nil, nil, 1]
false
[1, 1, 1, nil, nil, 1, 0, nil, nil, nil, 1]
{}
[[:unused, 6, 8, 0], [:used, 2, 4, 1]]
```
