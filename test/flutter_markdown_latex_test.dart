import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:markdown/markdown.dart' as md;

import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';

final snapshots = {
  'readme example': 'latex: \$c = \\pm\\sqrt{a^2 + b^2}\$',
  'inline latex': '''
This is inline latex: \$c = \\pm\\sqrt{a^2 + b^2}\$
''',
  'block latex': '''
This is block level latex:

\$\$
c = \\pm\\sqrt{a^2 + b^2}
\$\$
''',
  'inline latex more \$': '''
This is inline latex with displayMode: \$\$c = \\pm\\sqrt{a^2 + b^2}\$\$
''',
  'inline latex 3 \$': '''
This is not inline latex: \$\$\$c = \\pm\\sqrt{a^2 + b^2}\$\$\$
''',
  'block latex more \$': '''
This is not latex:

\$\$\$
c = \\pm\\sqrt{a^2 + b^2}
\$\$\$
''',
  'block latex 1 \$': '''
This is block level latex:

\$
c = \\pm\\sqrt{a^2 + b^2}
\$
''',
  'not latex': 'not latex \$300 \$400',
  'not latex at beginning': '\$300 \$400 not latex',
  'not latex at end': 'not latex 300\$ 400\$',
  'block latex with \$ inside': '''
\$\$
\\colorbox{aqua}{\$
\\frac{b}{2}\\sqrt{a^2-\\frac{b^2}{4}}
a\$}
\$\$
''',
  'inline latex with \$ inside':
      'this is inline latex: \$a\\raisebox{0.25em}{\$b\$}c\$',
  'inline latex with a question mark after': 'this is inline latex: \$x\$?',
  'inline latex with an exclamation mark after': 'this is inline latex: \$x\$!',
  'inline latex with a period after': 'this is inline latex: \$x\$.',
  'inline latex with a comma after': 'this is inline latex: \$x\$,',
  'inline latex with a colon after': 'this is inline latex: \$x\$:',
  'inline latex \$\$...\$':
      'this is not latex: \$\$a\\raisebox{0.25em}{\$b\$}c\$',
  'inline latex \$...\$\$':
      'this is not latex: \$a\\raisebox{0.25em}{\$b\$}c\$\$',
  'slash \$': 'must include space between latex and end delimiter: \$ \\\$ \$',
  'block slash \$': '''
this is block latex:

\$\$
\\\$\\\$
\$\$
''',
  'inline latex with newline': '''
this is not latex: \$
c = \\pm\\sqrt{a^2 + b^2}
\$
''',
  'multiple inline latex \$': '''
this is latex: **pi:** \$\\pi\$ **theta:** \$\\theta\$
''',
  'multiple inline latex \$\$': '''
this is latex: **pi:** \$\$\\pi\$\$ **theta:** \$\$\\theta\$\$
''',
  'multiple block latex \$': '''
# pi:

\$
\\pi
\$

# theta:

\$
\\theta
\$
''',
  'multiple block latex \$\$': '''
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
                styleSheet: MarkdownStyleSheet(
                  p: const TextStyle(fontSize: 16, fontFamily: 'FlutterTest'),
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
