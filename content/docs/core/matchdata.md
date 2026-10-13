---
title: "MatchData"
slug: matchdata
description: "The methods ruby/spec describes in core/matchdata, and which Metorex implements."
---

ruby/spec describes 31 methods in `core/matchdata`, and Metorex implements 29 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`MatchData#==`**: implemented, parameters `[[:req, :other]]`. Returns `true` if `object` is another MatchData object whose target string, regexp, match, and captures are the same as `self`, `false` otherwise.
- **`MatchData#[Symbol]`**: not implemented.
- **`MatchData#[]`**: implemented, parameters `[[:rest, :keys]]`. When arguments `index`, +start and `length`, or `range` are given, returns match and captures in the style of Array#[]:
- **`MatchData.allocate`**: implemented, parameters `[[:req, :args]]`. [An example calling it](/examples/sets-membership-and-allocation).
- **`MatchData#begin`**: implemented, parameters `[[:req, :key]]`. Returns the offset (in characters) of the beginning of the specified match. [An example calling it](/examples/encodings-regexp-encodings).
- **`MatchData#bytebegin`**: implemented, parameters `[[:req, :key]]`. Returns the offset (in bytes) of the beginning of the specified match.
- **`MatchData#byteend`**: implemented, parameters `[[:req, :key]]`. Returns the offset (in bytes) of the end of the specified match.
- **`MatchData#byteoffset`**: implemented, parameters `[[:req, :key]]`. Returns a two-element array containing the beginning and ending byte-based offsets of the *n*th match.
- **`MatchData#captures`**: implemented, parameters `[]`. Returns the array of captures, which are all matches except <code>m[0]</code>: [An example calling it](/examples/regexp-matching).
- **`MatchData#deconstruct`**: implemented, parameters `[]`. Returns the array of captures, which are all matches except <code>m[0]</code>: [An example calling it](/examples/data-objects-value-objects).
- **`MatchData#deconstruct_keys`**: implemented, parameters `[[:req, :keys]]`. Returns a hash of the named captures for the given names. [An example calling it](/examples/data-objects-data-member-keys).
- **`MatchData#dup`**: implemented, parameters `[]`. Produces a shallow copy of *obj*---the instance variables of *obj* are copied, but not the objects they reference. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`MatchData#end`**: implemented, parameters `[[:req, :key]]`. Returns the offset (in characters) of the end of the specified match. [An example calling it](/examples/control-flow-if-expression).
- **`MatchData#eql?`**: implemented, parameters `[[:req, :other]]`. Returns `true` if `object` is another MatchData object whose target string, regexp, match, and captures are the same as `self`, `false` otherwise. [An example calling it](/examples/array-methods-difference-of-structs).
- **`MatchData#hash`**: implemented, parameters `[]`. Returns the integer hash value for `self`, based on the target string, regexp, match, and captures. [An example calling it](/examples/array-methods-difference-of-structs).
- **`MatchData#inspect`**: implemented, parameters `[]`. Returns a string representation of `self`: [An example calling it](/examples/addresses-internet-addresses).
- **`MatchData#integer_at`**: not implemented.
- **`MatchData#length`**: implemented, parameters `[]`. Returns size of the match array: [An example calling it](/examples/advanced-parenless-splat).
- **`MatchData#match`**: implemented, parameters `[[:req, :key]]`. Returns the matched substring corresponding to the given argument. [An example calling it](/examples/builtins-frozen-answers).
- **`MatchData#match_length`**: implemented, parameters `[[:req, :key]]`. Returns the length (in characters) of the matched substring corresponding to the given argument. [An example calling it](/examples/regexp-matching).
- **`MatchData#named_captures`**: implemented, parameters `[[:key, :symbolize_names]]`. Returns a hash of the named captures; each key is a capture name; each value is its captured string or `nil`: [An example calling it](/examples/regexp-matching).
- **`MatchData#names`**: implemented, parameters `[]`. Returns an array of the capture names (see Named Captures): [An example calling it](/examples/c-extensions-c-globals).
- **`MatchData#offset`**: implemented, parameters `[[:req, :key]]`. Returns a 2-element array containing the beginning and ending offsets (in characters) of the specified match. [An example calling it](/examples/dates-clock-and-calendar).
- **`MatchData#post_match`**: implemented, parameters `[]`. Returns the substring of the target string from the end of the first match in `self` (that is, <code>self[0]</code>) to the end of the string; equivalent to regexp global variable <code>$'</code>: [An example calling it](/examples/regexp-matching).
- **`MatchData#pre_match`**: implemented, parameters `[]`. Returns the substring of the target string from its beginning up to the first match in `self` (that is, <code>self[0]</code>); equivalent to regexp global variable <code>$`</code>: [An example calling it](/examples/builtins-string-encodings).
- **`MatchData#regexp`**: implemented, parameters `[]`. Returns the regexp that produced the match: [An example calling it](/examples/regexp-named-groups).
- **`MatchData#size`**: implemented, parameters `[]`. Returns size of the match array: [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).
- **`MatchData#string`**: implemented, parameters `[]`. Returns the target string if it was frozen; otherwise, returns a frozen copy of the target string: [An example calling it](/examples/builtins-frozen-answers).
- **`MatchData#to_a`**: implemented, parameters `[]`. Returns the array of matches: [An example calling it](/examples/advanced-threads-wait-on-streams).
- **`MatchData#to_s`**: implemented, parameters `[]`. Returns the matched string: [An example calling it](/examples/addresses-internet-addresses).
- **`MatchData#values_at`**: implemented, parameters `[[:rest, :keys]]`. Returns match and captures at the given `indexes`, which may include any mixture of: [An example calling it](/examples/array-methods-set-operations-and-lookup).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
