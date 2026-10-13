---
title: "stdlib_libraries/configure_checks.rb"
slug: stdlib-libraries-configure-checks
description: "The metorex example program stdlib_libraries/configure_checks.rb and its output."
---

`tests/_examples/stdlib_libraries/configure_checks.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/configure_checks.rb){target=_blank rel=noopener}.

```metorex
# mkmf's checks compile a small program to learn whether a header, library,
# function, variable, type, macro or constant is there, print what they
# checked for, and record what they found for the Makefile to carry.
# `ruby -run -e mkmf` runs them from the command line.
require("mkmf")
require("tmpdir")
require("rbconfig")

Dir.mktmpdir do |root|
  Dir.chdir(root) do
    p(have_header("stdio.h"))
    p(have_header("no_such_header.h"))
    p(have_library("m", "sqrt"))
    p(have_library("no_such_library_xyz", "nothing"))
    p(have_func("printf", "stdio.h"))
    p(have_func("no_such_function_xyz"))
    p(have_func("strlen", ["stdio.h", "string.h"]))
    p(have_var("errno", "errno.h"))
    p(have_var("no_such_variable_xyz", "stdio.h"))
    p(have_type("size_t", "stddef.h"))
    p(have_type("struct no_such_type", "stdio.h"))
    p(have_macro("EOF", "stdio.h"))
    p(have_macro("NO_SUCH_MACRO_XYZ", "stdio.h"))
    p(have_const("EOF", "stdio.h"))
    p(have_const("NO_SUCH_CONST_XYZ", "stdio.h"))
    p(dir_config("probe_lib"))
    p(dir_config("other", "/def/inc", "/def/lib"))
    p($defs)
    p($libs)
    p($CPPFLAGS.split.grep(/\A-I/), $LIBPATH)
    p("my-lib.h".tr_cpp, "foo".funcall_style, "foo(1)".sans_arguments)
    File.write("probe.c", "#include \"ruby.h\"\nvoid Init_probe(void) {}\n")
    create_makefile("probe")
    p(File.read("Makefile").scan(/-DHAVE_\w+|-lm\b/).uniq.sort)

    File.delete("Makefile")
    read, write = IO.pipe
    child = spawn(RbConfig.ruby, "-run", "-e", "mkmf", "--", "-h", "stdio.h:no_such.h", "-l", "m,sqrt",
                  "-f", "printf,stdio.h", "-t", "size_t,stddef.h", "-c", "EOF,stdio.h", "probe",
                  out: write, err: write)
    write.close
    puts(read.read)
    Process.wait(child)
    p(File.read("Makefile").scan(/-DHAVE_\w+|-lm\b/).uniq.sort)
  end
end
```

Output:

```
checking for stdio.h... yes
true
checking for no_such_header.h... no
false
checking for sqrt() in -lm... yes
true
checking for nothing() in -lno_such_library_xyz... no
false
checking for printf() in stdio.h... yes
true
checking for no_such_function_xyz()... no
false
checking for strlen() in stdio.h,string.h... yes
true
checking for errno in errno.h... yes
true
checking for no_such_variable_xyz in stdio.h... no
false
checking for size_t in stddef.h... yes
true
checking for struct no_such_type in stdio.h... no
false
checking for EOF in stdio.h... yes
true
checking for NO_SUCH_MACRO_XYZ in stdio.h... no
false
checking for EOF in stdio.h... yes
true
checking for NO_SUCH_CONST_XYZ in stdio.h... no
false
[nil, nil]
["/def/inc", "/def/lib"]
["-DHAVE_STDIO_H", "-DHAVE_PRINTF", "-DHAVE_STRLEN", "-DHAVE_ERRNO", "-DHAVE_TYPE_SIZE_T", "-DHAVE_CONST_EOF"]
"-lm "
["-I/def/inc"]
["/def/lib"]
"MY_LIB_H"
"foo()"
"foo"
creating Makefile
["-DHAVE_CONST_EOF", "-DHAVE_ERRNO", "-DHAVE_PRINTF", "-DHAVE_STDIO_H", "-DHAVE_STRLEN", "-DHAVE_TYPE_SIZE_T", "-lm"]
checking for stdio.h... yes
checking for no_such.h... no
checking for sqrt() in -lm... yes
checking for printf() in stdio.h... yes
checking for size_t in stddef.h... yes
checking for EOF in stdio.h... yes
creating Makefile
["-DHAVE_CONST_EOF", "-DHAVE_PRINTF", "-DHAVE_STDIO_H", "-DHAVE_TYPE_SIZE_T", "-lm"]
```
