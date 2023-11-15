import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:markdown/markdown.dart' as md;

import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';

final snapshots = {
  'readme example': 'katex: \$c = \\pm\\sqrt{a^2 + b^2}\$',
  'inline katex': '''
This is inline katex: \$c = \\pm\\sqrt{a^2 + b^2}\$
''',
  'block katex': '''
This is block level katex:

\$\$
c = \\pm\\sqrt{a^2 + b^2}
\$\$
''',
  'inline katex more \$': '''
This is inline katex with displayMode: \$\$c = \\pm\\sqrt{a^2 + b^2}\$\$
''',
  'inline katex 3 \$': '''
This is not inline katex: \$\$\$c = \\pm\\sqrt{a^2 + b^2}\$\$\$
''',
  'block katex more \$': '''
This is not katex:

\$\$\$
c = \\pm\\sqrt{a^2 + b^2}
\$\$\$
''',
  'block katex 1 \$': '''
This is block level katex:

\$
c = \\pm\\sqrt{a^2 + b^2}
\$
''',
  'not katex': 'not katex \$300 \$400',
  'not katex at beginning': '\$300 \$400 not katex',
  'not katex at end': 'not katex 300\$ 400\$',
  'block katex with \$ inside': '''
\$\$
\\colorbox{aqua}{\$
\\frac{b}{2}\\sqrt{a^2-\\frac{b^2}{4}}
a\$}
\$\$
''',
  'inline katex with \$ inside':
      'this is inline katex: \$a\\raisebox{0.25em}{\$b\$}c\$',
  'inline katex with a question mark after': 'this is inline katex: \$x\$?',
  'inline katex with an exclamation mark after': 'this is inline katex: \$x\$!',
  'inline katex with a period after': 'this is inline katex: \$x\$.',
  'inline katex with a comma after': 'this is inline katex: \$x\$,',
  'inline katex with a colon after': 'this is inline katex: \$x\$:',
  'inline katex \$\$...\$':
      'this is not katex: \$\$a\\raisebox{0.25em}{\$b\$}c\$',
  'inline katex \$...\$\$':
      'this is not katex: \$a\\raisebox{0.25em}{\$b\$}c\$\$',
  'slash \$': 'must include space between katex and end delimiter: \$ \\\$ \$',
  'block slash \$': '''
this is block katex:

\$\$
\\\$\\\$
\$\$
''',
  'inline katex with newline': '''
this is not katex: \$
c = \\pm\\sqrt{a^2 + b^2}
\$
''',
  'multiple inline katex \$': '''
this is katex: **pi:** \$\\pi\$ **theta:** \$\\theta\$
''',
  'multiple inline katex \$\$': '''
this is katex: **pi:** \$\$\\pi\$\$ **theta:** \$\$\\theta\$\$
''',
  'multiple block katex \$': '''
# pi:

\$
\\pi
\$

# theta:

\$
\\theta
\$
''',
  'multiple block katex \$\$': '''
# pi:

\$\$
\\pi
\$\$

# theta:

\$\$
\\theta
\$\$
'''
};

void main() {
  group('Latex Rules', () {
    snapshots.forEach((key, value) {
      testWidgets(key, (tester) async {
        await loadAppFonts();
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MarkdownBody(
                selectable: true,
                data: value,
                builders: {
                  'latex': LatexElementBuilder(),
                },
                extensionSet: md.ExtensionSet(
                  [LatexBlockSyntax()],
                  [LatexInlineSyntax()],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(MarkdownBody),
          matchesGoldenFile('goldens/$key.png'),
        );
      });
    });
  });
}
