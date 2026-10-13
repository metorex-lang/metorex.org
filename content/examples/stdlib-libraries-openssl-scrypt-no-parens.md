---
title: "stdlib_libraries/openssl_scrypt_no_parens.rb"
slug: stdlib-libraries-openssl-scrypt-no-parens
description: "The metorex example program stdlib_libraries/openssl_scrypt_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/openssl_scrypt_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/openssl_scrypt_no_parens.rb){target=_blank rel=noopener}.

```metorex
# scrypt derives a key from a password through a table of earlier states,
# so working it out takes memory as well as time. Every parameter is a
# keyword, N is a power of two above 1, and r and p are positive.
require "openssl"

settings = { salt: "\x00".b * 16, N: 2**10, r: 8, p: 1, length: 16 }
key = OpenSSL::KDF.scrypt("secret", **settings)
p key.unpack1("H*")
p OpenSSL::KDF.scrypt("secret", **settings, length: 4).unpack1("H*")
p OpenSSL::KDF.scrypt("secret", **settings) == key
p OpenSSL::KDF.scrypt("", **settings, salt: "", length: 0)

[{ N: 3 }, { r: 0 }, { p: 0 }].each do |wrong|
  begin
    OpenSSL::KDF.scrypt("secret", **settings, **wrong)
  rescue OpenSSL::KDF::KDFError => error
    p [wrong, error.message]
  end
end
begin
  OpenSSL::KDF.scrypt("secret", salt: "")
rescue ArgumentError => error
  p error.message
end
```

Output:

```
"300420e0918b3cc46a24504429ff1f43"
"300420e0"
true
""
[{N: 3}, "EVP_PBE_scrypt"]
[{r: 0}, "EVP_PBE_scrypt"]
[{p: 0}, "EVP_PBE_scrypt"]
"missing keywords: :N, :r, :p, :length"
```
