---
title: "stdlib_libraries/http_response_no_parens.rb"
slug: stdlib-libraries-http-response-no-parens
description: "The metorex example program stdlib_libraries/http_response_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/http_response_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/http_response_no_parens.rb).

```metorex
require 'net/http'
require 'stringio'

# A response reads its status line and headers off a buffered socket, and
# the class it comes back as says what the code means.
raw = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nX-Trace: alpha\r\n\r\nmaintenance window moves to 02:00\n"
socket = Net::BufferedIO.new StringIO.new(raw)
response = Net::HTTPResponse.read_new socket

p response.class
p response.code
p response.message
p response.http_version
p response["content-type"]
p response.to_hash
p response.code_type
p response.error_type
p Net::HTTPOK.body_permitted?
p Net::HTTPInformation.body_permitted?

response.reading_body socket, true do
  p response.inspect
end
p response.body
p response.inspect
p response.value

# A response outside the 2xx range raises the exception its class names.
failed = Net::HTTPNotFound.new "1.1", "404", "Not Found"
begin
  failed.value
rescue Net::HTTPClientException => problem
  p problem.class
  p problem.message
  p problem.response.equal? failed
end

redirect = Net::HTTPFound.new "1.1", "302", "Found"
begin
  redirect.error!
rescue Net::HTTPRetriableError => problem
  p problem.class
end
```

Output:

```
Net::HTTPOK
"200"
"OK"
"1.1"
"text/plain"
{"content-type" => ["text/plain"], "x-trace" => ["alpha"]}
Net::HTTPOK
Net::HTTPError
true
false
"#<Net::HTTPOK 200 OK readbody=false>"
"maintenance window moves to 02:00\n"
"#<Net::HTTPOK 200 OK readbody=true>"
nil
Net::HTTPClientException
"404 \"Not Found\""
true
Net::HTTPRetriableError
```
