---
title: "advanced/networking.rb"
slug: advanced-networking
description: "The metorex example program advanced/networking.rb and its output."
---

`tests/_examples/advanced/networking.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/networking.rb).

```metorex
response = HTTP.get("https://api.example.com/data")
puts response.body

server = HTTPServer.new(port: 3000)
server.route "/hello" do |request|
  Response.new(body: "Hello, World!")
end
server.start
```
