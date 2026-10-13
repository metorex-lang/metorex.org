---
title: "dsl/html_builder.rb"
slug: dsl-html-builder
description: "The metorex example program dsl/html_builder.rb and its output."
---

`tests/_examples/dsl/html_builder.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/dsl/html_builder.rb).

```metorex
# HTML Builder DSL
# Demonstrates method chaining and string building with OOP

class HtmlElement
  def initialize(tag, content)
    @tag = tag
    @content = content
    @attrs = ""
  end

  def set_attr(name, value)
    @attrs = @attrs + " " + name + "=\"" + value + "\""
    self
  end

  def to_html
    "<#{@tag}#{@attrs}>#{@content}</#{@tag}>"
  end
end

class HtmlBuilder
  def initialize
    @elements = []
  end

  def tag(name, content)
    el = HtmlElement.new(name, content)
    @elements.push(el)
    el
  end

  def heading(level, content)
    self.tag("h#{level}", content)
  end

  def paragraph(content)
    self.tag("p", content)
  end

  def span(content)
    self.tag("span", content)
  end

  def to_html
    result = ""
    @elements.each do |el|
      result = result + el.to_html + "\n"
    end
    result
  end
end

builder = HtmlBuilder.new
builder.heading(1, "Welcome to Metorex")
builder.paragraph("A meta-object programming language.").set_attr("class", "intro")
builder.span("Highlighted text").set_attr("class", "highlight").set_attr("id", "main")
puts builder.to_html
```

Output:

```
<h1>Welcome to Metorex</h1>
<p class="intro">A meta-object programming language.</p>
<span class="highlight" id="main">Highlighted text</span>
```
