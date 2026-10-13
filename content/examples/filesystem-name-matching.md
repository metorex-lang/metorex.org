---
title: "filesystem/name_matching.rb"
slug: filesystem-name-matching
description: "The metorex example program filesystem/name_matching.rb and its output."
---

`tests/_examples/filesystem/name_matching.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/filesystem/name_matching.rb).

```metorex
# `Dir.glob` reads a pattern against a directory tree: `*` and `?` within one
# name, `[...]` for a set, `{a,b}` for a list of patterns, and `**` for a walk
# down through the subdirectories.
require "tmpdir"

root = File.join Dir.tmpdir, "metorex_name_matching"
Dir.mkdir root unless Dir.exist? root
%w[a a/b a/b/c].each do |part|
  held = File.join root, part
  Dir.mkdir held unless Dir.exist? held
end
%w[a/one.rb a/two.txt a/.hidden a/b/three.rb a/b/c/four.rb].each do |part|
  File.write File.join(root, part), ""
end

Dir.chdir root do
  p Dir.glob("a/*").sort
  p Dir.glob("a/*.rb")
  p Dir.glob("a/{one,two}.*").sort
  p Dir.glob("a/?ne.rb")
  p Dir.glob("a/[ot]ne.rb")
  p Dir.glob("**/*.rb").sort
  p Dir.glob("a/.*").sort
  p Dir.glob("*", File::FNM_DOTMATCH).sort
  p Dir.glob("**/", base: "a").sort
  p Dir.glob("*", base: "a/b").sort
  p Dir["a/*.rb"]
  p Dir.glob("a/nothing*")
  p Dir.glob("")
  collected = []
  p Dir.glob("a/*.rb") { |held| collected << held }
  p collected
end

%w[a/b/c/four.rb a/b/three.rb a/one.rb a/two.txt a/.hidden].each do |part|
  File.delete File.join(root, part)
end
%w[a/b/c a/b a].each { |part| Dir.rmdir File.join(root, part) }
Dir.rmdir root
```

Output:

```
["a/b", "a/one.rb", "a/two.txt"]
["a/one.rb"]
["a/one.rb", "a/two.txt"]
["a/one.rb"]
["a/one.rb"]
["a/b/c/four.rb", "a/b/three.rb", "a/one.rb"]
["a/.", "a/.hidden"]
[".", "a"]
["/", "b/", "b/c/"]
["c", "three.rb"]
["a/one.rb"]
[]
[]
nil
["a/one.rb"]
```
