---
title: "programs/data_pipeline/data_pipeline.rb"
slug: programs-data-pipeline-data-pipeline
description: "The metorex example program programs/data_pipeline/data_pipeline.rb and its output."
---

`tests/_examples/programs/data_pipeline/data_pipeline.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/programs/data_pipeline/data_pipeline.rb){target=_blank rel=noopener}.

```metorex
# Data Processing Pipeline: Process a list of student records
# Demonstrates: arrays, hashes, iteration, filtering, mapping

# Student data as hashes
students = [
  {"name" => "Alice", "grade" => 92, "subject" => "Math"},
  {"name" => "Bob", "grade" => 78, "subject" => "Science"},
  {"name" => "Charlie", "grade" => 95, "subject" => "Math"},
  {"name" => "Diana", "grade" => 88, "subject" => "Science"},
  {"name" => "Eve", "grade" => 67, "subject" => "Math"},
  {"name" => "Frank", "grade" => 91, "subject" => "Science"}
]

# Step 1: Filter passing students (grade >= 70)
passing = students.filter do |s|
  s["grade"] >= 70
end

puts "Passing students:"
passing.each do |s|
  puts "  #{s["name"]}: #{s["grade"]}"
end

# Step 2: Get names of honor roll students (grade >= 90)
honor_roll = students.filter do |s|
  s["grade"] >= 90
end

puts "Honor roll:"
honor_roll.each do |s|
  puts "  #{s["name"]}: #{s["grade"]}"
end

# Step 3: Calculate average grade
total = 0
students.each do |s|
  total += s["grade"]
end
average = total.to_f / students.length
puts "Average grade: #{average}"

# Step 4: Count students per subject
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

# Step 5: Extract just the names
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
