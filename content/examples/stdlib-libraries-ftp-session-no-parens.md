---
title: "stdlib_libraries/ftp_session_no_parens.rb"
slug: stdlib-libraries-ftp-session-no-parens
description: "The metorex example program stdlib_libraries/ftp_session_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/ftp_session_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/ftp_session_no_parens.rb){target=_blank rel=noopener}.

```metorex
require 'net/ftp'

# A session holds the settings a transfer runs under before it has reached
# any server.
Net::FTP.default_passive = false
ftp = Net::FTP.new
p ftp.binary
p ftp.passive
p ftp.debug_mode
p ftp.resume
p ftp.open_timeout
p ftp.read_timeout
p ftp.closed?

ftp.binary = false
ftp.passive = true
ftp.debug_mode = true
ftp.resume = true
p [ftp.binary, ftp.passive, ftp.debug_mode, ftp.resume]
p ftp.close

# Options name the same settings, and a private data connection without TLS
# is refused.
configured = Net::FTP.new nil, passive: true, debug_mode: true, read_timeout: 100,
                            open_timeout: 42, ssl_handshake_timeout: 23
p [configured.passive, configured.debug_mode, configured.read_timeout]
p [configured.open_timeout, configured.ssl_handshake_timeout]

begin
  Net::FTP.new nil, private_data_connection: true
rescue ArgumentError => problem
  p problem.message
end

# The error classes name what the server refused.
p Net::FTPPermError.ancestors.include? Net::FTPError
p Net::FTPTempError.ancestors.include? Net::FTPError
p Net::FTPReplyError.ancestors.include? Net::FTPError
p Net::FTPProtoError.ancestors.include? Net::FTPError
```

Output:

```
true
false
false
false
nil
60
true
[false, true, true, true]
nil
[true, true, 100]
[42, 23]
"private_data_connection can be set to true only when ssl is enabled"
true
true
true
true
```
