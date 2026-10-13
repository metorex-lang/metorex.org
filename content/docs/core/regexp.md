---
title: "Regexp"
slug: regexp
description: "The methods ruby/spec describes in core/regexp, and which Metorex implements."
---

ruby/spec describes 27 methods in `core/regexp`, and Metorex implements 27 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`Regexp#==`**: implemented, parameters `[[:req]]`. Returns `true` if `object` is another Regexp whose pattern, flags, and encoding are the same as `self`, `false` otherwise:
- **`Regexp#===`**: implemented, parameters `[[:req]]`. Returns `true` if `self` finds a match in `string`:
- **`Regexp#=~`**: implemented, parameters `[[:req]]`. Returns the integer index (in characters) of the first match for `self` and `string`, or `nil` if none; also sets the Regexp global variables:
- **`Regexp#casefold?`**: implemented, parameters `[]`. Returns `true` if the case-insensitivity flag in `self` is set, `false` otherwise: [An example calling it](/examples/regexp-matching).
- **`Regexp.compile`**: implemented, parameters `[[:req, :args]]`. Alias for Regexp.new
- **`Regexp#encoding`**: implemented, parameters `[]`. Returns an Encoding object that represents the encoding of `self`; see Encodings. [An example calling it](/examples/regexp-built-patterns).
- **`Regexp#eql?`**: implemented, parameters `[[:req]]`. Returns `true` if `object` is another Regexp whose pattern, flags, and encoding are the same as `self`, `false` otherwise: [An example calling it](/examples/array-methods-difference-of-structs).
- **`Regexp.escape`**: implemented, parameters `[[:req, :args]]`. Returns a new string that escapes any characters that have special meaning in a regular expression: [An example calling it](/examples/regexp-pattern-readings).
- **`Regexp#fixed_encoding?`**: implemented, parameters `[]`. Returns `false` if `self` is applicable to a string with any ASCII-compatible encoding; otherwise returns `true`:
- **`Regexp#hash`**: implemented, parameters `[]`. Returns the integer hash value for `self`. [An example calling it](/examples/regexp-named-groups).
- **`Regexp#initialize`**: implemented, parameters `[[:opt, :source], [:opt, :options], [:key, :timeout]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`Regexp#inspect`**: implemented, parameters `[]`. Returns a nicely-formatted string representation of `self`: [An example calling it](/examples/regexp-matching).
- **`Regexp.last_match`**: implemented, parameters `[[:req, :args]]`. With no argument, returns the value of <code>$~</code>, which is the result of the most recent pattern match (see Regexp global variables): [An example calling it](/examples/regexp-matching).
- **`Regexp.linear_time?`**: implemented, parameters `[[:req, :pattern], [:opt, :options]]`. Returns `true` if matching against `re` can be done in linear time to the input string. [An example calling it](/examples/regexp-pattern-readings).
- **`Regexp#match`**: implemented, parameters `[[:rest, :_arguments]]`. With no block given, returns the MatchData object that describes the match, if any, or `nil` if none; the search begins at the given character `offset` in `string`: [An example calling it](/examples/regexp-backtracking-engine).
- **`Regexp#match?`**: implemented, parameters `[[:rest, :_arguments]]`. Returns `true` or `false` to indicate whether the regexp is matched or not without updating $~ and other related variables. [An example calling it](/examples/c-extensions-c-procs).
- **`Regexp#named_captures`**: implemented, parameters `[]`. Returns a hash representing named captures of `self` (see Named Captures): [An example calling it](/examples/regexp-matching).
- **`Regexp#names`**: implemented, parameters `[]`. Returns an array of names of captures (see Named Captures): [An example calling it](/examples/regexp-matching).
- **`Regexp.new`**: implemented, parameters `[[:rest]]`. With argument `string` given, returns a new regexp with the given string and options: [An example calling it](/examples/regexp-built-patterns).
- **`Regexp#options`**: implemented, parameters `[]`. Returns an integer whose bits show the options set in `self`. [An example calling it](/examples/regexp-built-patterns).
- **`Regexp.quote`**: implemented, parameters `[[:req, :args]]`. Returns a new string that escapes any characters that have special meaning in a regular expression: [An example calling it](/examples/regexp-pattern-readings).
- **`Regexp#source`**: implemented, parameters `[]`. Returns the original string of `self`: [An example calling it](/examples/regexp-built-patterns).
- **`Regexp.timeout`**: implemented, parameters `[]`. It returns the current default timeout interval for Regexp matching in second. [An example calling it](/examples/regexp-pattern-time-limits).
- **`Regexp#to_s`**: implemented, parameters `[]`. Returns a string showing the options and string of `self`: [An example calling it](/examples/regexp-matching).
- **`Regexp.try_convert`**: implemented, parameters `[[:req, :held]]`. Returns `object` if it is a regexp: [An example calling it](/examples/regexp-pattern-readings).
- **`Regexp.union`**: implemented, parameters `[[:req, :args]]`. Returns a new regexp that is the union of the given patterns: [An example calling it](/examples/regexp-matching).
- **`Regexp#~`**: implemented, parameters `[]`. Equivalent to <code><i>rxp</i> =~ $_</code>:

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
