(function () {
  'use strict';

  // Shell ("$ ") and metorex REPL (">> ", ".. ") prompts.
  const PROMPT = /^(?:\$ |>> |\.\. )/;

  function copyableText(code) {
    const clone = code.cloneNode(true);

    clone.querySelectorAll('.line-number, [data-line-number]').forEach(function (number) {
      number.remove();
    });

    const lines = clone.textContent.replace(/\n$/, '').split('\n');

    if (!lines.some(function (line) { return PROMPT.test(line); })) {
      return lines.join('\n');
    }

    return lines
      .filter(function (line) { return PROMPT.test(line); })
      .map(function (line) { return line.replace(PROMPT, ''); })
      .join('\n');
  }

  document.querySelectorAll('pre > code').forEach(function (code) {
    const pre = code.parentElement;
    const button = document.createElement('button');

    button.type = 'button';
    button.className = 'copy-button';
    button.textContent = 'Copy';
    button.setAttribute('aria-label', 'Copy code to clipboard');

    button.addEventListener('click', function () {
      navigator.clipboard.writeText(copyableText(code)).then(function () {
        button.textContent = 'Copied';
        setTimeout(function () { button.textContent = 'Copy'; }, 1500);
      });
    });

    const wrapper = document.createElement('div');
    wrapper.className = 'code-block';
    pre.replaceWith(wrapper);
    wrapper.append(pre, button);
  });
})();
