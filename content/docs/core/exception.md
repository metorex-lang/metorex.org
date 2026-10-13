---
title: "Exception"
slug: exception
description: "The methods ruby/spec describes in core/exception, and which Metorex implements."
---

ruby/spec describes 45 methods in `core/exception`, and Metorex implements 45 of them. The parameters are what `Method#parameters` answers under Metorex.

## Errno::EINVAL

- **`Errno::EINVAL.new`**: implemented, parameters `[[:rest]]`. [An example calling it](/examples/errors-errno-classes).

## Exception

- **`Exception#==`**: implemented, parameters `[[:req]]`. Returns whether `object` is the same class as `self` and its #message and #backtrace are equal to those of `self`.
- **`Exception#backtrace`**: implemented, parameters `[]`. Returns the backtrace (the list of code locations that led to the exception), as an array of strings. [An example calling it](/examples/backtraces-at-exit-handler-raise).
- **`Exception#backtrace_locations`**: implemented, parameters `[]`. Returns the backtrace (the list of code locations that led to the exception), as an array of Thread::Backtrace::Location instances. [An example calling it](/examples/backtraces-chained-call-line).
- **`Exception#cause`**: implemented, parameters `[]`. Returns the previous value of global variable <code>$!</code>, which may be `nil` (see Global Variables): [An example calling it](/examples/c-extensions-c-exceptions).
- **`Exception#detailed_message`**: implemented, parameters `[[:rest]]`. Returns the message string with enhancements: [An example calling it](/examples/errors-did-you-mean-suggestions).
- **`Exception#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`Exception#exception`**: implemented, parameters `[[:rest]]`. Returns an exception object of the same class as `self`; useful for creating a similar exception, but with a different message. [An example calling it](/examples/errors-exception-method-copies).
- **`Exception.exception`**: implemented, parameters `[[:req, :args]]`. Returns an exception object of the same class as `self`; useful for creating a similar exception, but with a different message. [An example calling it](/examples/errors-exception-method-copies).
- **`Exception#full_message`**: implemented, parameters `[[:rest]]`. Returns an enhanced message string: [An example calling it](/examples/errors-exception-reports).
- **`Exception#inspect`**: implemented, parameters `[]`. Returns a string representation of `self`: [An example calling it](/examples/addresses-internet-addresses).
- **`Exception#message`**: implemented, parameters `[]`. Returns #to_s. [An example calling it](/examples/addresses-ancillary-data).
- **`Exception.new`**: implemented, parameters `[[:rest]]`. Returns a new exception object. [An example calling it](/examples/errors-exception-message-to-s).
- **`Exception#set_backtrace`**: implemented, parameters `[[:req]]`. Sets the backtrace value for `self`; returns the given `value`. [An example calling it](/examples/errors-backtrace-access).
- **`Exception#to_s`**: implemented, parameters `[]`. Returns a string representation of `self`: [An example calling it](/examples/addresses-internet-addresses).

## FrozenError

- **`FrozenError#message`**: implemented, parameters `[]`. Returns #to_s. [An example calling it](/examples/addresses-ancillary-data).
- **`FrozenError.new`**: implemented, parameters `[[:rest]]`. Construct a new FrozenError exception. [An example calling it](/examples/errors-frozen-modification).
- **`FrozenError#receiver`**: implemented, parameters `[]`. Return the receiver associated with this FrozenError exception. [An example calling it](/examples/c-extensions-c-debug).

## Interrupt

- **`Interrupt.new`**: implemented, parameters `[[:rest]]`. Construct a new SignalException object. [An example calling it](/examples/signals-delivery).

## LoadError

- **`LoadError#path`**: implemented, parameters `[]`. the path that failed to load [An example calling it](/examples/addresses-uniform-resources).

## LocalJumpError

- **`LocalJumpError#exit_value`**: implemented, parameters `[]`. Returns the exit value associated with this `LocalJumpError`.
- **`LocalJumpError#reason`**: implemented, parameters `[]`. The reason this block was terminated: :break, :redo, :retry, :next, :return, or :noreason.

## NameError

- **`NameError#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`NameError#name`**: implemented, parameters `[]`. Return the name associated with this NameError exception. [An example calling it](/examples/basics-logical-keyword-precedence).
- **`NameError.new`**: implemented, parameters `[[:rest]]`. Construct a new NameError exception. [An example calling it](/examples/errors-name-error-construction).
- **`NameError#receiver`**: implemented, parameters `[]`. Return the receiver associated with this NameError exception. [An example calling it](/examples/c-extensions-c-debug).
- **`NameError#to_s`**: implemented, parameters `[]`. Returns a string representation of `self`: [An example calling it](/examples/addresses-internet-addresses).

## NoMethodError

- **`NoMethodError#args`**: implemented, parameters `[]`. Return the arguments passed in as the third parameter to the constructor. [An example calling it](/examples/errors-no-method-error-args).
- **`NoMethodError#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`NoMethodError#message`**: implemented, parameters `[]`. Returns #to_s. [An example calling it](/examples/addresses-ancillary-data).
- **`NoMethodError.new`**: implemented, parameters `[[:rest]]`. Construct a NoMethodError exception for a method of the given name called with the given arguments. [An example calling it](/examples/errors-name-error-details).

## SignalException

- **`SignalException.new`**: implemented, parameters `[[:rest]]`. Construct a new SignalException object. [An example calling it](/examples/signals-delivery).
- **`SignalException#signm`**: implemented, parameters `[]`. [An example calling it](/examples/signals-delivery).
- **`SignalException#signo`**: implemented, parameters `[]`. Returns a signal number. [An example calling it](/examples/signals-delivery).

## StopIteration

- **`StopIteration#result`**: implemented, parameters `[]`. Returns the return value of the iterator. [An example calling it](/examples/builtins-core-class-additions).

## SyntaxError

- **`SyntaxError#path`**: implemented, parameters `[]`. the path that failed to parse [An example calling it](/examples/addresses-uniform-resources).

## SystemCallError

- **`SystemCallError.===`**: implemented, parameters `[[:req]]`. Return `true` if the receiver is a generic `SystemCallError`, or if the error numbers `self` and *other* are the same.
- **`SystemCallError#backtrace`**: implemented, parameters `[]`. Returns the backtrace (the list of code locations that led to the exception), as an array of strings. [An example calling it](/examples/backtraces-at-exit-handler-raise).
- **`SystemCallError#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`SystemCallError#errno`**: implemented, parameters `[]`. Return this SystemCallError's error number. [An example calling it](/examples/errors-errno-classes).
- **`SystemCallError#message`**: implemented, parameters `[]`. Returns #to_s. [An example calling it](/examples/addresses-ancillary-data).
- **`SystemCallError.new`**: implemented, parameters `[[:rest]]`. If *errno* corresponds to a known system error code, constructs the appropriate Errno class for that error, otherwise constructs a generic SystemCallError object. [An example calling it](/examples/errors-errno-classes).

## SystemExit

- **`SystemExit#status`**: implemented, parameters `[]`. Return the status value associated with this system exit. [An example calling it](/examples/advanced-mutexes-that-deadlock).
- **`SystemExit#success?`**: implemented, parameters `[]`. Returns `true` if exiting successful, `false` if not. [An example calling it](/examples/advanced-native-thread-ids).

## UncaughtThrowError

- **`UncaughtThrowError#tag`**: implemented, parameters `[]`. Return the tag object which was called for. [An example calling it](/examples/dsl-html-builder).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
