# Run under metorex. Reads lines of `Owner<TAB>#|.<TAB>name` and writes, for
# each, `yes<TAB>` and the method's parameters as metorex reports them, or
# `no` when metorex has no such method.
STDIN.each_line do |line|
  owner_name, kind, name = line.chomp.split("\t", 3)
  answer = begin
    owner = owner_name == "main" ? TOPLEVEL_BINDING.receiver : Object.const_get(owner_name)
    found = kind == "#" && owner.is_a?(Module) ? owner.instance_method(name) : owner.method(name)
    "yes\t#{found.parameters.inspect}"
  rescue StandardError
    "no"
  end
  puts answer
end
