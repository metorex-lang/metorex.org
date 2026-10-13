---
title: "introspection/instance_variables_order.rb"
slug: introspection-instance-variables-order
description: "The metorex example program introspection/instance_variables_order.rb and its output."
---

`tests/_examples/introspection/instance_variables_order.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/instance_variables_order.rb){target=_blank rel=noopener}.

```metorex
class Recipe
  def initialize
    @name = "stew"
    @servings = 4
    @vegetarian = false
  end
end

recipe = Recipe.new
puts recipe.instance_variables.inspect

recipe.instance_variable_set(:@rating, 5)
puts recipe.instance_variables.inspect

puts Object.new.instance_variables.inspect
puts nil.instance_variables.inspect
puts 42.instance_variables.inspect
```

Output:

```
[:@name, :@servings, :@vegetarian]
[:@name, :@servings, :@vegetarian, :@rating]
[]
[]
[]
```
