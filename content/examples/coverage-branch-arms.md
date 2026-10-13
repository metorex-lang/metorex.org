---
title: "coverage/branch_arms.rb"
slug: coverage-branch-arms
description: "The metorex example program coverage/branch_arms.rb and its output."
---

`tests/_examples/coverage/branch_arms.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/coverage/branch_arms.rb){target=_blank rel=noopener}.

```metorex
require "coverage"
Coverage.start(lines: true)
require_relative "conditional_lines_subject"
subject = Coverage.__coverage_branches__.find { |path, _| path.end_with?("conditional_lines_subject.rb") }
subject.last.each do |kind, line, arms|
  puts "#{kind} at #{line}: " + arms.map { |arm_kind, arm_line, count| "#{arm_kind}@#{arm_line}=#{count}" }.join(" ")
end
```

Output:

```
if at 2: then@3=1 elsif@5=1 else@7=0
if at 12: then@12=1 else@12=0
case at 16: when@18=0 when@20=1 else@22=0
unless at 27: then@28=1 else@27=0
while at 34: body@35=2
&. at 42: then@42=0 else@42=1
```
