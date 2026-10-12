(function () {
  'use strict';

  const KEYWORDS = new Set([
    'def', 'class', 'if', 'elsif', 'else', 'unless', 'while', 'until', 'for', 'in', 'end', 'do',
    'begin', 'rescue', 'ensure', 'raise', 'break', 'next', 'redo', 'retry', 'return', 'lambda',
    'super', 'yield', 'defined?', 'case', 'when', 'then', 'attr_reader', 'attr_writer',
    'attr_accessor', 'module', 'include', 'extend', 'alias', 'true', 'false', 'nil', 'self',
    '__FILE__', '__LINE__', '__dir__', '__ENCODING__', 'and', 'or', 'not', 'require',
  ]);

  const PATTERNS = [
    { kind: 'comment', re: /^=begin\b[\s\S]*?\n=end\b[^\n]*/ },
    { kind: 'comment', re: /^#[^\n]*/ },
    { kind: 'string', re: /^"(?:\\.|[^"\\])*"/ },
    { kind: 'string', re: /^'(?:\\.|[^'\\])*'/ },
    { kind: 'plain', re: /^::/ },
    { kind: 'symbol', re: /^:"(?:\\.|[^"\\])*"/ },
    { kind: 'symbol', re: /^:[A-Za-z_]\w*[?!=]?/ },
    { kind: 'symbol', re: /^[a-z_]\w*[?!]?:(?!:)/ },
    { kind: 'plain', re: /^[@$]{1,2}[A-Za-z_]\w*/ },
    { kind: 'constant', re: /^[A-Z]\w*/ },
    { kind: 'word', re: /^[a-z_]\w*[?!]?/ },
    { kind: 'plain', re: /^\d[\d_]*(?:\.\d+)?/ },
  ];

  function escapeHtml(text) {
    return text.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
  }

  function highlight(source) {
    let html = '';
    let rest = source;
    let atLineStart = true;

    while (rest.length > 0) {
      let matched = null;
      let kind = null;

      for (const pattern of PATTERNS) {
        if (pattern.re.source.startsWith('^=begin') && !atLineStart) {
          continue;
        }

        const match = pattern.re.exec(rest);

        if (match) {
          matched = match[0];
          kind = pattern.kind;
          break;
        }
      }

      if (matched === null) {
        matched = rest[0];
        kind = 'plain';
      }

      if (kind === 'word') {
        kind = KEYWORDS.has(matched) ? 'keyword' : 'plain';
      }

      html += kind === 'plain'
        ? escapeHtml(matched)
        : `<span class="tok-${kind}">${escapeHtml(matched)}</span>`;

      atLineStart = matched.endsWith('\n');
      rest = rest.slice(matched.length);
    }

    return html;
  }

  document.querySelectorAll('pre code.language-metorex, pre code.language-ruby').forEach(function (block) {
    block.innerHTML = highlight(block.textContent);
  });
})();
