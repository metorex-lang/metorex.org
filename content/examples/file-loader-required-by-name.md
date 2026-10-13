---
title: "file_loader/required_by_name.rb"
slug: file-loader-required-by-name
description: "The metorex example program file_loader/required_by_name.rb and its output."
---

`tests/_examples/file_loader/required_by_name.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/file_loader/required_by_name.rb){target=_blank rel=noopener}.

```metorex
# What `require` does with the name it is handed: it searches the load path
# for a `.rb` file, answers whether this call loaded it, and reads a name
# already listed as loaded without going looking for it.

$required_by_name = 0
here = __dir__

$LOAD_PATH.unshift(here)

p(require("required_by_name_target"))
p(require("required_by_name_target"))
p($required_by_name)

# A path written from the working directory names that one file and is not
# searched for along the load path.
begin
  require("./not_beside_the_working_directory")
rescue LoadError => refused
  p(refused.path)
end

# What the interpreter carries itself is loaded already.
p(require("set"))

# A file already listed under the name asked for is not looked for at all.
$LOADED_FEATURES << "a_name_with_no_file.rb"
p(require("a_name_with_no_file.rb"))

$LOAD_PATH.shift
```

Output:

```
true
false
1
"./not_beside_the_working_directory"
false
false
```
