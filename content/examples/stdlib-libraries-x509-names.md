---
title: "stdlib_libraries/x509_names.rb"
slug: stdlib-libraries-x509-names
description: "The metorex example program stdlib_libraries/x509_names.rb and its output."
---

`tests/_examples/stdlib_libraries/x509_names.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/x509_names.rb){target=_blank rel=noopener}.

```metorex
# An X.509 distinguished name: a list of attributes, each with the ASN.1
# string type its value is written in. It is written in the forms OpenSSL
# prints, each escaping a different set of characters.
require "openssl"

name = OpenSSL::X509::Name.parse("/DC=org/DC=ruby-lang/CN=www.ruby-lang.org")
p(name.to_s)
p(name.to_a)
p(name.to_s(OpenSSL::X509::Name::RFC2253))
p(name.to_s(OpenSSL::X509::Name::ONELINE))
p(name.inspect)
p(OpenSSL::X509::Name.parse("C=US, O=Acme, commonName=x").to_a)

special = OpenSSL::X509::Name.new([["CN", "a+b"], ["O", "x,y"]])
p(special.to_s)
p(special.to_s(OpenSSL::X509::Name::RFC2253))
p(special.to_s(OpenSSL::X509::Name::ONELINE))
p(special.to_s(OpenSSL::X509::Name::MULTILINE))

p(OpenSSL::X509::Name.parse("/CN=A") == OpenSSL::X509::Name.parse("/CN=a"))
p(OpenSSL::X509::Name.parse("/CN=a") <=> OpenSSL::X509::Name.parse("/O=a"))
p(OpenSSL::X509::Name.parse("/C=US/CN=a").to_der.unpack1("H*"))

["hello", "hello=goodbye"].each do |written|
  begin
    OpenSSL::X509::Name.parse(written)
  rescue TypeError, OpenSSL::X509::NameError => error
    p([error.class, error.message])
  end
end
```

Output:

```
"/DC=org/DC=ruby-lang/CN=www.ruby-lang.org"
[["DC", "org", 22], ["DC", "ruby-lang", 22], ["CN", "www.ruby-lang.org", 12]]
"CN=www.ruby-lang.org,DC=ruby-lang,DC=org"
"DC = org, DC = ruby-lang, CN = www.ruby-lang.org"
"#<OpenSSL::X509::Name CN=www.ruby-lang.org,DC=ruby-lang,DC=org>"
[["C", "US", 19], ["O", "Acme", 12], ["CN", "x", 12]]
"/CN=a\\+b/O=x,y"
"O=x\\,y,CN=a\\+b"
"CN = \"a+b\", O = \"x,y\""
"commonName                = a+b\norganizationName          = x,y"
true
-1
"3019310b3009060355040613025553310a300806035504030c0161"
[TypeError, "no implicit conversion of nil into String"]
[OpenSSL::X509::NameError, "X509_NAME_add_entry_by_txt: invalid field name (name=hello)"]
```
