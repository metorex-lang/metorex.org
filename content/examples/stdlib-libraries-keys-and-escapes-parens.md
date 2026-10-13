---
title: "stdlib_libraries/keys_and_escapes_parens.rb"
slug: stdlib-libraries-keys-and-escapes-parens
description: "The metorex example program stdlib_libraries/keys_and_escapes_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/keys_and_escapes_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/keys_and_escapes_parens.rb){target=_blank rel=noopener}.

```metorex
# Digests keyed with a secret, keys derived from a password, and escaping
# text for a URL or a page.

require 'openssl'
require 'cgi/escape'

# A digest is named the way OpenSSL names one, in any spelling.
p(OpenSSL::Digest.new("sha1").name)
p(OpenSSL::Digest::SHA256.new.name)
p(OpenSSL::Digest.hexdigest "sha256", "abc")
p(OpenSSL::Digest.new("SHA1").digest_length)
p(OpenSSL::Digest.new("SHA512").block_length)

# A keyed digest says both what the message is and that whoever wrote it
# held the key.
message = "The quick brown fox jumps over the lazy dog"
p(OpenSSL::HMAC.hexdigest OpenSSL::Digest.new("SHA1"), "key", message)

# A key derived from a password takes as long to guess as it does to derive.
settings = {salt: "salt", iterations: 100, length: 16, hash: "sha1"}
derived = OpenSSL::KDF.pbkdf2_hmac "secret", **settings
p(derived.length)
p(derived == OpenSSL::KDF.pbkdf2_hmac("secret", **settings))

# Comparing without letting how long it takes say where two strings differ.
p(OpenSSL.fixed_length_secure_compare "abc", "abc")
p(OpenSSL.fixed_length_secure_compare "abc", "abd")

# A URL carries only a few characters as themselves.
p(CGI.escape "a b&c~")
p(CGI.unescape "a+b%26c")
p(CGI.escapeURIComponent "a b/c")
p(CGI.unescapeURIComponent "a%20b%2Fc")

# A page reads five characters as markup.
p(CGI.escapeHTML %[& < > " '])
p(CGI.unescapeHTML "&amp; &lt; &gt; &quot; &#99;")
p(CGI.escapeElement '<BR><A HREF="url"></A>', "A")
p(CGI.unescapeElement '<BR>&lt;A HREF=&quot;url&quot;&gt;', "A")
```

Output:

```
"SHA1"
"SHA256"
"ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
20
128
"de7c9b85b8b78aa6bc8a7a36f70a90701c9db4d9"
16
true
true
false
"a+b%26c~"
"a b&c"
"a%20b%2Fc"
"a b/c"
"&amp; &lt; &gt; &quot; &#39;"
"& < > \" c"
"<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;"
"<BR><A HREF=\"url\">"
```
