---
title: "Set"
slug: set
description: "The methods ruby/spec describes in core/set, and which Metorex implements."
---

ruby/spec describes 60 methods in `core/set`, and Metorex implements 59 of them. The parameters are what `Method#parameters` answers under Metorex.

## Enumerable

- **`Enumerable#to_set`**: implemented, parameters `[[:rest, :args], [:block, :block]]`. Makes a set from the enumerable object with given arguments. [An example calling it](/examples/callables-blocks-and-methods).

## Set

- **`Set#&`**: implemented, parameters `[[:req]]`. Returns a new set containing elements common to the set and the given enumerable object.
- **`Set#+`**: implemented, parameters `[[:req]]`. Returns a new set built by merging the set and the elements of the given enumerable object.
- **`Set#-`**: implemented, parameters `[[:req]]`. Returns a new set built by duplicating the set, removing every element that appears in the given enumerable object.
- **`Set#<`**: implemented, parameters `[[:req]]`. Returns true if the set is a proper subset of the given set.
- **`Set#<<`**: implemented, parameters `[[:req]]`. Adds the given object to the set and returns self.
- **`Set#<=`**: implemented, parameters `[[:req]]`. Returns true if the set is a subset of the given set.
- **`Set#<=>`**: implemented, parameters `[[:req]]`. Returns 0 if the set are equal, -1 / 1 if the set is a proper subset / superset of the given set, or nil if they both have unique elements.
- **`Set#==`**: implemented, parameters `[[:req]]`. Returns true if two sets are equal.
- **`Set#===`**: implemented, parameters `[[:req]]`. Returns true if the set contains the given object:
- **`Set#>`**: implemented, parameters `[[:req]]`. Returns true if the set is a proper superset of the given set.
- **`Set#>=`**: implemented, parameters `[[:req]]`. Returns true if the set is a superset of the given set.
- **`Set#^`**: implemented, parameters `[[:req]]`. Returns a new set containing elements exclusive between the set and the given enumerable object.
- **`Set#add`**: implemented, parameters `[[:req]]`. Adds the given object to the set and returns self. [An example calling it](/examples/advanced-dsl-example).
- **`Set#add?`**: implemented, parameters `[[:req]]`. Adds the given object to the set and returns self. [An example calling it](/examples/sets-eql-members).
- **`Set#classify`**: implemented, parameters `[]`. Classifies the set by the return value of the given block and returns a hash of {value => set of elements} pairs. [An example calling it](/examples/sets-grouping-and-flattening).
- **`Set#clear`**: implemented, parameters `[]`. Removes all elements and returns self. [An example calling it](/examples/sets-set-algebra).
- **`Set#collect!`**: implemented, parameters `[]`. Replaces the elements with ones returned by `collect`.
- **`Set#compare_by_identity`**: implemented, parameters `[]`. Makes the set compare its elements by their identity and returns self. [An example calling it](/examples/sets-identity-members).
- **`Set#compare_by_identity?`**: implemented, parameters `[]`. Returns true if the set will compare its elements by their identity. [An example calling it](/examples/sets-identity-members).
- **`Set#delete`**: implemented, parameters `[[:req]]`. Deletes the given object from the set and returns self. [An example calling it](/examples/sets-eql-members).
- **`Set#delete?`**: implemented, parameters `[[:req]]`. Deletes the given object from the set and returns self.
- **`Set#delete_if`**: implemented, parameters `[]`. Deletes every element of the set for which block evaluates to true, and returns self. [An example calling it](/examples/sets-set-algebra).
- **`Set#difference`**: implemented, parameters `[[:req]]`. Returns a new set built by duplicating the set, removing every element that appears in the given enumerable object. [An example calling it](/examples/sets-set-algebra).
- **`Set#disjoint?`**: implemented, parameters `[[:req]]`. Returns true if the set and the given enumerable have no element in common. [An example calling it](/examples/sets-set-algebra).
- **`Set#divide`**: implemented, parameters `[[:block, :block]]`. Divides the set into a set of subsets according to the commonality defined by the given block. [An example calling it](/examples/sets-grouping-and-flattening).
- **`Set#each`**: implemented, parameters `[]`. Calls the given block once for each element in the set, passing the element as parameter. [An example calling it](/examples/sets-membership-and-allocation).
- **`Set#empty?`**: implemented, parameters `[]`. Returns true if the set contains no elements. [An example calling it](/examples/sets-set-algebra).
- **`Set#eql?`**: implemented, parameters `[[:req]]`. Returns true if two sets are equal. [An example calling it](/examples/sets-membership-and-allocation).
- **`Set#filter!`**: implemented, parameters `[]`. Equivalent to Set#keep_if, but returns nil if no changes were made.
- **`Set#flatten`**: implemented, parameters `[]`. Returns a new set that is a copy of the set, flattening each containing set recursively. [An example calling it](/examples/sets-grouping-and-flattening).
- **`Set#flatten!`**: implemented, parameters `[]`. Equivalent to Set#flatten, but replaces the receiver with the result in place. [An example calling it](/examples/sets-grouping-and-flattening).
- **`Set#flatten_merge`**: not implemented.
- **`Set#hash`**: implemented, parameters `[]`. Returns hash code for set. [An example calling it](/examples/sets-eql-members).
- **`Set#include?`**: implemented, parameters `[[:req]]`. Returns true if the set contains the given object: [An example calling it](/examples/sets-eql-members).
- **`Set#initialize`**: implemented, parameters `[[:opt, :enumerable], [:block, :block]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`Set#initialize_clone`**: implemented, parameters `[[:rest]]`.
- **`Set#inspect`**: implemented, parameters `[]`. Returns a new string containing the set entries: [An example calling it](/examples/sets-set-algebra).
- **`Set#intersect?`**: implemented, parameters `[[:req]]`. Returns true if the set and the given enumerable have at least one element in common. [An example calling it](/examples/sets-set-algebra).
- **`Set#intersection`**: implemented, parameters `[[:req]]`. Returns a new set containing elements common to the set and the given enumerable object. [An example calling it](/examples/sets-set-algebra).
- **`Set#join`**: implemented, parameters `[[:rest]]`. Returns a string created by converting each element of the set to a string. [An example calling it](/examples/sets-membership-and-allocation).
- **`Set#keep_if`**: implemented, parameters `[]`. Deletes every element of the set for which block evaluates to false, and returns self. [An example calling it](/examples/sets-set-algebra).
- **`Set#length`**: implemented, parameters `[]`. Returns the number of elements. [An example calling it](/examples/sets-grouping-and-flattening).
- **`Set#map!`**: implemented, parameters `[]`. Replaces the elements with ones returned by `collect`. [An example calling it](/examples/sets-identity-operands).
- **`Set#member?`**: implemented, parameters `[[:req]]`. Returns true if the set contains the given object: [An example calling it](/examples/sets-membership-and-allocation).
- **`Set#merge`**: implemented, parameters `[[:rest]]`. Merges the elements of the given enumerable objects to the set and returns self. [An example calling it](/examples/sets-identity-members).
- **`Set#pretty_print_cycle`**: implemented, parameters `[[:req, :printer]]`.
- **`Set#proper_subset?`**: implemented, parameters `[[:req]]`. Returns true if the set is a proper subset of the given set. [An example calling it](/examples/sets-set-algebra).
- **`Set#proper_superset?`**: implemented, parameters `[[:req]]`. Returns true if the set is a proper superset of the given set.
- **`Set#reject!`**: implemented, parameters `[]`. Equivalent to Set#delete_if, but returns nil if no changes were made. [An example calling it](/examples/array-methods-in-place-and-walks).
- **`Set#replace`**: implemented, parameters `[[:req]]`. Replaces the contents of the set with the contents of the given enumerable object and returns self. [An example calling it](/examples/sets-identity-operands).
- **`Set#select!`**: implemented, parameters `[]`. Equivalent to Set#keep_if, but returns nil if no changes were made. [An example calling it](/examples/array-methods-in-place-and-walks).
- **`Set#size`**: implemented, parameters `[]`. Returns the number of elements. [An example calling it](/examples/sets-eql-members).
- **`Set#subset?`**: implemented, parameters `[[:req]]`. Returns true if the set is a subset of the given set. [An example calling it](/examples/sets-eql-members).
- **`Set#subtract`**: implemented, parameters `[[:req]]`. Deletes every element that appears in the given enumerable object and returns self. [An example calling it](/examples/sets-set-algebra).
- **`Set#superset?`**: implemented, parameters `[[:req]]`. Returns true if the set is a superset of the given set. [An example calling it](/examples/sets-set-algebra).
- **`Set#to_a`**: implemented, parameters `[]`. Returns an array containing all elements in the set. [An example calling it](/examples/sets-grouping-and-flattening).
- **`Set#to_s`**: implemented, parameters `[]`. Returns a new string containing the set entries: [An example calling it](/examples/addresses-internet-addresses).
- **`Set#union`**: implemented, parameters `[[:req]]`. Returns a new set built by merging the set and the elements of the given enumerable object. [An example calling it](/examples/sets-identity-operands).
- **`Set#|`**: implemented, parameters `[[:req]]`. Returns a new set built by merging the set and the elements of the given enumerable object.

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
