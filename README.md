# Flutter Markdown Latex

[![Coverage Status](https://coveralls.io/repos/github/xushengs/flutter_markdown_latex/badge.svg?branch=main)](https://coveralls.io/github/xushengs/flutter_markdown_latex?branch=main) [![Pub Version](https://img.shields.io/pub/v/flutter_markdown_latex)](https://pub.dev/packages/flutter_markdown_latex)

This extension is created to enhance the functionality of the [flutter_markdown](https://pub.dev/packages/flutter_markdown) package by adding support for rendering LaTeX in markdown. The rendering of LaTeX is achieved through the utilization of the [flutter_math_fork](https://pub.dev/packages/flutter_math_fork) package.

## Rendering Samples

```text
This is inline latex: $f(x) = \sum_{i=0}^{n} \frac{a_i}{1+x}$

This is block level latex:

$$
c = \pm\sqrt{a^2 + b^2}
$$

This is inline latex with displayMode: $$f(x) = \sum_{i=0}^{n} \frac{a_i}{1+x}$$

The relationship between the height and the side length of an equilateral triangle is:

\[ \text{Height} = \frac{\sqrt{3}}{2} \times \text{Side Length} \]

\[ \text{X} = \frac{1}{2} \times \text{Y} \times \text{Z} = \frac{1}{2} \times 9 \times \frac{\sqrt{3}}{2} \times 9 = \frac{81\sqrt{3}}{4} \]

The basic form of the Taylor series is:

\[f(x) = f(a) + f'(a)(x-a) + \frac{f''(a)}{2!}(x-a)^2 + \frac{f'''(a)}{3!}(x-a)^3 + \cdots\]

where \(f(x)\) is the function to be expanded, \(a\) is the expansion point, \(f'(a)\), \(f''(a)\), \(f'''(a)\), etc., are the first, second, third, and so on derivatives of the function at point \(a\), and \(n!\) denotes the factorial of \(n\).

In particular, when \(a=0\), this expansion is called the Maclaurin series.
```

![Example](https://github.com/xushengs/flutter_markdown_latex/raw/main/doc/img/demo.jpg)

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
