---
title: "rex/mocks/verified_partials/spec/core_class_methods_spec.rb"
slug: rex-mocks-verified-partials-spec-core-class-methods-spec
description: "The metorex example program rex/mocks/verified_partials/spec/core_class_methods_spec.rb and its output."
---

`tests/_examples/rex/mocks/verified_partials/spec/core_class_methods_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/mocks/verified_partials/spec/core_class_methods_spec.rb).

```metorex
RSpec.describe "partial doubles of core class methods" do
  it "stubs a Kernel function" do
    expect(::Kernel).to receive(:warn).with("careful")
    ::Kernel.warn("careful")
  end

  it "stubs a native class method" do
    allow(File).to receive(:exist?).and_return(true)
    expect(File.exist?("/no/such/path")).to be true
  end

  it "checks a native class method's arguments" do
    allow(File).to receive(:exist?)
    File.exist?
  end

  it "restores the native class method" do
    expect(File.exist?("/no/such/path")).to be false
  end

  it "refuses a class method the class does not have" do
    allow(File).to receive(:no_such_method)
  end
end
```
