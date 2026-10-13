---
title: "ENV"
slug: env
description: "The methods ruby/spec describes in core/env, and which Metorex implements."
---

ruby/spec describes 49 methods in `core/env`, and Metorex implements 49 of them. The parameters are what `Method#parameters` answers under Metorex.

- **`ENV.[]`**: implemented, parameters `[[:req]]`. Returns the value for the environment variable `name` if it exists:
- **`ENV.[]=`**: implemented, parameters `[[:req], [:req]]`. Creates, updates, or deletes the named environment variable, returning the value.
- **`ENV.assoc`**: implemented, parameters `[[:req]]`. Returns a 2-element Array containing the name and value of the environment variable for `name` if it exists: [An example calling it](/examples/builtins-environment-lookup-coercion).
- **`ENV.clear`**: implemented, parameters `[]`. Removes every environment variable; returns ENV:
- **`ENV#clone`**: implemented, parameters `[[:rest, :options]]`. Raises TypeError, because ENV is a wrapper for the process-wide environment variables and a clone is useless. [An example calling it](/examples/basics-complexes-protocol).
- **`ENV.delete`**: implemented, parameters `[[:req]]`. Deletes the environment variable with `name` if it exists and returns its value: [An example calling it](/examples/builtins-environment-lookup-coercion).
- **`ENV.delete_if`**: implemented, parameters `[]`. Yields each environment variable name and its value as a 2-element Array, deleting each environment variable for which the block returns a truthy value, and returning ENV (regardless of whether any deletions): [An example calling it](/examples/programs-spawn-failures).
- **`ENV#dup`**: implemented, parameters `[]`. Raises TypeError, because ENV is a singleton object. [An example calling it](/examples/addresses-sockets-of-every-kind).
- **`ENV.each`**: implemented, parameters `[]`. Yields each environment variable name and its value as a 2-element Array:
- **`ENV.each_key`**: implemented, parameters `[]`. Yields each environment variable name:
- **`ENV.each_pair`**: implemented, parameters `[]`. Yields each environment variable name and its value as a 2-element Array:
- **`ENV.each_value`**: implemented, parameters `[]`. Yields each environment variable value:
- **`ENV.empty?`**: implemented, parameters `[]`. Returns `true` when there are no environment variables, `false` otherwise:
- **`ENV.except`**: implemented, parameters `[[:rest]]`. Returns a hash except the given keys from ENV and their values.
- **`ENV.fetch`**: implemented, parameters `[[:rest]]`. If `name` is the name of an environment variable, returns its value: [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler).
- **`ENV.fetch_values`**: implemented, parameters `[[:rest]]`.
- **`ENV.filter`**: implemented, parameters `[]`. Yields each environment variable name and its value as a 2-element Array, returning a Hash of the names and values for which the block returns a truthy value:
- **`ENV.filter!`**: implemented, parameters `[]`. Yields each environment variable name and its value as a 2-element Array, deleting each entry for which the block returns `false` or `nil`, and returning ENV if any deletions made, or `nil` otherwise:
- **`ENV.has_key?`**: implemented, parameters `[[:req]]`. Returns `true` if there is an environment variable with the given `name`: [An example calling it](/examples/builtins-environment-lookup-coercion).
- **`ENV.has_value?`**: implemented, parameters `[[:req]]`. Returns `true` if `value` is the value for some environment variable name, `false` otherwise: [An example calling it](/examples/builtins-environment-lookup-coercion).
- **`ENV.include?`**: implemented, parameters `[[:req]]`. Returns `true` if there is an environment variable with the given `name`: [An example calling it](/examples/builtins-environment-lookup-coercion).
- **`ENV.inspect`**: implemented, parameters `[]`. Returns the contents of the environment as a String:
- **`ENV.invert`**: implemented, parameters `[]`. Returns a Hash whose keys are the ENV values, and whose values are the corresponding ENV names:
- **`ENV.keep_if`**: implemented, parameters `[]`. Yields each environment variable name and its value as a 2-element Array, deleting each environment variable for which the block returns `false` or `nil`, and returning ENV:
- **`ENV.key`**: implemented, parameters `[[:req]]`. Returns the name of the first environment variable with `value`, if it exists: [An example calling it](/examples/builtins-environment-lookup-coercion).
- **`ENV.key?`**: implemented, parameters `[[:req]]`. Returns `true` if there is an environment variable with the given `name`: [An example calling it](/examples/builtins-environment-lookup-coercion).
- **`ENV.keys`**: implemented, parameters `[]`. Returns all variable names in an Array:
- **`ENV.length`**: implemented, parameters `[]`. Returns the count of environment variables:
- **`ENV.member?`**: implemented, parameters `[[:req]]`. Returns `true` if there is an environment variable with the given `name`: [An example calling it](/examples/builtins-environment-lookup-coercion).
- **`ENV.merge!`**: implemented, parameters `[[:rest]]`. Adds to ENV each key/value pair in the given `hash`; returns ENV:
- **`ENV.rassoc`**: implemented, parameters `[[:req]]`. Returns a 2-element Array containing the name and value of the **first** **found** environment variable that has value `value`, if one exists: [An example calling it](/examples/builtins-environment-lookup-coercion).
- **`ENV.rehash`**: implemented, parameters `[]`. (Provided for compatibility with Hash.)
- **`ENV.reject`**: implemented, parameters `[]`. Yields each environment variable name and its value as a 2-element Array.
- **`ENV.reject!`**: implemented, parameters `[]`. Similar to ENV.delete_if, but returns `nil` if no changes were made.
- **`ENV.replace`**: implemented, parameters `[[:req]]`. Replaces the entire content of the environment variables with the name/value pairs in the given `hash`; returns ENV. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler).
- **`ENV.select`**: implemented, parameters `[]`. Yields each environment variable name and its value as a 2-element Array, returning a Hash of the names and values for which the block returns a truthy value:
- **`ENV.select!`**: implemented, parameters `[]`. Yields each environment variable name and its value as a 2-element Array, deleting each entry for which the block returns `false` or `nil`, and returning ENV if any deletions made, or `nil` otherwise:
- **`ENV.shift`**: implemented, parameters `[]`. Removes the first environment variable from ENV and returns a 2-element Array containing its name and value:
- **`ENV.size`**: implemented, parameters `[]`. Returns the count of environment variables:
- **`ENV.slice`**: implemented, parameters `[[:rest]]`. Returns a Hash of the given ENV names and their corresponding values:
- **`ENV.store`**: implemented, parameters `[[:req], [:req]]`. Creates, updates, or deletes the named environment variable, returning the value.
- **`ENV.to_a`**: implemented, parameters `[]`. Returns the contents of ENV as an Array of 2-element Arrays, each of which is a name/value pair:
- **`ENV.to_h`**: implemented, parameters `[]`. With no block, returns a Hash containing all name/value pairs from ENV: [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-settings).
- **`ENV.to_hash`**: implemented, parameters `[]`. Returns a Hash containing all name/value pairs from ENV: [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler).
- **`ENV.to_s`**: implemented, parameters `[]`. Returns String 'ENV':
- **`ENV.update`**: implemented, parameters `[[:rest]]`. Adds to ENV each key/value pair in the given `hash`; returns ENV:
- **`ENV.value?`**: implemented, parameters `[[:req]]`. Returns `true` if `value` is the value for some environment variable name, `false` otherwise: [An example calling it](/examples/builtins-environment-lookup-coercion).
- **`ENV.values`**: implemented, parameters `[]`. Returns all environment variable values in an Array:
- **`ENV.values_at`**: implemented, parameters `[[:rest]]`. Returns an Array containing the environment variable values associated with the given names:

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt).
