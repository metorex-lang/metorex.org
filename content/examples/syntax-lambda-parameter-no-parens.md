---
title: "syntax/lambda_parameter_no_parens.rb"
slug: syntax-lambda-parameter-no-parens
description: "The metorex example program syntax/lambda_parameter_no_parens.rb and its output."
---

`tests/_examples/syntax/lambda_parameter_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/lambda_parameter_no_parens.rb){target=_blank rel=noopener}.

```metorex
# `lambda` is a method rather than a keyword, so a parameter may take its
# name and the body reads it as that parameter.

def pick value, lambda
  lambda ? [:lambda, value] : [:proc, value]
end

p pick(1, true)
p pick(2, false)
```

Output:

```
[:lambda, 1]
[:proc, 2]
```
