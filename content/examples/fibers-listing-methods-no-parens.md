---
title: "fibers/listing_methods_no_parens.rb"
slug: fibers-listing-methods-no-parens
description: "The metorex example program fibers/listing_methods_no_parens.rb and its output."
---

`tests/_examples/fibers/listing_methods_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/fibers/listing_methods_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Fiber#raise is a public method of Fiber itself.
p Fiber.public_instance_methods(false).include? :raise
p Fiber.instance_method(:raise).owner
```

Output:

```
true
Fiber
```
