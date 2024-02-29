# Flutter Markdown Latex

[![Coverage Status](https://coveralls.io/repos/github/xushengs/flutter_markdown_latex/badge.svg?branch=main)](https://coveralls.io/github/xushengs/flutter_markdown_latex?branch=main) [![Pub Version](https://img.shields.io/pub/v/flutter_markdown_latex)](https://pub.dev/packages/flutter_markdown_latex)

This extension is created to enhance the functionality of the [flutter_markdown](https://pub.dev/packages/flutter_markdown) package by adding support for rendering LaTeX in markdown. The rendering of LaTeX is achieved through the utilization of the [flutter_math_fork](https://pub.dev/packages/flutter_math_fork) package.

## Rendering Samples

```text
This is inline latex: \$f(x) = \\sum_{i=0}^{n} \\frac{a_i}{1+x}\$

This is block level latex:

\$
c = \\pm\\sqrt{a^2 + b^2}
\$

This is inline latex with displayMode: \$\$f(x) = \\sum_{i=0}^{n} \\frac{a_i}{1+x}\$\$
```

![Example](https://github.com/xushengs/flutter_markdown_latex/raw/main/doc/img/demo.png)

## Getting Started

### Add dependency

Add `flutter_markdown_latex` to your `pubspec.yaml` dependencies.

### Import it

```dart
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
```

### Render it

```dart
// with default text style
MarkdownBody(
  selectable: true,
  data: 'latex: \$c = \\pm\\sqrt{a^2 + b^2}\$',
  builders: {
    'latex': LatexElementBuilder(),
  },
  extensionSet: md.ExtensionSet(
    [LatexBlockSyntax()],
    [LatexInlineSyntax()],
  ),
),

// with custom text style
MarkdownBody(
  selectable: true,
  data: 'latex: \$c = \\pm\\sqrt{a^2 + b^2}\$',
  builders: {
    'latex': LatexElementBuilder(
      textStyle: const TextStyle(color: Colors.blue),
      textScaleFactor: 1.2,
    ),
  },
  extensionSet: md.ExtensionSet(
    [LatexBlockSyntax()],
    [LatexInlineSyntax()],
  ),
),
```
