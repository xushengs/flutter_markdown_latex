import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:markdown/markdown.dart' as md;

export 'package:flutter_math_fork/flutter_math.dart' show MathStyle;

class LatexElementBuilder extends MarkdownElementBuilder {
  LatexElementBuilder({
    this.textStyle,
    this.textScaleFactor,
    this.mathStyle = MathStyle.display,
  });

  /// The style to apply to the text.
  final TextStyle? textStyle;

  /// The text scale factor to apply to the text.
  final double? textScaleFactor;

  /// Math styles for equation elements.
  final MathStyle mathStyle;

  @override
  Widget visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) {
    final String text = element.textContent;
    if (text.isEmpty) {
      return const SizedBox();
    }

    return Math.tex(
      text,
      textStyle: textStyle,
      mathStyle: mathStyle,
      textScaleFactor: textScaleFactor,
    );
  }
}
