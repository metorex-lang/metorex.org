---
title: "stdlib_libraries/http_headers_no_parens.rb"
slug: stdlib-libraries-http-headers-no-parens
description: "The metorex example program stdlib_libraries/http_headers_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/http_headers_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/http_headers_no_parens.rb).

```metorex
require 'net/http'

# A request carries its headers under case-insensitive names, and reads
# several values under one name back as a joined string.
request = Net::HTTP::Post.new "/orders"
request["Content-Type"] = "text/html; charset=utf-8"
request.add_field "X-Trace", "alpha"
request.add_field "X-Trace", "beta"

p request.method
p request.path
p request["content-type"]
p request["X-TRACE"]
p request.get_fields "x-trace"
p request.main_type
p request.sub_type
p request.content_type
p request.type_params
p request.key? "X-Trace"
p request.fetch "missing", "fallback"

request.content_length = 42
p request.content_length
request.range = 10..200
p request["Range"]
p request.range
request["Content-Range"] = "bytes 0-499/1234"
p request.content_range
p request.range_length

request.basic_auth "maintenance", "window"
p request["Authorization"]

request.set_form_data "cmd" => "search", "max" => "50"
p request.body.split("&").sort
p request["Content-Type"]

names = []
request.each_capitalized_name { |name| names << name }
p names.sort.include? "X-Trace"

p request.delete "X-Trace"
p request.key? "x-trace"
p request.chunked?
request["Transfer-Encoding"] = "chunked"
p request.chunked?
```

Output:

```
"POST"
"/orders"
"text/html; charset=utf-8"
"alpha, beta"
["alpha", "beta"]
"text"
"html"
"text/html"
{"charset" => "utf-8"}
true
"fallback"
42
"bytes=10-200"
[10..200]
0..499
500
"Basic bWFpbnRlbmFuY2U6d2luZG93"
["cmd=search", "max=50"]
"application/x-www-form-urlencoded"
true
["alpha", "beta"]
false
false
true
```
