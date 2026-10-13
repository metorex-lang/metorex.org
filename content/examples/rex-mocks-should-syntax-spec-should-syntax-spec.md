---
title: "rex/mocks/should_syntax/spec/should_syntax_spec.rb"
slug: rex-mocks-should-syntax-spec-should-syntax-spec
description: "The metorex example program rex/mocks/should_syntax/spec/should_syntax_spec.rb and its output."
---

`tests/_examples/rex/mocks/should_syntax/spec/should_syntax_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/mocks/should_syntax/spec/should_syntax_spec.rb).

```metorex
class Printer
  def print_page(number) = "page #{number}"
end

describe "the should syntax for doubles" do
  it "sets an expectation with should_receive" do
    printer = Printer.new
    printer.should_receive(:print_page).with(1).and_return("stubbed")
    expect(printer.print_page(1)).to eq("stubbed")
  end

  it "stubs with stub" do
    printer = Printer.new
    printer.stub(:print_page).and_return("stub")
    expect(printer.print_page(2)).to eq("stub")
  end

  it "refuses with should_not_receive" do
    printer = Printer.new
    printer.should_not_receive(:print_page)
    printer.print_page(3)
  end

  it "reports an unmet should_receive" do
    printer = Printer.new
    printer.should_receive(:print_page)
  end
end
```
