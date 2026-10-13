---
title: "encodings/normalized_text.rb"
slug: encodings-normalized-text
description: "The metorex example program encodings/normalized_text.rb and its output."
---

`tests/_examples/encodings/normalized_text.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/encodings/normalized_text.rb){target=_blank rel=noopener}.

```metorex
# Unicode names four forms a run of text may be written in: two that keep
# what each character means and two that also fold the characters that only
# look alike. `unicode_normalize` answers the text in the form asked for.
accented = "ẛ̣"

p accented.unicode_normalize(:nfc).codepoints
p accented.unicode_normalize(:nfd).codepoints
p accented.unicode_normalize(:nfkc).codepoints
p accented.unicode_normalize(:nfkd).codepoints

# Without a form named, the composed one stands.
p "Å".unicode_normalize.codepoints
p "Ω".unicode_normalize.codepoints

# Whether the text is already written that way.
p accented.unicode_normalized?(:nfc)
p accented.unicode_normalized?(:nfd)
p "abc".unicode_normalized?
p "".unicode_normalized?

# A Hangul syllable comes apart by counting rather than by a table.
p "가".unicode_normalize(:nfd).codepoints
p "가".unicode_normalize(:nfc).codepoints

# The bang form writes the answer back into the string.
held = +"à"
held.unicode_normalize! :nfc
p held.codepoints
```

Output:

```
[7835, 803]
[383, 803, 775]
[7785]
[115, 803, 775]
[197]
[937]
true
false
true
true
[4352, 4449]
[44032]
[224]
```
