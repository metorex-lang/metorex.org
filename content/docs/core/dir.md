---
title: "Dir"
slug: dir
description: "The methods ruby/spec describes in core/dir, and which Metorex implements."
---

ruby/spec describes 39 methods in `core/dir`, and Metorex implements 36 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Dir.[]`**: implemented, parameters `[[:req, :args]]`. Calls Dir.glob with argument `patterns` and the values of keyword arguments `base` and `sort`; returns the array of selected entry names.
- **`Dir#chdir`**: implemented, parameters `[[:block, :block]]`. Changes the current working directory to `self`: [An example calling it](/examples/c-extensions-build-helper).
- **`Dir.chdir`**: implemented, parameters `[[:req, :args]]`. Changes the current working directory. [An example calling it](/examples/c-extensions-build-helper).
- **`Dir#children`**: implemented, parameters `[]`. Returns an array of the entry names in `self` except for <code>'.'</code> and <code>'..'</code>: [An example calling it](/examples/encodings-c-locale).
- **`Dir.children`**: implemented, parameters `[[:req, :args]]`. Returns an array of the entry names in the directory at `dirpath` except for <code>'.'</code> and <code>'..'</code>; sets the given encoding onto each returned entry name: [An example calling it](/examples/encodings-c-locale).
- **`Dir.chroot`**: implemented, parameters `[[:req, :args]]`. Changes the root directory of the calling process to that specified in `dirpath`.
- **`Dir#close`**: implemented, parameters `[]`. Closes the stream in `self`, if it is open, and returns `nil`; ignored if `self` is already closed: [An example calling it](/examples/addresses-socket-open-timeout).
- **`Dir.delete`**: implemented, parameters `[[:req, :args]]`. Removes the directory at `dirpath` from the underlying file system: [An example calling it](/examples/stdlib-dir-reading-a-directory).
- **`Dir#each`**: implemented, parameters `[[:block, :block]]`. Calls the block with each entry name in `self`: [An example calling it](/examples/addresses-streams-over-a-path).
- **`Dir#each_child`**: implemented, parameters `[[:block, :block]]`. Calls the block with each entry name in `self` except <code>'.'</code> and <code>'..'</code>: [An example calling it](/examples/c-extensions-c-sequence-outlines).
- **`Dir.each_child`**: implemented, parameters `[[:req, :args]]`. Like Dir.foreach, except that entries <code>'.'</code> and <code>'..'</code> are not included. [An example calling it](/examples/filesystem-null-byte-paths).
- **`Dir.empty?`**: implemented, parameters `[[:req, :args]]`. Returns whether `dirpath` specifies an empty directory: [An example calling it](/examples/filesystem-null-byte-paths).
- **`Dir.entries`**: implemented, parameters `[[:rest]]`. Returns an array of the entry names in the directory at `dirpath`; sets the given encoding onto each returned entry name: [An example calling it](/examples/filesystem-binary-paths).
- **`Dir.exist?`**: implemented, parameters `[[:req, :args]]`. Returns whether `dirpath` is a directory in the underlying file system: [An example calling it](/examples/filesystem-name-matching).
- **`Dir.exists?`**: not implemented.
- **`Dir.fchdir`**: implemented, parameters `[[:req, :number]]`. Changes the current working directory to the directory specified by the integer file descriptor `fd`.
- **`Dir#fileno`**: implemented, parameters `[]`. Returns the file descriptor used in *dir*. [An example calling it](/examples/addresses-ancillary-data).
- **`Dir.for_fd`**: implemented, parameters `[[:req, :number]]`. Returns a new Dir object representing the directory specified by the given integer directory file descriptor `fd`: [An example calling it](/examples/filesystem-directory-for-descriptor).
- **`Dir.foreach`**: implemented, parameters `[[:req, :args]]`. Calls the block with each entry name in the directory at `dirpath`; sets the given encoding onto each passed `entry_name`: [An example calling it](/examples/filesystem-null-byte-paths).
- **`Dir.getwd`**: implemented, parameters `[[:req, :args]]`. Returns the path to the current working directory:
- **`Dir.glob`**: implemented, parameters `[[:req, :args]]`. Forms an array *entry_names* of the entry names selected by the arguments. [An example calling it](/examples/filesystem-name-matching).
- **`Dir.home`**: implemented, parameters `[[:req, :args]]`. Returns the home directory path of the user specified with `user_name` if it is not `nil`, or the current login user: [An example calling it](/examples/require-installed-gems-extensions).
- **`Dir#initialize`**: implemented, parameters `[[:req, :path], [:keyrest, :options]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`Dir#inspect`**: implemented, parameters `[]`. Returns a string description of `self`: [An example calling it](/examples/addresses-internet-addresses).
- **`Dir.mkdir`**: implemented, parameters `[[:req, :args]]`. Creates a directory in the underlying file system at `dirpath` with the given `permissions`; returns zero: [An example calling it](/examples/filesystem-binary-paths).
- **`Dir.open`**: implemented, parameters `[[:req, :path], [:keyrest, :options], [:block, :block]]`. Creates a new Dir object *dir* for the directory at `dirpath`. [An example calling it](/examples/filesystem-walking-a-directory).
- **`Dir#path`**: implemented, parameters `[]`. Returns the `dirpath` string that was used to create `self` (or `nil` if created by method Dir.for_fd): [An example calling it](/examples/addresses-uniform-resources).
- **`Dir#pos`**: implemented, parameters `[]`. Returns the current position of `self`; see Dir As Stream-Like: [An example calling it](/examples/builtins-argf-stream).
- **`Dir#pos=`**: implemented, parameters `[[:req, :position]]`. Sets the position in `self` and returns `position`.
- **`Dir.pwd`**: implemented, parameters `[[:req, :args]]`. Returns the path to the current working directory: [An example calling it](/examples/cli-flags-show-directory).
- **`Dir#read`**: implemented, parameters `[]`. Reads and returns the next entry name from `self`; returns `nil` if at end-of-stream; see Dir As Stream-Like: [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`Dir#rewind`**: implemented, parameters `[]`. Sets the position in `self` to zero; see Dir As Stream-Like: [An example calling it](/examples/builtins-argf-stream).
- **`Dir.rmdir`**: implemented, parameters `[[:req, :args]]`. Removes the directory at `dirpath` from the underlying file system: [An example calling it](/examples/filesystem-binary-paths).
- **`Dir#scan`**: not implemented. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-lockfile-parser).
- **`Dir.scan`**: not implemented.
- **`Dir#seek`**: implemented, parameters `[[:req, :position]]`. Sets the position in `self` and returns `self`. [An example calling it](/examples/builtins-byte-views-reading).
- **`Dir#tell`**: implemented, parameters `[]`. Returns the current position of `self`; see Dir As Stream-Like: [An example calling it](/examples/stdlib-libraries-shipped-libraries).
- **`Dir#to_path`**: implemented, parameters `[]`. Returns the `dirpath` string that was used to create `self` (or `nil` if created by method Dir.for_fd): [An example calling it](/examples/filesystem-walking-a-directory).
- **`Dir.unlink`**: implemented, parameters `[[:req, :args]]`. Removes the directory at `dirpath` from the underlying file system: [An example calling it](/examples/stdlib-dir-reading-a-directory).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
