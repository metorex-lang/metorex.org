---
title: "oop/set_temporary_name_parens.rb"
slug: oop-set-temporary-name-parens
description: "The metorex example program oop/set_temporary_name_parens.rb and its output."
---

`tests/_examples/oop/set_temporary_name_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/oop/set_temporary_name_parens.rb).

```metorex
anonymous = Module.new
puts(anonymous.name.inspect)

puts((anonymous.set_temporary_name("fake_name") == anonymous).inspect)
puts(anonymous.name.inspect)
puts(anonymous.inspect)

anonymous.set_temporary_name("Template['foo.rb']")
puts(anonymous.name.inspect)

anonymous.set_temporary_name(nil)
puts(anonymous.name.inspect)

nested_host = Module.new
module nested_host::Inner; end
puts(nested_host::Inner.name.end_with?("::Inner").inspect)
nested_host.set_temporary_name("host")
puts(nested_host::Inner.name.inspect)
nested_host.set_temporary_name(nil)
puts(nested_host::Inner.name.inspect)

["", "Object", "A::B", "::A"].each do |candidate|
  begin
    Module.new.set_temporary_name(candidate)
    puts "#{candidate.inspect}: accepted"
  rescue ArgumentError => error
    puts "#{candidate.inspect}: #{error.message}"
  end
end

begin
  Object.set_temporary_name("fake_name")
rescue RuntimeError => error
  puts error.message
end
```

Output:

```
nil
true
"fake_name"
fake_name
"Template['foo.rb']"
nil
true
"host::Inner"
nil
"": empty class/module name
"Object": the temporary name must not be a constant path to avoid confusion
"A::B": the temporary name must not be a constant path to avoid confusion
"::A": the temporary name must not be a constant path to avoid confusion
can't change permanent name
```
