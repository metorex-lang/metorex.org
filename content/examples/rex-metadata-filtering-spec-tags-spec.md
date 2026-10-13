---
title: "rex/metadata/filtering/spec/tags_spec.rb"
slug: rex-metadata-filtering-spec-tags-spec
description: "The metorex example program rex/metadata/filtering/spec/tags_spec.rb and its output."
---

`tests/_examples/rex/metadata/filtering/spec/tags_spec.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/metadata/filtering/spec/tags_spec.rb){target=_blank rel=noopener}.

```metorex
describe "tagged examples" do
  it "runs fast", :fast do
    expect(1).to eq(1)
  end

  it "runs slow", :slow do
    expect(2).to eq(2)
  end

  it "has a priority", priority: :high do
    expect(3).to eq(3)
  end

  it "has a version", version: 3 do
    expect(4).to eq(4)
  end

  context "a fast group", :fast do
    it "inherits the tag" do
      expect(5).to eq(5)
    end
  end
end
```
