---
title: "introspection/tracepoint_attribute_methods_no_parens.rb"
slug: introspection-tracepoint-attribute-methods-no-parens
description: "The metorex example program introspection/tracepoint_attribute_methods_no_parens.rb and its output."
---

`tests/_examples/introspection/tracepoint_attribute_methods_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/introspection/tracepoint_attribute_methods_no_parens.rb){target=_blank rel=noopener}.

```metorex
class Rate
  attr_reader :amount
  attr_writer :region
  attr_accessor :currency

  def initialize
    @amount = 1
  end

  def total = amount * 2
end

rate = Rate.new
events = []
tracepoint = TracePoint.new :call, :c_call, :return, :c_return do |trace|
  events << [trace.event, trace.method_id] if %i[total amount region= currency currency=].include? trace.method_id
end
tracepoint.enable do
  rate.total
  rate.region = :west
  rate.currency = :usd
  rate.currency
end
events.each { |event| p event }
```

Output:

```
[:call, :total]
[:c_call, :amount]
[:c_return, :amount]
[:return, :total]
[:c_call, :region=]
[:c_return, :region=]
[:c_call, :currency=]
[:c_return, :currency=]
[:c_call, :currency]
[:c_return, :currency]
```
