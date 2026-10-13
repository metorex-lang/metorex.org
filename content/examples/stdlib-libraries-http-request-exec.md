---
title: "stdlib_libraries/http_request_exec.rb"
slug: stdlib-libraries-http-request-exec
description: "The metorex example program stdlib_libraries/http_request_exec.rb and its output."
---

`tests/_examples/stdlib_libraries/http_request_exec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/http_request_exec.rb){target=_blank rel=noopener}.

```metorex
require 'net/http'
require 'stringio'

# A request writes itself onto a buffered socket as a request line, its
# headers, and the body it carries.
wire = StringIO.new(+"")
socket = Net::BufferedIO.new(wire)

request = Net::HTTP::Post.new("/orders", "Content-Type" => "text/plain")
request.body = "maintenance window moves to 02:00"
request.exec(socket, "1.1", "/orders")
p wire.string.split("\r\n")

streamed = StringIO.new(+"")
request = Net::HTTP::Put.new("/orders", "Content-Type" => "text/plain",
                                        "Transfer-Encoding" => "chunked")
request.body_stream = StringIO.new("chunk me")
request.exec(Net::BufferedIO.new(streamed), "1.0", "/orders")
p streamed.string.split("\r\n")

# A stream with neither a length nor chunked framing has no way to be sent.
begin
  bare = Net::HTTP::Put.new("/orders", "Content-Type" => "text/plain")
  bare.body_stream = StringIO.new("chunk me")
  bare.exec(Net::BufferedIO.new(StringIO.new(+"")), "1.1", "/orders")
rescue ArgumentError => problem
  p problem.class
end

p request.request_body_permitted?
p request.response_body_permitted?
p Net::HTTP::Trace.new("/orders").inspect
```

Output:

```
["POST /orders HTTP/1.1", "Content-Type: text/plain", "Accept-Encoding: gzip;q=1.0,deflate;q=0.6,identity;q=0.3", "Accept: */*", "User-Agent: Ruby", "Content-Length: 33", "", "maintenance window moves to 02:00"]
["PUT /orders HTTP/1.0", "Content-Type: text/plain", "Transfer-Encoding: chunked", "Accept-Encoding: gzip;q=1.0,deflate;q=0.6,identity;q=0.3", "Accept: */*", "User-Agent: Ruby", "", "8", "chunk me", "0"]
ArgumentError
true
true
"#<Net::HTTP::Trace TRACE>"
```
