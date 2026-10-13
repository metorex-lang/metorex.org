---
title: "FileTest"
slug: filetest
description: "The methods ruby/spec describes in core/filetest, and which Metorex implements."
---

ruby/spec describes 28 methods in `core/filetest`, and Metorex implements 27 of them. The parameters are what `Method#parameters` answers under Metorex.

## File

- **`File.file?`**: implemented, parameters `[[:req, :args]]`. Returns `true` if the named `file` exists and is a regular file. [An example calling it](/examples/filesystem-asking-about-a-file).

## FileTest

- **`FileTest.blockdev?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if `filepath` points to a block device, `false` otherwise: [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.chardev?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if `filepath` points to a character device, `false` otherwise. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.directory?`**: implemented, parameters `[[:req, :path]]`. With string `object` given, returns `true` if `path` is a string path leading to a directory, or to a symbolic link to a directory; `false` otherwise: [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.empty?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file exists and has a zero size. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.executable?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file is executable by the effective user and group id of this process. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.executable_real?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file is executable by the real user and group id of this process. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.exist?`**: implemented, parameters `[[:req, :path]]`. Return `true` if the named file exists. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.exists?`**: not implemented.
- **`FileTest.file?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named `file` exists and is a regular file. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.grpowned?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file exists and the effective group id of the calling process is the owner of the file. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.identical?`**: implemented, parameters `[[:req, :path], [:req, :other]]`. Returns `true` if the named files are identical. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.owned?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file exists and the effective user id of the calling process is the owner of the file. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.pipe?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if `filepath` points to a pipe, `false` otherwise: [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.readable?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file is readable by the effective user and group id of this process. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.readable_real?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file is readable by the real user and group id of this process. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.setgid?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file has the setgid bit set. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.setuid?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file has the setuid bit set. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.size`**: implemented, parameters `[[:req, :path]]`. Returns the size of `file_name`. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.size?`**: implemented, parameters `[[:req, :path]]`. Returns `nil` if `file_name` doesn't exist or has zero size, the size of the file otherwise. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.socket?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if `filepath` points to a socket, `false` otherwise: [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.sticky?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file has the sticky bit set. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.symlink?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if `filepath` points to a symbolic link, `false` otherwise: [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.world_readable?`**: implemented, parameters `[[:req, :path]]`. If *file_name* is readable by others, returns an integer representing the file permission bits of *file_name*. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.world_writable?`**: implemented, parameters `[[:req, :path]]`. If *file_name* is writable by others, returns an integer representing the file permission bits of *file_name*. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.writable?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file is writable by the effective user and group id of this process. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.writable_real?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file is writable by the real user and group id of this process. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`FileTest.zero?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file exists and has a zero size. [An example calling it](/examples/filesystem-asking-about-a-file).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
