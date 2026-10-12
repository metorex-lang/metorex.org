---
title: Theme sample
description: One code block covering each highlighted token class, built with --drafts to check the theme.
layout: page
draft: true
---

```metorex
# A comment
=begin
A block comment
=end
module Greeting
  DEFAULT = :hello

  def self.say(name, style: :plain)
    return "#{DEFAULT}, #{name}" if style == :plain
    'hello' unless name.nil?
  end
end

puts Greeting.say("Metorex") # => hello, Metorex
x ||= 1 <=> 2 => y
```
