---
title: "programs/data_pipeline/data_pipeline_no_parens.rb"
slug: programs-data-pipeline-data-pipeline-no-parens
description: "The metorex example program programs/data_pipeline/data_pipeline_no_parens.rb and its output."
---

`tests/_examples/programs/data_pipeline/data_pipeline_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/programs/data_pipeline/data_pipeline_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Data Processing Pipeline without parentheses (where possible)

students = [
  {"name" => "Alice", "grade" => 92, "subject" => "Math"},
  {"name" => "Bob", "grade" => 78, "subject" => "Science"},
  {"name" => "Charlie", "grade" => 95, "subject" => "Math"},
  {"name" => "Diana", "grade" => 88, "subject" => "Science"},
  {"name" => "Eve", "grade" => 67, "subject" => "Math"},
  {"name" => "Frank", "grade" => 91, "subject" => "Science"}
]

passing = students.filter do |s|
  s["grade"] >= 70
end

puts "Passing students:"
passing.each do |s|
  puts "  #{s["name"]}: #{s["grade"]}"
end

honor_roll = students.filter do |s|
  s["grade"] >= 90
end

puts "Honor roll:"
honor_roll.each do |s|
  puts "  #{s["name"]}: #{s["grade"]}"
end

total = 0
students.each do |s|
  total += s["grade"]
end
average = total.to_f / students.length
puts "Average grade: #{average}"

math_count = 0
science_count = 0
students.each do |s|
  if s["subject"] == "Math"
    math_count += 1
  else
    science_count += 1
  end
end
puts "Math students: #{math_count}"
puts "Science students: #{science_count}"

names = students.map do |s|
  s["name"]
end
puts "All students: #{names}"
```

Output:

```
Passing students:
  Alice: 92
  Bob: 78
  Charlie: 95
  Diana: 88
  Frank: 91
Honor roll:
  Alice: 92
  Charlie: 95
  Frank: 91
Average grade: 85.16666666666667
Math students: 3
Science students: 3
All students: ["Alice", "Bob", "Charlie", "Diana", "Eve", "Frank"]
```
