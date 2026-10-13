---
title: "c_extensions/c_files_no_parens.rb"
slug: c-extensions-c-files-no-parens
description: "The metorex example program c_extensions/c_files_no_parens.rb and its output."
---

`tests/_examples/c_extensions/c_files_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_files_no_parens.rb){target=_blank rel=noopener}.

```metorex
# A C extension reading a String's bytes through RSTRING_PTR and RSTRING_LEN,
# converting a path with FilePathValue, and opening files.
require "tmpdir"
require_relative "build_helper"

class PathHolder
  def initialize(path)
    @path = path
  end

  def to_path
    @path
  end
end

class TextHolder
  def initialize(text)
    @text = text
  end

  def to_str
    @text
  end
end

directory = Dir.mktmpdir
require build_extension("c_files.c", "c_files", directory)
files = CFiles.new

p files.bytes("héllo")
p files.bytes("\xFF\x00".b)
p files.bytes ""
text = +"before"
p files.terminated text
text << " and after"
p files.bytes(text).size
p files.same_pointer text
report { files.bytes 42 }

path = "written.txt"
p files.path_value(path).equal? path
p files.path_value PathHolder.new "from_path"
p files.path_value TextHolder.new "from_str"
p files.path_value PathHolder.new TextHolder.new "through_both"
report { files.path_value TextHolder.new 3 }
report { files.path_value PathHolder.new 3 }
report { files.path_value nil }

name = File.join directory, "c_files.txt"
file = files.open_name name, "w"
p file.class
file.write "written from C"
file.close
p File.read name
file = files.open_path PathHolder.new(name), "r"
p file.read
file.close
report { files.open_name name, "" }
report { files.open_path 42, "r" }

FileUtils.rm_rf directory
```

Output:

```
[104, 195, 169, 108, 108, 111]
[255, 0]
[]
true
16
true
TypeError: wrong argument type Integer (expected String)
true
"from_path"
"from_str"
"through_both"
TypeError: can't convert TextHolder to String (TextHolder#to_str gives Integer)
TypeError: no implicit conversion of Integer into String
TypeError: no implicit conversion of nil into String
File
"written from C"
"written from C"
ArgumentError: invalid access mode 
TypeError: no implicit conversion of Integer into String
```
