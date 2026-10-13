---
title: "fibers/listing_methods.rb"
slug: fibers-listing-methods
description: "The metorex example program fibers/listing_methods.rb and its output."
---

`tests/_examples/fibers/listing_methods.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/fibers/listing_methods.rb){target=_blank rel=noopener}.

```metorex
# Fiber#raise is a public method of Fiber itself.
p(Fiber.public_instance_methods(false).include?(:raise))
p(Fiber.instance_method(:raise).owner)
```

Output:

```
true
Fiber
```
