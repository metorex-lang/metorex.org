---
title: "coverage/conditional_lines.rb"
slug: coverage-conditional-lines
description: "The metorex example program coverage/conditional_lines.rb and its output."
---

`tests/_examples/coverage/conditional_lines.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/coverage/conditional_lines.rb).

```metorex
require "coverage"
Coverage.start(lines: true)
require_relative "conditional_lines_subject"
p Coverage.result.find { |path, _| path.end_with?("conditional_lines_subject.rb") }.last[:lines]
```

Output:

```
[1, 2, 1, 1, 1, nil, 0, nil, nil, nil, 1, 1, nil, nil, 1, 1, nil, 0, nil, 1, nil, 0, nil, nil, nil, 1, 1, 1, nil, nil, nil, 1, 1, 1, 2, 2, nil, 1, nil, nil, 1, 1, 1, nil, nil, 1, 1, 1, 1, 1, 1, 1]
```
