---
title: "paths/naming_files_no_parens.rb"
slug: paths-naming-files-no-parens
description: "The metorex example program paths/naming_files_no_parens.rb and its output."
---

`tests/_examples/paths/naming_files_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/paths/naming_files_no_parens.rb).

```metorex
# A Pathname is a filesystem path as an object, with the naming operations
# kept apart from the ones that reach the filesystem.
require 'pathname'

here = Pathname.new "/usr/local/bin"

p here.to_s
p here.inspect
p here.absolute?
p here.relative?
p here.root?
p here.parent.to_s
p here.basename.to_s
p here.dirname.to_s
p Pathname.new("/usr/local/lib/ruby.so").extname
p here.hash == "/usr/local/bin".hash
p here == Pathname.new("/usr/local/bin")
p Pathname.new("/").root?

p (Pathname.new("/usr") + "bin/ruby").to_s
p (Pathname.new("/usr") / "bin").to_s
p Pathname.new("/usr").join("local", "bin").to_s
p Pathname.new("/usr").join("/etc").to_s
p Pathname.new(".").join("./foo", "bar").to_s
p Pathname.new("/usr/local").join("../share").to_s
p Pathname.new("/usr/local/bin/").sub(/local/, "fish").to_s
p Pathname.new("/a/b/../c/./d").cleanpath.to_s

p Pathname.new("/usr/bin/ls").relative_path_from(Pathname.new("/usr")).to_s
p Pathname.new("/usr").relative_path_from(Pathname.new("/")).to_s
p Pathname.new("a").relative_path_from(Pathname.new("b")).to_s
p Pathname.new("/usr").relative_path_from(Pathname.new("/usr")).to_s

p Pathname.new("/usr/local/bin").each_filename.to_a
p Pathname.new("/usr/local").descend.map { |one| one.to_s }
p Pathname.new("/usr/local").ascend.map { |one| one.to_s }

# The path a name carries is read without touching the filesystem, and the
# questions that need the filesystem are asked separately.
p Pathname.new("README.md").exist?
p Pathname.new("README.md").file?
p Pathname.new("src").directory?
p Pathname.new("no_such_file_here").exist?
p Pathname(here).equal?(here)
p Pathname("/tmp").class
```

Output:

```
"/usr/local/bin"
"#<Pathname:/usr/local/bin>"
true
false
false
"/usr/local"
"bin"
"/usr/local"
".so"
true
true
true
"/usr/bin/ruby"
"/usr/bin"
"/usr/local/bin"
"/etc"
"foo/bar"
"/usr/share"
"/usr/fish/bin/"
"/a/c/d"
"bin/ls"
"usr"
"../a"
"."
["usr", "local", "bin"]
["/", "/usr", "/usr/local"]
["/usr/local", "/usr", "/"]
true
true
true
false
true
Pathname
```
