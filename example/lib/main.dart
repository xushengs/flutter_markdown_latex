import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:markdown/markdown.dart' as md;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Markdown Latex Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  static const _text =
      '''This is inline latex: \$f(x) = \\sum_{i=0}^{n} \\frac{a_i}{1+x}\$

This is block level latex:

\$
c = \\pm\\sqrt{a^2 + b^2}
\$

This is inline latex with displayMode: \$\$f(x) = \\sum_{i=0}^{n} \\frac{a_i}{1+x}\$\$

To calculate the area of an equilateral triangle using trigonometric functions, one can consider using the length of the side and the height. The relationship between the height and the side length of an equilateral triangle is:

\\[ \\text{Height} = \\frac{\\sqrt{3}}{2} \\times \\text{Side Length} \\]

\\[ \\text{X} = \\frac{1}{2} \\times \\text{Y} \\times \\text{Z} = \\frac{1}{2} \\times 9 \\times \\frac{\\sqrt{3}}{2} \\times 9 = \\frac{81\\sqrt{3}}{4} \\]

''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Latex Markdown Example'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Markdown(
            selectable: true,
            data: _text,
            builders: {
              'latex': LatexElementBuilder(
                textStyle: const TextStyle(
                  // color: Colors.blue,
                  fontWeight: FontWeight.w100,
                ),
                textScaleFactor: 1.2,
              ),
            },
            extensionSet: md.ExtensionSet(
              [LatexBlockSyntax()],
              [LatexInlineSyntax()],
            ),
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
