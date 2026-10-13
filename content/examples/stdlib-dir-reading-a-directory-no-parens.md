---
title: "stdlib/dir/reading_a_directory_no_parens.rb"
slug: stdlib-dir-reading-a-directory-no-parens
description: "The metorex example program stdlib/dir/reading_a_directory_no_parens.rb and its output."
---

`tests/_examples/stdlib/dir/reading_a_directory_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/dir/reading_a_directory_no_parens.rb).

```metorex
# The questions Dir answers about a directory without opening it.
root = File.join(Dir.tmpdir, "metorex_dir_example_no_parens")
if Dir.exist? root
  Dir.each_child root do |name| File.delete File.join(root, name) end
  Dir.delete root
end
Dir.mkdir root
p Dir.empty?(root)

File.write File.join(root, "held.txt"), "content"
p Dir.empty?(root)
p Dir.empty?(File.join(root, "held.txt"))

p Dir.entries(root).sort
p Dir.children(root)

names = []
Dir.foreach root do |name| names << name end
p names.sort

children = []
Dir.each_child root do |name| children << name end
p children

p Dir.foreach(root).class
p Dir.each_child(root).size

# A directory that still holds something cannot be removed, and one that was
# never there cannot either.
begin
  Dir.rmdir root
rescue Errno::ENOTEMPTY => problem
  p(problem.class)
end
begin
  Dir.unlink File.join(root, "nowhere")
rescue Errno::ENOENT => problem
  p(problem.class)
end

File.delete File.join(root, "held.txt")
p Dir.delete(root)
p Dir.exist?(root)
p Dir.home == ENV["HOME"]
```

Output:

```
true
false
false
[".", "..", "held.txt"]
["held.txt"]
[".", "..", "held.txt"]
["held.txt"]
Enumerator
nil
Errno::ENOTEMPTY
Errno::ENOENT
0
false
true
```
